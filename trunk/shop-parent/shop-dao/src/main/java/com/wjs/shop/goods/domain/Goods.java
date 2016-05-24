package com.wjs.shop.goods.domain;


import org.whale.system.annotation.jdbc.Column;
import org.whale.system.annotation.jdbc.Id;
import org.whale.system.annotation.jdbc.Table;
import org.whale.system.annotation.jdbc.Validate;
import org.whale.system.base.BaseEntry;

/**
 * 商品
 *
 * @author wjs
 * @Date 2016-5-20
 */
@Table(value="g_goods", cnName="商品")
public class Goods extends BaseEntry {
	private static final long serialVersionUID = -1463728192097l;
	
	@Id
	@Column(name="id", cnName="id")
	private Long id;
	
	@Validate(required=true)
  	@Column(cnName="商品分类ID", name="categoryId")
	private Integer categoryId;
	
	@Validate(required=true)
  	@Column(cnName="供应商品牌ID", name="supperBrandId")
	private Integer supperBrandId;
	
	@Validate(required=true)
  	@Column(cnName="商品名称", name="name")
	private String name;
	
	@Validate(required=true)
  	@Column(cnName="商品编码", name="code")
	private String code;
	
	@Validate(required=true)
  	@Column(cnName="货品编码", name="productCode")
	private String productCode;
	
	@Validate(required=true)
  	@Column(cnName="售价", name="price")
	private Integer price;
	
	@Validate(required=true)
  	@Column(cnName="标题", name="title")
	private String title;
	
	@Validate(required=true)
  	@Column(cnName="状态", name="status")
	private Integer status;
	
	@Validate(required=true)
  	@Column(cnName="是否新品", name="newFlag")
	private Boolean newFlag;
	
	@Validate(required=true)
  	@Column(cnName="是否热销", name="hotFlag")
	private Boolean hotFlag;
	
	@Validate(required=true)
  	@Column(cnName="是否推荐", name="recommendFlag")
	private Boolean recommendFlag;
	
	@Validate(required=true)
  	@Column(cnName="主属性名称", name="attr1Name")
	private String attr1Name;
	
	@Validate(required=true)
  	@Column(cnName="子属性名称", name="attr2Name")
	private String attr2Name;
	
	@Validate(required=true)
  	@Column(cnName="子属性值", name="attr2Val")
	private String attr2Val;
	
	@Validate(required=true)
  	@Column(cnName="附加属性名称", name="attr3Name")
	private String attr3Name;
	
	@Validate(required=true)
  	@Column(cnName="附加属性值", name="attr3Val")
	private String attr3Val;
	
	@Validate(required=true)
  	@Column(cnName="是否进购物车", name="cartFlag")
	private Boolean cartFlag;
	
	@Validate(required=true)
  	@Column(cnName="是否免运费", name="freeExpressFlag")
	private Boolean freeExpressFlag;
	
	@Validate(required=true)
  	@Column(cnName="促销开始时间", name="saleStartTime")
	private Long saleStartTime;
	
	@Validate(required=true)
  	@Column(cnName="促销结束时间", name="saleEndTime")
	private Long saleEndTime;
	
	@Validate(required=true)
  	@Column(cnName="限购数量", name="limitNum")
	private Integer limitNum;
	
	@Validate(required=true)
  	@Column(cnName="限购开始时间", name="limitStartTime")
	private Long limitStartTime;
	
	@Validate(required=true)
  	@Column(cnName="限购结束时间", name="limitEndTime")
	private Long limitEndTime;
	
	@Validate(required=true)
  	@Column(cnName="有效期", name="validityTime")
	private Long validityTime;
	
	@Validate(required=true)
  	@Column(cnName="是否显示倒计时", name="countDownFlag")
	private Boolean countDownFlag;
	
	
	/**id */
	public Long getId(){
		return id;
	}
	
