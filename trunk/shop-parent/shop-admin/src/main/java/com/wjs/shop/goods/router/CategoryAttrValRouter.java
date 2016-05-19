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

import com.wjs.shop.goods.service.CategoryAttrValService;
import com.wjs.shop.goods.domain.CategoryAttrVal;

/**
 * 商品分类属性值控制器
 *
 * @author wjs
 * 2016-5-17 16:57:24
 */
@Controller
@RequestMapping("/categoryAttrVal")
public class CategoryAttrValRouter extends BaseRouter {

	@Autowired
	private CategoryAttrValService categoryAttrValService;

    @Auth(code="categoryAttrVal:list", name="查询商品分类属性值")
	@RequestMapping("/goTree")
	public ModelAndView goTree(){
	
		return new ModelAndView("yb/categoryAttrVal/categoryAttrVal_tree");
	}


	@Auth(code="categoryAttrVal:list", name="查询商品分类属性值")
	@RequestMapping("/goList")
	public ModelAndView goList(Long id){

		return new ModelAndView("yb/categoryAttrVal/categoryAttrVal_list").addObject("id", id);
	}

	@Auth(code="categoryAttrVal:list", name="查询商品分类属性值")
	@ResponseBody
	@RequestMapping("/doList")
	public Page doList(CategoryAttrVal categoryAttrVal){
		Page page = this.newPage();
		this.categoryAttrValService.queryPage(page, categoryAttrVal);
		return page;
	}

	@Auth(code="categoryAttrVal:save", name="新增商品分类属性值")
	@RequestMapping("/goSave")
	public ModelAndView goSave(){
		
		return new ModelAndView("yb/categoryAttrVal/categoryAttrVal_save");
	}

	@Auth(code="categoryAttrVal:save", name="新增商品分类属性值")
	@ResponseBody
	@RequestMapping("/doSave")
	public Rs doSave(CategoryAttrVal categoryAttrVal){
	
		this.categoryAttrValService.save(categoryAttrVal);
		return Rs.success();
	}

	@Auth(code="categoryAttrVal:update", name="更新商品分类属性值")
	@RequestMapping("/goUpdate")
	public ModelAndView goUpdate(Long id){
		CategoryAttrVal categoryAttrVal = null;
		if(id == null || (categoryAttrVal = this.categoryAttrValService.get(id)) == null ){
			throw new SysException("查找不到 商品分类属性值 id="+id);
		}
		return new ModelAndView("yb/categoryAttrVal/categoryAttrVal_update").addObject("item", categoryAttrVal);
	}

	@Auth(code="categoryAttrVal:update", name="更新商品分类属性值")
	@ResponseBody
	@RequestMapping("/doUpdate")
	public Rs doUpdate(CategoryAttrVal categoryAttrVal){
	
		this.categoryAttrValService.update(categoryAttrVal);
		return Rs.success();
	}

	@Auth(code="categoryAttrVal:view", name="查看商品分类属性值")
	@RequestMapping("/goView")
	public ModelAndView goView(Long id){
		CategoryAttrVal categoryAttrVal = this.categoryAttrValService.get(id);
		if(categoryAttrVal == null){
			throw new SysException("查找不到 商品分类属性值 id="+id);
		}
		
		return new ModelAndView("yb/categoryAttrVal/categoryAttrVal_view")
				.addObject("item", categoryAttrVal);
	}

	@Auth(code="categoryAttrVal:del", name="删除商品分类属性值")
	@ResponseBody
	@RequestMapping("/doDel")
	public Rs doDel(String ids){
		if(Strings.isBlank(ids)){
			return Rs.fail("请选择要删除的记录");
		}
		List<Long> idList = ListUtil.longList(ids);
		this.categoryAttrValService.deleteBatch(idList);

		return Rs.success("["+idList.size()+"]条记录删除成功");
	}

}