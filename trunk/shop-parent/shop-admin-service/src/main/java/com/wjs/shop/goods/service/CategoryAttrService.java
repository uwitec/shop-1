package com.wjs.shop.goods.service;

import com.wjs.shop.goods.dao.CategoryAttrDao;
import com.wjs.shop.goods.dao.CategoryAttrValDao;
import com.wjs.shop.goods.domain.CategoryAttr;
import com.wjs.shop.goods.domain.CategoryAttrVal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.whale.system.base.BaseDao;
import org.whale.system.base.Page;
import org.whale.system.base.Q;
import org.whale.system.common.exception.BusinessException;
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
	@Autowired
	private CategoryAttrValDao categoryAttrValDao;

	public void transSave(CategoryAttr categoryAttr){
		this.categoryAttrDao.save(categoryAttr);
		if (categoryAttr.getCategoryAttrValList() != null && categoryAttr.getCategoryAttrValList().size() > 0) {
			for (CategoryAttrVal categoryAttrVal : categoryAttr.getCategoryAttrValList()){
				categoryAttrVal.setCategoryAttrId(categoryAttr.getId());
			}
			this.categoryAttrValDao.saveBatch(categoryAttr.getCategoryAttrValList());
		}
	}

	public void transUpdate(CategoryAttr categoryAttr){
		this.categoryAttrDao.update(categoryAttr);
		this.categoryAttrValDao.delByAttrId(categoryAttr.getId());

		if (categoryAttr.getCategoryAttrValList() != null && categoryAttr.getCategoryAttrValList().size() > 0) {
			this.categoryAttrValDao.saveBatch(categoryAttr.getCategoryAttrValList());
		}
	}
	

	public void queryPage(Page page, Integer categoryId){
		page.newQ(CategoryAttr.class).select().selectWrap(", (SELECT group_concat(v.val) from g_category_attr_val v where v.categoryAttrId = t.id ORDER BY v.sort asc) as attrVals").eq(CategoryAttr.F_categoryId, categoryId).asc(CategoryAttr.F_sort);
		
		this.queryPage(page);
	}

	/**
	 * 上线挪动顺序
	 * @param id
	 * @param downFlag
	 */
	public void transMove(Integer id, boolean downFlag){
		CategoryAttr categoryAttr = this.get(id);
		if (categoryAttr == null){
			throw new BusinessException("商品分类属性["+id+"]不存在");
		}

		Q q = null;
		if (downFlag){
			q = Q.newQ(CategoryAttr.class).eq(CategoryAttr.F_categoryId, categoryAttr.getCategoryId()).gt(CategoryAttr.F_sort, categoryAttr.getSort()).asc(CategoryAttr.F_sort).limit(0, 1);
		} else {
			q = Q.newQ(CategoryAttr.class).eq(CategoryAttr.F_categoryId, categoryAttr.getCategoryId()).lt(CategoryAttr.F_sort, categoryAttr.getSort()).desc(CategoryAttr.F_sort).limit(0, 1);
		}
		CategoryAttr switchCategoryAttr = this.get(q);
		if (switchCategoryAttr == null){
			throw new BusinessException("没有可对调的商品分类属性");
		}
		int oldSort = categoryAttr.getSort();
		categoryAttr.setSort(switchCategoryAttr.getSort());
		switchCategoryAttr.setSort(oldSort);

		this.update(categoryAttr);
		this.update(switchCategoryAttr);
	}

	@Override
	public BaseDao<CategoryAttr, Integer> getDao() {
		return categoryAttrDao;
	}

}