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
import com.wjs.shop.goods.dao.CategoryAttrValDao;
import com.wjs.shop.goods.domain.CategoryAttrVal;

/**
 * 商品分类属性值管理
 *
 * @author wjs
 * 2016-5-17 16:57:24
 */
@Service
public class CategoryAttrValService extends BaseService<CategoryAttrVal, Long> {

	@Autowired
	private CategoryAttrValDao categoryAttrValDao;
	

	public void queryPage(Page page, CategoryAttrVal categoryAttrVal){
		page.newCmd(CategoryAttrVal.class);
		
		this.queryPage(page);
	}

	@Override
	public BaseDao<CategoryAttrVal, Long> getDao() {
		return categoryAttrValDao;
	}

}