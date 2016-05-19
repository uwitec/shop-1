<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>更新 商品分类属性值</title>
<%@include file="/jsp/form.jsp" %>
<%@include file="/jsp/ztree.jsp" %>
<script type="text/javascript">
function save(){
	$.save({'url': '${ctx}/categoryAttrVal/doUpdate'});
}

$(function() {
	$("#dataForm").validate({
		rules: {
			"id": {
				required: true,
				
			},
			"categoryAttrId": {
				required: true,
				
			},
			"val": {
				required: true,
				validIllegalChar: true
			},
			"sort": {
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
			<input type="hidden" id="id" name="id" value="${item.id}" />
			<div class="form-group">
                <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>id：</label>
                <div class="col-sm-9 col-md-10 col-lg-11 form-inline input-group" style="padding-left:0px;">
						<input type="text" id="id" name="id" value="${item.id}" onkeyup="value=value.replace(/[^\d]/g,'')" class="form-control" style="width:250px" />
				</div>
			</div>
			<div class="form-group">
                <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>分类属性ID：</label>
                <div class="col-sm-9 col-md-10 col-lg-11 form-inline input-group" style="padding-left:0px;">
						<input type="text" id="categoryAttrId" name="categoryAttrId" value="${item.categoryAttrId}" onkeyup="value=value.replace(/[^\d]/g,'')" class="form-control" style="width:250px" />
				</div>
			</div>
			<div class="form-group">
                <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>属性值：</label>
                <div class="col-sm-9 col-md-10 col-lg-11 form-inline input-group" style="padding-left:0px;">
						<input type="text" id="val" name="val" value="${item.val}"  class="form-control" style="width:250px" />
				</div>
			</div>
			<div class="form-group">
                <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>排序：</label>
                <div class="col-sm-9 col-md-10 col-lg-11 form-inline input-group" style="padding-left:0px;">
						<input type="text" id="sort" name="sort" value="${item.sort}" onkeyup="value=value.replace(/[^\d]/g,'')" class="form-control" style="width:250px" />
				</div>
			</div>
            <div class="form-group" style="border-bottom:0px;margin-top:20px;">
                <div class="col-sm-offset-3 col-md-offset-2 col-lg-offset-1" >
					<button class="btn btn-primary" type="button" id="saveBut" onclick="save();"><i class='fa fa-save'></i> 保 存</button>
                    <button class="btn btn-default" type="button" id="backBut" onclick="window.top.goTab(1);" style="display: none;"><i class='fa fa-mail-reply'></i> 返回</button>
				</div>
			</div>
    	</form>
    </div>
</div>
</body>
</html>