	/**id */
	public void setId(Long id){
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
	
	/**供应商品牌ID */
	public Integer getSupperBrandId(){
		return supperBrandId;
	}
	
	/**供应商品牌ID */
	public void setSupperBrandId(Integer supperBrandId){
		this.supperBrandId = supperBrandId;
	}
	
	/**商品名称 */
	public String getName(){
		return name;
	}
	
	/**商品名称 */
	public void setName(String name){
		this.name = name;
	}
	
	/**商品编码 */
	public String getCode(){
		return code;
	}
	
	/**商品编码 */
	public void setCode(String code){
		this.code = code;
	}
	
	/**货品编码 */
	public String getProductCode(){
		return productCode;
	}
	
	/**货品编码 */
	public void setProductCode(String productCode){
		this.productCode = productCode;
	}
	
	/**售价 */
	public Integer getPrice(){
		return price;
	}
	
	/**售价 */
	public void setPrice(Integer price){
		this.price = price;
	}
	
	/**标题 */
	public String getTitle(){
		return title;
	}
	
	/**标题 */
	public void setTitle(String title){
		this.title = title;
	}
	
	/**状态 */
	public Integer getStatus(){
		return status;
	}
	
	/**状态 */
	public void setStatus(Integer status){
		this.status = status;
	}
	
	/**是否新品 */
	public Boolean getNewFlag(){
		return newFlag;
	}
	
	/**是否新品 */
	public void setNewFlag(Boolean newFlag){
		this.newFlag = newFlag;
	}
	
	/**是否热销 */
	public Boolean getHotFlag(){
		return hotFlag;
	}
	
	/**是否热销 */
	public void setHotFlag(Boolean hotFlag){
		this.hotFlag = hotFlag;
	}
	
	/**是否推荐 */
	public Boolean getRecommendFlag(){
		return recommendFlag;
	}
	
	/**是否推荐 */
	public void setRecommendFlag(Boolean recommendFlag){
		this.recommendFlag = recommendFlag;
	}
	
	/**主属性名称 */
	public String getAttr1Name(){
		return attr1Name;
	}
	
	/**主属性名称 */
	public void setAttr1Name(String attr1Name){
		this.attr1Name = attr1Name;
	}
	
	/**子属性名称 */
	public String getAttr2Name(){
		return attr2Name;
	}
	
	/**子属性名称 */
	public void setAttr2Name(String attr2Name){
		this.attr2Name = attr2Name;
	}
	
	/**子属性值 */
	public String getAttr2Val(){
		return attr2Val;
	}
	
	/**子属性值 */
	public void setAttr2Val(String attr2Val){
		this.attr2Val = attr2Val;
	}
	
	/**附加属性名称 */
	public String getAttr3Name(){
		return attr3Name;
	}
	
	/**附加属性名称 */
	public void setAttr3Name(String attr3Name){
		this.attr3Name = attr3Name;
	}
	
	/**附加属性值 */
	public String getAttr3Val(){
		return attr3Val;
	}
	
	/**附加属性值 */
	public void setAttr3Val(String attr3Val){
		this.attr3Val = attr3Val;
	}
	
	/**是否进购物车 */
	public Boolean getCartFlag(){
		return cartFlag;
	}
	
	/**是否进购物车 */
	public void setCartFlag(Boolean cartFlag){
		this.cartFlag = cartFlag;
	}
	
	/**是否免运费 */
	public Boolean getFreeExpressFlag(){
		return freeExpressFlag;
	}
	
	/**是否免运费 */
	public void setFreeExpressFlag(Boolean freeExpressFlag){
		this.freeExpressFlag = freeExpressFlag;
	}
	
	/**促销开始时间 */
	public Long getSaleStartTime(){
		return saleStartTime;
	}
	
	/**促销开始时间 */
	public void setSaleStartTime(Long saleStartTime){
		this.saleStartTime = saleStartTime;
	}
	
	/**促销结束时间 */
	public Long getSaleEndTime(){
		return saleEndTime;
	}
	
	/**促销结束时间 */
	public void setSaleEndTime(Long saleEndTime){
		this.saleEndTime = saleEndTime;
	}
	
	/**限购数量 */
	public Integer getLimitNum(){
		return limitNum;
	}
	
	/**限购数量 */
	public void setLimitNum(Integer limitNum){
		this.limitNum = limitNum;
	}
	
	/**限购开始时间 */
	public Long getLimitStartTime(){
		return limitStartTime;
	}
	
	/**限购开始时间 */
	public void setLimitStartTime(Long limitStartTime){
		this.limitStartTime = limitStartTime;
	}
	
	/**限购结束时间 */
	public Long getLimitEndTime(){
		return limitEndTime;
	}
	
	/**限购结束时间 */
	public void setLimitEndTime(Long limitEndTime){
		this.limitEndTime = limitEndTime;
	}
	
	/**有效期 */
	public Long getValidityTime(){
		return validityTime;
	}
	
	/**有效期 */
	public void setValidityTime(Long validityTime){
		this.validityTime = validityTime;
	}
	
	/**是否显示倒计时 */
	public Boolean getCountDownFlag(){
		return countDownFlag;
	}
	
	/**是否显示倒计时 */
	public void setCountDownFlag(Boolean countDownFlag){
		this.countDownFlag = countDownFlag;
	}

}