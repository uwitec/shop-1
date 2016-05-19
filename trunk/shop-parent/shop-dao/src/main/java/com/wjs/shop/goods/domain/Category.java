package com.wjs.shop.goods.domain;


import org.whale.system.annotation.jdbc.Column;
import org.whale.system.annotation.jdbc.Id;
import org.whale.system.annotation.jdbc.Table;
import org.whale.system.annotation.jdbc.Validate;
import org.whale.system.base.BaseEntry;

/**
 * 商品分类
 *
 * @author wjs
 * @Date 2016-5-17
 */
@Table(value="g_category", cnName="商品分类")
public class Category extends BaseEntry {
	private static final long serialVersionUID = -1463470772710l;
	
	@Id
	@Column(name="id", cnName="主键")
	private Integer id;
	
	@Validate(required=true)
  	@Column(cnName="父类别", name="pid")
	private Integer pid;
	
	@Validate(required=true)
  	@Column(cnName="类别名称", name="name")
	private String name;
	
	@Validate(required=true)
  	@Column(cnName="是否显示", name="showFlag")
	private Boolean showFlag;
	
	@Validate(required=true)
  	@Column(cnName="排序", name="sort")
	private Integer sort;
	
	
	/**主键 */
	public Integer getId(){
		return id;
	}
	
	/**主键 */
	public void setId(Integer id){
		this.id = id;
	}
	
	/**父类别 */
	public Integer getPid(){
		return pid;
	}
	
	/**父类别 */
	public void setPid(Integer pid){
		this.pid = pid;
	}
	
	/**类别名称 */
	public String getName(){
		return name;
	}
	
	/**类别名称 */
	public void setName(String name){
		this.name = name;
	}
	
	/**是否显示 */
	public Boolean getShowFlag(){
		return showFlag;
	}
	
	/**是否显示 */
	public void setShowFlag(Boolean showFlag){
		this.showFlag = showFlag;
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