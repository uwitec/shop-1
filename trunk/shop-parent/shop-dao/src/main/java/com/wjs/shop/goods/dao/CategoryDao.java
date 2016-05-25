package com.wjs.shop.goods.dao;

import org.springframework.stereotype.Repository;

import org.whale.system.base.BaseDao;
import com.wjs.shop.goods.domain.Category;

import java.util.List;

/**
 * 商品分类Dao
 *
 *
 * @author wjs
 * 2016-5-17 15:39:32
 */
@Repository
public class CategoryDao extends BaseDao<Category, Integer> {

    /**
     * 获取次级子分类
     * @param pid
     * @return
     */
	public List<Category> queryByPid(Integer pid){
        return this.query(this.q().eq(Category.F_pid, pid).asc(Category.F_sort));
    }

    /**
     * 获取非可挂商品的节点
     * @return
     */
    public List<Category> queryNotGoodsFlag(){
        return this.query(this.q().eq(Category.F_goodsFlag, false).asc(Category.F_pid).asc(Category.F_sort));
    }

    final String nextOrder_SQL = "select max(sort) as sort FROM g_category WHERE pid=?";
    /**
     * 获取下一个排序
     * @param pid
     * @return
     */
    public Integer nextOrder(Integer pid){
        Integer maxSort = this.count(nextOrder_SQL, pid == null ? 0 : pid);
        if (maxSort == null){
            return 1;
        }
        return maxSort+1;
    }
}