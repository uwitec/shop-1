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
import org.whale.system.common.util.ListUtil;
import org.whale.system.common.util.Strings;
import org.whale.system.common.util.WebUtil;

import com.wjs.shop.goods.service.CategoryAttrService;
import com.wjs.shop.goods.domain.CategoryAttr;

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
	private CategoryAttrService categoryAttrService;

    @Auth(code="categoryAttr:list", name="查询商品分类属性")
	@RequestMapping("/goTree")
	public ModelAndView goTree(){
	
		return new ModelAndView("yb/categoryAttr/categoryAttr_tree");
	}


	@Auth(code="categoryAttr:list", name="查询商品分类属性")
	@RequestMapping("/goList")
	public ModelAndView goList(Long id){

		return new ModelAndView("yb/categoryAttr/categoryAttr_list").addObject("id", id);
	}

	@Auth(code="categoryAttr:list", name="查询商品分类属性")
	@ResponseBody
	@RequestMapping("/doList")
	public Page doList(CategoryAttr categoryAttr){
		Page page = this.newPage();
		this.categoryAttrService.queryPage(page, categoryAttr);
		return page;
	}

	@Auth(code="categoryAttr:save", name="新增商品分类属性")
	@RequestMapping("/goSave")
	public ModelAndView goSave(){
		
		return new ModelAndView("yb/categoryAttr/categoryAttr_save");
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
	public ModelAndView goUpdate(Long id){
		CategoryAttr categoryAttr = null;
		if(id == null || (categoryAttr = this.categoryAttrService.get(id)) == null ){
			throw new SysException("查找不到 商品分类属性 id="+id);
		}
		return new ModelAndView("yb/categoryAttr/categoryAttr_update").addObject("item", categoryAttr);
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
	public ModelAndView goView(Long id){
		CategoryAttr categoryAttr = this.categoryAttrService.get(id);
		if(categoryAttr == null){
			throw new SysException("查找不到 商品分类属性 id="+id);
		}
		
		return new ModelAndView("yb/categoryAttr/categoryAttr_view")
				.addObject("item", categoryAttr);
	}

	@Auth(code="categoryAttr:del", name="删除商品分类属性")
	@ResponseBody
	@RequestMapping("/doDel")
	public Rs doDel(String ids){
		if(Strings.isBlank(ids)){
			return Rs.fail("请选择要删除的记录");
		}
		List<Long> idList = ListUtil.longList(ids);
		this.categoryAttrService.deleteBatch(idList);

		return Rs.success("["+idList.size()+"]条记录删除成功");
	}

}