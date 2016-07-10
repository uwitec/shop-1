package com.wjs.shop.goods.dao;

import org.springframework.stereotype.Repository;

import org.whale.system.base.BaseDao;
import com.wjs.shop.goods.domain.CategoryAttrVal;

import java.util.List;

/**
 * 商品分类属性值Dao 
 *
 * @author wjs
 * 2016-5-17 16:57:24
 */
@Repository
public class CategoryAttrValDao extends BaseDao<CategoryAttrVal, Integer> {

    /**
     * 获取属性所有值
     * @param categoryAttrId
     * @return
     */
    public List<CategoryAttrVal> queryByAttrId(Integer categoryAttrId){
        return this.query(this.q().eq(CategoryAttrVal.F_categoryAttrId, categoryAttrId));
    }

    /**
     * 按属性删除
     * @param categoryAttrId
     * @return
     */
    public void delByAttrId(Integer categoryAttrId){
        this.delete(this.q().eq(CategoryAttrVal.F_categoryAttrId, categoryAttrId));
    }
	
}