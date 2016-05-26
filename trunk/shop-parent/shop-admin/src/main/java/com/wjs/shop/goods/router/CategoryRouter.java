package com.wjs.shop.goods.router;

import com.alibaba.fastjson.JSON;
import com.wjs.shop.goods.dao.CategoryDao;
import com.wjs.shop.goods.domain.Category;
import com.wjs.shop.goods.service.CategoryAttrService;
import com.wjs.shop.goods.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.whale.system.annotation.auth.Auth;
import org.whale.system.annotation.jdbc.Validate;
import org.whale.system.base.BaseRouter;
import org.whale.system.base.Page;
import org.whale.system.base.Rs;
import org.whale.system.common.exception.SysException;
import org.whale.system.common.util.ListUtil;
import org.whale.system.common.util.Strings;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 商品分类控制器
 *
 * @author wjs
 * 2016-5-17 15:39:32
 */
@Controller
@RequestMapping("/category")
public class CategoryRouter extends BaseRouter {

	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private CategoryAttrService categoryAttrService;

    @Auth(code="category:list", name="查询商品分类")
	@RequestMapping("/goTree")
	public ModelAndView goTree(Integer selId){
		List<Category> categoryList = this.categoryService.queryAll();
	
		return new ModelAndView("shop/goods/category/category_tree")
				.addObject("nodes", categoryList == null ? "[]" : JSON.toJSONString(categoryList))
				.addObject("selId", selId == null ? 0 : selId);
	}

	@Auth(code="category:list", name="查询商品分类")
	@RequestMapping("/goRouter")
	public ModelAndView goRouter(HttpServletRequest request, Integer selId){
		if (selId == 0){
			return this.goList(selId);
		}else{
			Category category = this.categoryService.get(selId);
			if (category.getGoodsFlag()){ //重定向 跳转到商品分类属性列表
				ModelAndView view = new ModelAndView();
				view.setViewName("redirect:" + request.getContextPath()+"/categoryAttr/goList?categoryId="+selId);
				return view;
			}else {
				return this.goList(selId);
			}
		}
	}

	@Auth(code="category:list", name="查询商品分类")
	@RequestMapping("/goList")
	public ModelAndView goList(Integer selId){
		//倒序导航
		List<Category> parents = this.categoryService.recurCategory(selId);
		ListUtil.reverse(parents);

		//子节点中存在可挂商品的节点，则列表显示属性列
		boolean goodsFlag = false;
		List<Category> children = this.categoryDao.queryByPid(selId == null ? 0 : selId);
		if (children != null && children.size() > 0){
			for (Category child : children){
				if (child.getGoodsFlag()){
					goodsFlag = true;
					break;
				}
			}
		}

		return new ModelAndView("shop/goods/category/category_list")
				.addObject("selId", selId)
				.addObject("goodsFlag", goodsFlag)
				.addObject("parents", parents)
				.addObject("lastIndex", parents.size()-1);
	}

	@Auth(code="category:list", name="查询商品分类")
	@ResponseBody
	@RequestMapping("/doList")
	public Page doList(Integer selId, Boolean goodsFlag){
		Page page = this.newPage();
		page.setPageSize(1000);
		this.categoryService.queryPage(page, selId, goodsFlag);
		return page;
	}

	@Auth(code="category:save", name="新增商品分类")
	@RequestMapping("/goSave")
	public ModelAndView goSave(Integer selId){
		List<Category> categoryList = this.categoryDao.queryNotGoodsFlag();
		
		return new ModelAndView("shop/goods/category/category_save")
				.addObject("nodes", categoryList == null ? "[]" : JSON.toJSONString(categoryList))
				.addObject("selId", selId == null ? 0 : selId)
				.addObject("nextSort", this.categoryDao.nextOrder(selId));
	}

	@Auth(code="category:save", name="新增商品分类")
	@ResponseBody
	@RequestMapping("/doSave")
	public Rs doSave(@Validate Category category){
		this.categoryService.save(category);
		return Rs.success();
	}

	@Auth(code="category:update", name="更新商品分类")
	@RequestMapping("/goUpdate")
	public ModelAndView goUpdate(Integer id){
		Category category = null;
		if(id == null || (category = this.categoryService.get(id)) == null ){
			throw new SysException("查找不到 商品分类 id="+id);
		}

		List<Category> categoryList = this.categoryDao.queryNotGoodsFlag();
		return new ModelAndView("shop/goods/category/category_update")
				.addObject("item", category)
				.addObject("nodes", categoryList == null ? "[]" : JSON.toJSONString(categoryList));
	}

	@Auth(code="category:update", name="更新商品分类")
	@ResponseBody
	@RequestMapping("/doUpdate")
	public Rs doUpdate(@Validate Category category){
	
		this.categoryService.update(category);
		return Rs.success();
	}

	@Auth(code="category:view", name="查看商品分类")
	@RequestMapping("/goView")
	public ModelAndView goView(Integer id){
		Category category = this.categoryService.get(id);
		if(category == null){
			throw new SysException("查找不到 商品分类 id="+id);
		}
		
		return new ModelAndView("shop/goods/category/category_view")
				.addObject("item", category);
	}

	@Auth(code="category:del", name="删除商品分类")
	@ResponseBody
	@RequestMapping("/doDel")
	public Rs doDel(String ids){
		if(Strings.isBlank(ids)){
			return Rs.fail("请选择要删除的记录");
		}
		List<Integer> idList = ListUtil.intList(ids);
		this.categoryService.deleteBatch(idList);

		return Rs.success("[" + idList.size() + "]条记录删除成功");
	}

	@Auth(code="category:show", name="显示隐藏商品分类")
	@ResponseBody
	@RequestMapping("/doShow")
	public Rs doShow(Integer id, boolean showFlag){

		this.categoryService.transShow(id, showFlag);

		return Rs.success();
	}

	@Auth(code="category:move", name="修改商品分类排序")
	@ResponseBody
	@RequestMapping("/doMove")
	public Rs doMove(Integer id, boolean downFlag){

		this.categoryService.transMove(id, downFlag);

		return Rs.success();
	}

}