package com.wjs.shop.goods.router;

import com.wjs.shop.goods.domain.Goods;
import com.wjs.shop.goods.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.whale.system.annotation.auth.Auth;
import org.whale.system.base.BaseRouter;
import org.whale.system.base.Page;
import org.whale.system.base.Rs;
import org.whale.system.common.exception.SysException;
import org.whale.system.common.util.ListUtil;
import org.whale.system.common.util.Strings;

import java.util.List;

/**
 * 商品控制器
 *
 * @author wjs
 * 2016-5-20 15:09:52
 */
@Controller
@RequestMapping("/goods")
public class GoodsRouter extends BaseRouter {

	@Autowired
	private GoodsService goodsService;

    @Auth(code="goods:list", name="查询商品")
	@RequestMapping("/goTree")
	public ModelAndView goTree(){
	
		return new ModelAndView("shop/goods/goods/goods_tree");
	}


	@Auth(code="goods:list", name="查询商品")
	@RequestMapping("/goList")
	public ModelAndView goList(Long id){

		return new ModelAndView("shop/goods/goods/goods_list").addObject("id", id);
	}

	@Auth(code="goods:list", name="查询商品")
	@ResponseBody
	@RequestMapping("/doList")
	public Page doList(Goods goods){
		Page page = this.newPage();
		this.goodsService.queryPage(page, goods);
		return page;
	}

	@Auth(code="goods:save", name="新增商品")
	@RequestMapping("/goSave")
	public ModelAndView goSave(){
		
		return new ModelAndView("shop/goods/goods/goods_save");
	}

	@Auth(code="goods:save", name="新增商品")
	@ResponseBody
	@RequestMapping("/doSave")
	public Rs doSave(Goods goods){
	
		this.goodsService.save(goods);
		return Rs.success();
	}

	@Auth(code="goods:update", name="更新商品")
	@RequestMapping("/goUpdate")
	public ModelAndView goUpdate(Long id){
		Goods goods = null;
		if(id == null || (goods = this.goodsService.get(id)) == null ){
			throw new SysException("查找不到 商品 id="+id);
		}
		return new ModelAndView("shop/goods/goods/goods_update").addObject("item", goods);
	}

	@Auth(code="goods:update", name="更新商品")
	@ResponseBody
	@RequestMapping("/doUpdate")
	public Rs doUpdate(Goods goods){
	
		this.goodsService.update(goods);
		return Rs.success();
	}

	@Auth(code="goods:view", name="查看商品")
	@RequestMapping("/goView")
	public ModelAndView goView(Long id){
		Goods goods = this.goodsService.get(id);
		if(goods == null){
			throw new SysException("查找不到 商品 id="+id);
		}
		
		return new ModelAndView("shop/goods/goods/goods_view")
				.addObject("item", goods);
	}

	@Auth(code="goods:del", name="删除商品")
	@ResponseBody
	@RequestMapping("/doDel")
	public Rs doDel(String ids){
		if(Strings.isBlank(ids)){
			return Rs.fail("请选择要删除的记录");
		}
		List<Long> idList = ListUtil.longList(ids);
		this.goodsService.deleteBatch(idList);

		return Rs.success("["+idList.size()+"]条记录删除成功");
	}

}