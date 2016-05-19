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
import com.wjs.shop.goods.dao.CategoryAttrDao;
import com.wjs.shop.goods.domain.CategoryAttr;

/**
 * 商品分类属性管理
 *
 * @author wjs
 * 2016-5-17 16:56:03
 */
@Service
public class CategoryAttrService extends BaseService<CategoryAttr, Long> {

	@Autowired
	private CategoryAttrDao categoryAttrDao;
	

	public void queryPage(Page page, CategoryAttr categoryAttr){
		page.newCmd(CategoryAttr.class);
		
		this.queryPage(page);
	}

	@Override
	public BaseDao<CategoryAttr, Long> getDao() {
		return categoryAttrDao;
	}

}