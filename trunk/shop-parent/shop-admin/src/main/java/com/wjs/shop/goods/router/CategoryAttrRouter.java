package com.wjs.shop.goods.router;

import com.wjs.shop.goods.dao.CategoryAttrDao;
import com.wjs.shop.goods.domain.Category;
import com.wjs.shop.goods.domain.CategoryAttr;
import com.wjs.shop.goods.service.CategoryAttrService;
import com.wjs.shop.goods.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.whale.system.annotation.auth.Auth;
import org.whale.system.base.BaseRouter;
import org.whale.system.base.Page;
import org.whale.system.base.Rs;
import org.whale.system.common.exception.BusinessException;
import org.whale.system.common.exception.SysException;
import org.whale.system.common.util.ListUtil;
import org.whale.system.common.util.Strings;

import java.util.List;

/**
 * 商品分类属性控制器
 *
 * @author wjs
 * 2016-5-17 16:56:03
 */
@Controller
@RequestMapping("/categoryAttr")
public class CategoryAttrRouter extends BaseRouter {

	@Autowired
	private CategoryAttrDao categoryAttrDao;
	@Autowired
	private CategoryAttrService categoryAttrService;
	@Autowired
	private CategoryService categoryService;

	@Auth(code="categoryAttr:list", name="查询商品分类属性")
	@RequestMapping("/goList")
	public ModelAndView goList(Integer categoryId){
		//倒序导航
		List<Category> parents = this.categoryService.recurCategory(categoryId);
		ListUtil.reverse(parents);

		return new ModelAndView("shop/goods/categoryAttr/categoryAttr_list")
				.addObject("categoryId", categoryId)
				.addObject("parents", parents)
				.addObject("lastIndex", parents.size() - 1);
	}

	@Auth(code="categoryAttr:list", name="查询商品分类属性")
	@ResponseBody
	@RequestMapping("/doList")
	public Page doList(Integer categoryId){
		Page page = this.newPage();
		page.setPageSize(1000);
		this.categoryAttrService.queryPage(page, categoryId);
		return page;
	}

	@Auth(code="categoryAttr:save", name="新增商品分类属性")
	@RequestMapping("/goSave")
	public ModelAndView goSave(Integer categoryId){

		Category category = this.categoryService.get(categoryId);
		if (category == null){
			throw new BusinessException("商品分类["+categoryId+"]不存在");
		}
		
		return new ModelAndView("shop/goods/categoryAttr/categoryAttr_save")
				.addObject("nextSort", this.categoryAttrDao.nextSort(categoryId))
				.addObject("category", category);
	}

	@Auth(code="categoryAttr:save", name="新增商品分类属性")
	@ResponseBody
	@RequestMapping("/doSave")
	public Rs doSave(CategoryAttr categoryAttr){
	
		this.categoryAttrService.save(categoryAttr);
		return Rs.success();
	}

	@Auth(code="categoryAttr:update", name="更新商品分类属性")
	@RequestMapping("/goUpdate")
	public ModelAndView goUpdate(Integer id){
		CategoryAttr categoryAttr = null;
		if(id == null || (categoryAttr = this.categoryAttrService.get(id)) == null ){
			throw new SysException("查找不到 商品分类属性 id="+id);
		}
		return new ModelAndView("shop/goods/categoryAttr/categoryAttr_update").addObject("item", categoryAttr);
	}

	@Auth(code="categoryAttr:update", name="更新商品分类属性")
	@ResponseBody
	@RequestMapping("/doUpdate")
	public Rs doUpdate(CategoryAttr categoryAttr){
	
		this.categoryAttrService.update(categoryAttr);
		return Rs.success();
	}

	@Auth(code="categoryAttr:view", name="查看商品分类属性")
	@RequestMapping("/goView")
	public ModelAndView goView(Integer id){
		CategoryAttr categoryAttr = this.categoryAttrService.get(id);
		if(categoryAttr == null){
			throw new SysException("查找不到 商品分类属性 id="+id);
		}
		
		return new ModelAndView("shop/goods/categoryAttr/categoryAttr_view")
				.addObject("item", categoryAttr);
	}

	@Auth(code="categoryAttr:del", name="删除商品分类属性")
	@ResponseBody
	@RequestMapping("/doDel")
	public Rs doDel(String ids){
		if(Strings.isBlank(ids)){
			return Rs.fail("请选择要删除的记录");
		}
		List<Integer> idList = ListUtil.intList(ids);
		this.categoryAttrService.deleteBatch(idList);

		return Rs.success("["+idList.size()+"]条记录删除成功");
	}

}