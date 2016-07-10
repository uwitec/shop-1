<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>更新 商品分类属性</title>
<%@include file="/jsp/form.jsp" %>
<%@include file="/jsp/ztree.jsp" %>
<script type="text/javascript">
function save(){
	var success = true;
	$("#attrValRow input[name='attrVal']").each(function(i){
		if($.trim($(this).val()) != ""){
			if($(this).next("input").val()  == ""){
				$.alert("属性值第["+(i+1)+"]的排序值不能为空");
				success = false;
				return;
			}
		}
	});
	if(success){
		$.save({'url':'${ctx}/categoryAttr/doUpdate'});
	}
}

$(function() {
	$("#dataForm").validate({
		rules: {
			"attrName": {
				required: true,
				validIllegalChar: true
			},
			"sort": {
				required: true
			}
		}
	});
});

var i=${maxValNum};
function addRow(){
	i++;
	var rowHtml='<div id="row_'+i+'" class="col-sm-9 col-md-10 col-lg-11 form-inline col-sm-offset-3 col-md-offset-2 col-lg-offset-1 "  style="padding-left:0px;margin-top: 5px;">' +
			'<input type="text" name="attrVal" class="form-control" style="width:250px;margin-right:4px;" placeholder="属性值" />' +
			'<input type="text" name="attrValSort" class="form-control" style="width:50px;margin-right:4px;" onkeyup=value=value.replace(/[^\\d]/g,\'\') placeholder="排序" />' +
			'<a href="javascript:;" style="margin-right:4px;" onclick="addRow();" ><i class="fa fa-plus-square"></i></a>' +
			'<a href="javascript:;" onclick="delRow('+i+');" ><i class="fa fa-minus-square"></i></a>' +
			'</div>';

	$("#attrValRow").append(rowHtml);
}

function delRow(i){
	$("#row_"+i).remove();
	return false;
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
				<label class="col-sm-3 col-md-2 col-lg-1 control-label">所属商品分类：</label>
				<div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
					<input type="hidden" id="categoryId" name="categoryId" value="${item.category.id}" />
					${item.category.name}
				</div>
			</div>
			<div class="form-group">
                <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>属性名称：</label>
                <div class="col-sm-9 col-md-10 col-lg-11 form-inline input-group" style="padding-left:0px;">
						<input type="text" id="attrName" name="attrName" value="${item.attrName}"  class="form-control" style="width:250px" />
				</div>
			</div>
			<div class="form-group">
                <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>是否搜索项：</label>
                <div class="col-sm-9 col-md-10 col-lg-11 form-inline input-group" style="padding-left:0px;">
					<select id="searchFlag" name="searchFlag" style="width:250px">
						<option value="1" <c:if test="${item.searchFlag}">selected</c:if> >是</option>
						<option value="0" <c:if test="${!item.searchFlag}">selected</c:if> >否</option>
					</select>
				</div>
			</div>
			<div class="form-group">
                <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>排序：</label>
                <div class="col-sm-9 col-md-10 col-lg-11 form-inline input-group" style="padding-left:0px;">
						<input type="text" id="sort" name="sort" value="${item.sort}" onkeyup="value=value.replace(/[^\d]/g,'')" class="form-control" style="width:250px" />
				</div>
			</div>
			<div class="form-group" id="attrValRow">
				<label class="col-sm-3 col-md-2 col-lg-1 control-label">属性值：</label>
				<c:if test="${maxValNum == 0}">
					<div id="row_0" class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
						<input type="text" name="attrVal" class="form-control" style="width:250px" placeholder="属性值"/>
						<input type="text" name="attrValSort" class="form-control" style="width:50px" onkeyup="value=value.replace(/[^\d]/g,'')" placeholder="排序" />
						<a href="javascript:;" onclick="addRow()"><i class="fa fa fa-plus-square"></i></a>
					</div>
				</c:if>
				<c:if test="${maxValNum > 0}">
					<c:forEach items="${item.categoryAttrValList}" var="categoryAttrVal" varStatus="itemIndex">
						<c:if test="${itemIndex.index == 0}">
							<div id="row_0" class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
								<input type="text" name="attrVal" value="${categoryAttrVal.val}" class="form-control" style="width:250px" placeholder="属性值"/>
								<input type="text" name="attrValSort" value="${categoryAttrVal.sort}" class="form-control" style="width:50px" onkeyup="value=value.replace(/[^\d]/g,'')" placeholder="排序" />
								<a href="javascript:;" onclick="addRow()"><i class="fa fa fa-plus-square"></i></a>
							</div>
						</c:if>
						<c:if test="${itemIndex.index > 0}">
							<div id="row_${itemIndex.index}" class="col-sm-9 col-md-10 col-lg-11 form-inline col-sm-offset-3 col-md-offset-2 col-lg-offset-1"  style="padding-left:0px;margin-top: 5px;">
								<input type="text" name="attrVal" value="${categoryAttrVal.sort}" class="form-control" style="width:250px;margin-right:4px;" placeholder="属性值"/>
								<input type="text" name="attrValSort" value="${categoryAttrVal.sort}" class="form-control" style="width:50px;margin-right:4px;" onkeyup="value=value.replace(/[^\d]/g,'')" placeholder="排序" />
								<a href="javascript:;" onclick="addRow()" style="margin-right:4px;" ><i class="fa fa fa-plus-square"></i></a>
								<a href="javascript:;" onclick="delRow(${itemIndex.index});" ><i class="fa fa-minus-square"></i></a>
							</div>
						</c:if>
					</c:forEach>
				</c:if>
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