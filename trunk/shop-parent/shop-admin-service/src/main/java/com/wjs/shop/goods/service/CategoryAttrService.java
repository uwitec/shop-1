package com.wjs.shop.goods.service;

import com.wjs.shop.goods.dao.CategoryAttrDao;
import com.wjs.shop.goods.domain.CategoryAttr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.whale.system.base.BaseDao;
import org.whale.system.base.Page;
import org.whale.system.service.BaseService;

/**
 * 商品分类属性管理
 *
 * @author wjs
 * 2016-5-17 16:56:03
 */
@Service
public class CategoryAttrService extends BaseService<CategoryAttr, Integer> {

	@Autowired
	private CategoryAttrDao categoryAttrDao;
	

	public void queryPage(Page page, Integer categoryId){
		page.newQ(CategoryAttr.class).selectAppend(", (SELECT group_concat(a.`val`) from g_category_attr_val v where v.categoryAttrId = t.id ORDER BY v.sort asc) as attrVals").eq(CategoryAttr.F_categoryId, categoryId).asc(CategoryAttr.F_sort);
		
		this.queryPage(page);
	}

	@Override
	public BaseDao<CategoryAttr, Integer> getDao() {
		return categoryAttrDao;
	}

}