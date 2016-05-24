<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>新增 商品</title>
<%@include file="/jsp/form.jsp" %>
<%@include file="/jsp/ztree.jsp" %>
<script type="text/javascript">
function save(){
    $.save({'url':'${ctx}/goods/doSave'});
}

//校验函数
$(function() {
	$("#dataForm").validate({
		rules: {
			"categoryId": {
                required: true,
				
			},
			"supperBrandId": {
                required: true,
				
			},
			"name": {
                required: true,
				validIllegalChar: true
			},
			"code": {
                required: true,
				validIllegalChar: true
			},
			"productCode": {
                required: true,
				validIllegalChar: true
			},
			"price": {
                required: true,
				
			},
			"title": {
                required: true,
				validIllegalChar: true
			},
			"newFlag": {
                required: true,
				
			},
			"hotFlag": {
                required: true,
				
			},
			"recommendFlag": {
                required: true,
				
			},
			"attr1Name": {
                required: true,
				validIllegalChar: true
			},
			"attr2Name": {
                required: true,
				validIllegalChar: true
			},
			"attr2Val": {
                required: true,
				validIllegalChar: true
			},
			"attr3Name": {
                required: true,
				validIllegalChar: true
			},
			"attr3Val": {
                required: true,
				validIllegalChar: true
			},
			"cartFlag": {
                required: true,
				
			},
			"freeExpressFlag": {
                required: true,
				
			},
			"saleStartTime": {
                required: true,
				
			},
			"saleEndTime": {
                required: true,
				
			},
			"limitNum": {
                required: true,
				
			},
			"limitStartTime": {
                required: true,
				
			},
			"limitEndTime": {
                required: true,
				
			},
			"validityTime": {
                required: true,
				
			},
			"countDownFlag": {
                required: true,
				
			}
		}
	});
});
</script>

</head>

<body>
<div id="bodyDiv" style="margin-top:10px;overflow-x: hidden;">
    <div id="infoBoxDiv" class="my_infoBox alert alert-danger"></div>
    <div class="row">
        <form class="form-horizontal m-t" id="dataForm">
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>商品分类ID：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <input type="text" id="categoryId" name="categoryId" value="${item.categoryId}" onkeyup="value=value.replace(/[^\d]/g,'')" class="form-control" style="width:250px" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>供应商品牌ID：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <input type="text" id="supperBrandId" name="supperBrandId" value="${item.supperBrandId}" onkeyup="value=value.replace(/[^\d]/g,'')" class="form-control" style="width:250px" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>商品名称：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <input type="text" id="name" name="name" value="${item.name}"  class="form-control" style="width:250px" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>商品编码：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <input type="text" id="code" name="code" value="${item.code}"  class="form-control" style="width:250px" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>货品编码：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <input type="text" id="productCode" name="productCode" value="${item.productCode}"  class="form-control" style="width:250px" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>售价：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <input type="text" id="price" name="price" value="${item.price}" onkeyup="value=value.replace(/[^\d]/g,'')" class="form-control" style="width:250px" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>标题：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <input type="text" id="title" name="title" value="${item.title}"  class="form-control" style="width:250px" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>是否新品：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <input type="text" id="newFlag" name="newFlag" value="${item.newFlag}"  class="form-control" style="width:250px" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>是否热销：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <input type="text" id="hotFlag" name="hotFlag" value="${item.hotFlag}"  class="form-control" style="width:250px" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>是否推荐：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <input type="text" id="recommendFlag" name="recommendFlag" value="${item.recommendFlag}"  class="form-control" style="width:250px" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>主属性名称：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <input type="text" id="attr1Name" name="attr1Name" value="${item.attr1Name}"  class="form-control" style="width:250px" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>子属性名称：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <input type="text" id="attr2Name" name="attr2Name" value="${item.attr2Name}"  class="form-control" style="width:250px" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>子属性值：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <input type="text" id="attr2Val" name="attr2Val" value="${item.attr2Val}"  class="form-control" style="width:250px" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>附加属性名称：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <input type="text" id="attr3Name" name="attr3Name" value="${item.attr3Name}"  class="form-control" style="width:250px" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>附加属性值：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <input type="text" id="attr3Val" name="attr3Val" value="${item.attr3Val}"  class="form-control" style="width:250px" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>是否进购物车：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <input type="text" id="cartFlag" name="cartFlag" value="${item.cartFlag}"  class="form-control" style="width:250px" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>是否免运费：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <input type="text" id="freeExpressFlag" name="freeExpressFlag" value="${item.freeExpressFlag}"  class="form-control" style="width:250px" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>促销开始时间：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <input type="text" id="saleStartTime" name="saleStartTime" value="${item.saleStartTime}" onkeyup="value=value.replace(/[^\d]/g,'')" class="form-control" style="width:250px" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>促销结束时间：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <input type="text" id="saleEndTime" name="saleEndTime" value="${item.saleEndTime}" onkeyup="value=value.replace(/[^\d]/g,'')" class="form-control" style="width:250px" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>限购数量：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <input type="text" id="limitNum" name="limitNum" value="${item.limitNum}" onkeyup="value=value.replace(/[^\d]/g,'')" class="form-control" style="width:250px" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>限购开始时间：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <input type="text" id="limitStartTime" name="limitStartTime" value="${item.limitStartTime}" onkeyup="value=value.replace(/[^\d]/g,'')" class="form-control" style="width:250px" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>限购结束时间：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <input type="text" id="limitEndTime" name="limitEndTime" value="${item.limitEndTime}" onkeyup="value=value.replace(/[^\d]/g,'')" class="form-control" style="width:250px" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>有效期：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <input type="text" id="validityTime" name="validityTime" value="${item.validityTime}" onkeyup="value=value.replace(/[^\d]/g,'')" class="form-control" style="width:250px" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>是否显示倒计时：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <input type="text" id="countDownFlag" name="countDownFlag" value="${item.countDownFlag}"  class="form-control" style="width:250px" />
            </div>
        </div>
        <div class="form-group" style="border-bottom:0px;margin-top:20px;">
            <div class="col-sm-offset-3 col-md-offset-2 col-lg-offset-1" >
                <button class="btn btn-primary" type="button" id="saveBut" onclick="save();"><i class='fa fa-save'></i> 保 存</button>
                <button class="btn btn-success" type="button" id="continueBut" onclick="window.location.reload();" style="display: none;"><i class='fa fa-thumbs-up'></i> 继续添加</button>
                <button class="btn btn-default" type="button" id="backBut" onclick="window.top.goTab(1);" style="display: none;"><i class='fa fa-mail-reply'></i> 返回</button>
            </div>
        </div>
        </form>
    </div>
</div>
</body>
</html>