package com.wjs.shop.goods.service;

import java.util.List;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.whale.system.common.util.LangUtil;
import org.whale.system.common.util.Strings;

import org.whale.system.base.BaseDao;
import org.whale.system.base.Page;
import org.whale.system.service.BaseService;
import com.wjs.shop.goods.dao.GoodsDao;
import com.wjs.shop.goods.domain.Goods;

/**
 * 商品管理
 *
 * @author wjs
 * 2016-5-20 15:09:52
 */
@Service
public class GoodsService extends BaseService<Goods, Long> {

	@Autowired
	private GoodsDao goodsDao;
	

	public void queryPage(Page page, Goods goods){
		page.newCmd(Goods.class).like("name", goods.getName()).like("code", goods.getCode()).like("title", goods.getTitle());
		
		this.queryPage(page);
	}

	@Override
	public BaseDao<Goods, Long> getDao() {
		return goodsDao;
	}

}