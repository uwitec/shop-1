package com.wjs.shop.goods.domain;


import org.whale.system.annotation.jdbc.*;
import org.whale.system.base.BaseEntry;

/**
 * 商品分类
 * 最多3级
 *
 * @author wjs
 * @Date 2016-5-17
 */
@Table(value="g_category", cnName="商品分类")
public class Category extends BaseEntry {
	private static final long serialVersionUID = -1463470772710l;

	/**父类别 */
	public static final String F_pid = "pid";
	/**排序 */
	public static final String F_sort = "sort";
	/**是否可挂商品 */
	public static final String F_goodsFlag = "goodsFlag";

	
	@Id
	@Column(name="id", cnName="主键")
	private Integer id;

  	@Column(cnName="父类别", name="pid")
	private Integer pid;
	
	@Validate(required=true)
  	@Column(cnName="类别名称", name="name", unique = true)
	private String name;

  	@Column(cnName="是否显示", name="showFlag")
	private Boolean showFlag;

	@Column(cnName="是否可挂商品", name="goodsFlag")
	private Boolean goodsFlag;

	@Validate(required=true, limit = {0, 255})
	@Order
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

	/**是否可挂商品 */
	public Boolean getGoodsFlag() {
		return goodsFlag;
	}

	/**是否可挂商品 */
	public void setGoodsFlag(Boolean goodsFlag) {
		this.goodsFlag = goodsFlag;
	}
}