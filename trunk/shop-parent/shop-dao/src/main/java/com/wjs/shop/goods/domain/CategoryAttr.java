package com.wjs.shop.goods.domain;


import org.whale.system.annotation.jdbc.Column;
import org.whale.system.annotation.jdbc.Id;
import org.whale.system.annotation.jdbc.Table;
import org.whale.system.annotation.jdbc.Validate;
import org.whale.system.base.BaseEntry;

/**
 * 商品分类属性
 *
 * @author wjs
 * @Date 2016-5-17
 */
@Table(value="g_category_attr", cnName="商品分类属性")
public class CategoryAttr extends BaseEntry {
	private static final long serialVersionUID = -1463475363551l;

	/**商品分类ID */
	public static final String F_categoryId = "categoryId";
	/**排序 */
	public static final String F_sort = "sort";

	@Id
	@Column(name="id", cnName="id")
	private Integer id;
	
	@Validate(required=true)
  	@Column(cnName="商品分类ID", name="categoryId")
	private Integer categoryId;
	
	@Validate(required=true)
  	@Column(cnName="属性名称", name="attrName")
	private String attrName;
	
	@Validate(required=true)
  	@Column(cnName="是否搜索项", name="searchFlag")
	private Boolean searchFlag;
	
	@Validate(required=true)
  	@Column(cnName="排序", name="sort")
	private Integer sort;
	
	
	/**id */
	public Integer getId(){
		return id;
	}
	
	/**id */
	public void setId(Integer id){
		this.id = id;
	}
	
	/**商品分类ID */
	public Integer getCategoryId(){
		return categoryId;
	}
	
	/**商品分类ID */
	public void setCategoryId(Integer categoryId){
		this.categoryId = categoryId;
	}
	
	/**属性名称 */
	public String getAttrName(){
		return attrName;
	}
	
	/**属性名称 */
	public void setAttrName(String attrName){
		this.attrName = attrName;
	}
	
	/**是否搜索项 */
	public Boolean getSearchFlag(){
		return searchFlag;
	}
	
	/**是否搜索项 */
	public void setSearchFlag(Boolean searchFlag){
		this.searchFlag = searchFlag;
	}
	
	/**排序 */
	public Integer getSort(){
		return sort;
	}
	
	/**排序 */
	public void setSort(Integer sort){
		this.sort = sort;
	}

}