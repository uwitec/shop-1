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
import com.wjs.shop.goods.dao.CategoryDao;
import com.wjs.shop.goods.domain.Category;

/**
 * 商品分类管理
 *
 * @author wjs
 * 2016-5-17 15:39:32
 */
@Service
public class CategoryService extends BaseService<Category, Integer> {

	@Autowired
	private CategoryDao categoryDao;
	

	public void queryPage(Page page, Category category){
		page.newCmd(Category.class);
		
		this.queryPage(page);
	}

	@Override
	public BaseDao<Category, Integer> getDao() {
		return categoryDao;
	}

}