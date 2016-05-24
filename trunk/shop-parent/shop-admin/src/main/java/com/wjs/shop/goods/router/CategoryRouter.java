package com.wjs.shop.goods.router;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import org.whale.system.base.Cmd;
import org.whale.system.base.Page;
import org.whale.system.base.Rs;
import org.whale.system.base.BaseRouter;
import org.whale.system.annotation.auth.Auth;
import org.whale.system.common.exception.OrmException;
import org.whale.system.common.exception.SysException;
import org.whale.system.common.util.LangUtil;
import org.whale.system.common.util.ListUtil;
import org.whale.system.common.util.Strings;
import org.whale.system.common.util.WebUtil;

import com.wjs.shop.goods.service.CategoryService;
import com.wjs.shop.goods.domain.Category;

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
	private CategoryService categoryService;

    @Auth(code="category:list", name="查询商品分类")
	@RequestMapping("/goTree")
	public ModelAndView goTree(){
	
		return new ModelAndView("shop/goods/category/category_tree");
	}


	@Auth(code="category:list", name="查询商品分类")
	@RequestMapping("/goList")
	public ModelAndView goList(Integer id){

		return new ModelAndView("shop/goods/category/category_list").addObject("id", id);
	}

	@Auth(code="category:list", name="查询商品分类")
	@ResponseBody
	@RequestMapping("/doList")
	public Page doList(Category category){
		Page page = this.newPage();
		this.categoryService.queryPage(page, category);
		return page;
	}

	@Auth(code="category:save", name="新增商品分类")
	@RequestMapping("/goSave")
	public ModelAndView goSave(){
		
		return new ModelAndView("shop/goods/category/category_save");
	}

	@Auth(code="category:save", name="新增商品分类")
	@ResponseBody
	@RequestMapping("/doSave")
	public Rs doSave(Category category){
	
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
		return new ModelAndView("shop/goods/category/category_update").addObject("item", category);
	}

	@Auth(code="category:update", name="更新商品分类")
	@ResponseBody
	@RequestMapping("/doUpdate")
	public Rs doUpdate(Category category){
	
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

		return Rs.success("["+idList.size()+"]条记录删除成功");
	}

}