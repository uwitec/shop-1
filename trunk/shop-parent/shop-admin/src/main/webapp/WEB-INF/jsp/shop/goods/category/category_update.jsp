<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>更新 商品分类</title>
<%@include file="/jsp/form.jsp" %>
<%@include file="/jsp/ztree.jsp" %>
<script type="text/javascript">
function save(){
	$.save({'url': '${ctx}/category/doUpdate'});
}

$(function() {
	$("#dataForm").validate({
		rules: {
			"name": {
				required: true,
				validIllegalChar: true
			},
			"sort": {
				required: true
			}
		}
	});
});

function addRoot(){
	zNodes_pid.push({id:0, name:"商品分类", pid: -1, open: true, isParent: true});
}

function filterSelf(){
	var self = zTree_pid.getNodeByParam("id", ${item.id});
	zTree_pid.removeNode(self);
}

</script>
</head>

<body>
<div id="bodyDiv" style="margin-top:10px;overflow-x: hidden;">
    <div id="infoBoxDiv" class="my_infoBox alert alert-danger"></div>
    <div class="row">
        <form class="form-horizontal m-t" id="dataForm">
			<input type="hidden" id="id" name="id" value="${item.id}" />
			<div class="form-group">
                <label class="col-sm-3 col-md-2 col-lg-1 control-label">父类别：</label>
                <div class="col-sm-9 col-md-10 col-lg-11 form-inline input-group" style="padding-left:0px;">
					<tag:tree id="pid" nodes="${nodes}" nodeId="id" nodePId="pid" nodeName="name" beforeLoadTree="addRoot" afterLoadTree="filterSelf" value="${item.pid}" showCleanBut="false"></tag:tree>
				</div>
			</div>
			<div class="form-group">
                <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>类别名称：</label>
                <div class="col-sm-9 col-md-10 col-lg-11 form-inline input-group" style="padding-left:0px;">
						<input type="text" id="name" name="name" value="${item.name}"  class="form-control" style="width:250px" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 col-md-2 col-lg-1 control-label">是否显示：</label>
				<div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
					<select id="showFlag" name="showFlag" style="width:250px">
						<option value="1" <c:if test="${item.showFlag}">selected</c:if> >是</option>
						<option value="0" <c:if test="${!item.showFlag}">selected</c:if> >否</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 col-md-2 col-lg-1 control-label">是否可挂商品：</label>
				<div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
					<select id="goodsFlag" name="goodsFlag" style="width:250px">
						<option value="0" <c:if test="${!item.goodsFlag}">selected</c:if> >否</option>
						<option value="1" <c:if test="${item.goodsFlag}">selected</c:if> >是</option>
					</select>
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