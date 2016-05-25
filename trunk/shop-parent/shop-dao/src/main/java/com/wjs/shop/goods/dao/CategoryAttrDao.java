package com.wjs.shop.goods.dao;

import org.springframework.stereotype.Repository;

import org.whale.system.base.BaseDao;
import com.wjs.shop.goods.domain.CategoryAttr;

/**
 * 商品分类属性Dao 
 *
 * @author wjs
 * 2016-5-17 16:56:03
 */
@Repository
public class CategoryAttrDao extends BaseDao<CategoryAttr, Integer> {

    final String nextOrder_SQL = "select max(sort) as sort FROM g_category_attr WHERE categoryId=?";
    /**
     * 获取下一个排序
     * @param categoryId
     * @return
     */
	public Integer nextSort(Integer categoryId){
        Integer maxSort = this.count(nextOrder_SQL, categoryId);
        if (maxSort == null){
            return 1;
        }
        return maxSort+1;
    }
}