package com.wjs.shop.goods.domain;


import org.whale.system.annotation.jdbc.Column;
import org.whale.system.annotation.jdbc.Id;
import org.whale.system.annotation.jdbc.Table;
import org.whale.system.annotation.jdbc.Validate;
import org.whale.system.base.BaseEntry;

/**
 * 商品分类属性值
 *
 * @author wjs
 * @Date 2016-5-17
 */
@Table(value="g_category_attr_val", cnName="商品分类属性值")
public class CategoryAttrVal extends BaseEntry {
	private static final long serialVersionUID = -1463475444724l;
	
	@Id
	@Column(name="id", cnName="id")
	private Long id;
	
	@Validate(required=true)
  	@Column(cnName="分类属性ID", name="categoryAttrId")
	private Long categoryAttrId;
	
	@Validate(required=true)
  	@Column(cnName="属性值", name="val")
	private String val;
	
	@Validate(required=true)
  	@Column(cnName="排序", name="sort")
	private Integer sort;
	
	
	/**id */
	public Long getId(){
		return id;
	}
	
	/**id */
	public void setId(Long id){
		this.id = id;
	}
	
	/**分类属性ID */
	public Long getCategoryAttrId(){
		return categoryAttrId;
	}
	
	/**分类属性ID */
	public void setCategoryAttrId(Long categoryAttrId){
		this.categoryAttrId = categoryAttrId;
	}
	
	/**属性值 */
	public String getVal(){
		return val;
	}
	
	/**属性值 */
	public void setVal(String val){
		this.val = val;
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