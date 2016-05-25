package com.wjs.shop.goods.service;

import com.wjs.shop.goods.dao.CategoryDao;
import com.wjs.shop.goods.domain.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.whale.system.base.BaseDao;
import org.whale.system.base.Page;
import org.whale.system.base.Q;
import org.whale.system.common.exception.BusinessException;
import org.whale.system.service.BaseService;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

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

	@Override
	public void save(Category category){
		if (category.getPid() == null || category.getPid() == 0){
			category.setPid(0);
		}else{
			Category parentCategory = this.get(category.getPid());
			if (parentCategory == null){
				throw new BusinessException("父商品分类["+category.getPid()+"]不存在");
			}
			if (parentCategory.getGoodsFlag()){
				throw new BusinessException("可挂商品分类不能再添加子分类");
			}
			Category topCategory = this.get(parentCategory.getPid());
			if (topCategory != null && this.get(topCategory.getPid()) != null){
				throw new BusinessException("最多支持3层分类");
			}
		}
		this.categoryDao.save(category);
	}


	public void queryPage(Page page, Integer pid, Boolean goodsFlag){
		if (goodsFlag){
			page.newQ(Category.class).selectAppend(", (SELECT group_concat(a.`attrName`) from g_category_attr a where a.categoryId = t.id  ORDER BY a.sort asc) as attrs").eq(Category.F_pid, pid == null ? 0 : pid).asc(Category.F_sort);
		}else{
			page.newQ(Category.class).eq(Category.F_pid, pid == null ? 0 : pid).asc(Category.F_sort);
		}

		this.queryPage(page);
	}

	/**
	 * 递归向上获取父级节点
	 * @param id
	 * @return
	 */
	public List<Category> recurCategory(Integer id){
		List<Category> parents = new ArrayList<Category>(3);
		Category temp = null;
		while (id != null && id != 0){
			temp = this.get(id);
			parents.add(temp);
			id = temp.getPid();
		}
		Category root = new Category();
		root.setId(0);
		root.setName("商品分类");
		root.setGoodsFlag(false);
		parents.add(root);
		return parents;
	}

	/**
	 * 隐藏或显示分类
	 * @param id
	 * @param showFlag
	 */
	public void transShow(Integer id, boolean showFlag){
		Category category = this.get(id);
		if (category == null){
			throw new BusinessException("商品分类["+id+"]不存在");
		}
		if (category.getShowFlag() == showFlag){
			return;
		}

		List<Category> updateList = new LinkedList<Category>();
		category.setShowFlag(showFlag);
		updateList.add(category);

		//TODO 隐藏时，商品是否需要下架

		List<Category> childrenList = this.categoryDao.queryByPid(id);
		if (childrenList != null && childrenList.size() > 0){
			for (Category c : childrenList){
				c.setShowFlag(showFlag);
				updateList.add(c);
				List<Category> lastList = this.categoryDao.queryByPid(c.getId());
				if (lastList != null && lastList.size() < 1){
					for (Category last : lastList){
						last.setShowFlag(false);
						updateList.add(last);
					}
				}
			}
		}

		this.updateBatch(updateList);
	}

	/**
	 * 上线挪动顺序
	 * @param id
	 * @param downFlag
	 */
	public void transMove(Integer id, boolean downFlag){
		Category category = this.get(id);
		if (category == null){
			throw new BusinessException("商品分类["+id+"]不存在");
		}

		Q q = null;
		if (downFlag){
			q = Q.newQ(Category.class).eq(Category.F_pid, category.getPid()).and(Category.F_sort, ">",category.getSort()).limit(0, 1);
		} else {
			q = Q.newQ(Category.class).eq(Category.F_pid, category.getPid()).and(Category.F_sort, "<",category.getSort()).limit(0, 1);
		}
		Category switchCategory = this.get(q);
		if (switchCategory == null){
			throw new BusinessException("没有可对调的商品分类");
		}
		int oldSort = category.getSort();
		category.setSort(switchCategory.getSort());
		switchCategory.setSort(oldSort);

		this.update(category);
		this.update(switchCategory);
	}

	@Override
	public BaseDao<Category, Integer> getDao() {
		return categoryDao;
	}

}