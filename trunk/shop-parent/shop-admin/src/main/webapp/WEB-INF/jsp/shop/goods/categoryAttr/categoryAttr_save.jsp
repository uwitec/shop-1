<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>新增 商品分类属性</title>
<%@include file="/jsp/form.jsp" %>
<%@include file="/jsp/ztree.jsp" %>
<script type="text/javascript">
function save(){
    $.save({'url':'${ctx}/categoryAttr/doSave'});
}

//校验函数
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


    function addRow(i){
        var rowHtml = '<div id="row_'+i+'" class="col-sm-9 col-md-10 col-lg-11 col-sm-offset-3 col-md-offset-2 col-lg-offset-1 form-inline"  style="padding-left:0px;margin-top: 5px;">' +
                        '<input type="text" name="attrVal" class="form-control" style="width:250px" placeholder="属性值" />' +
                        '<input type="text" name="attrValSort" class="form-control" style="width:50px" placeholder="排序" />' +
                        '<a href="javascript:addRow('+(i+1)+');" ><i class="fa fa-minus-square"></i></a>' +
                        '<a href="javascript:delRow('+i+');" style="display: none;" ><i class="fa fa-minus-square"></i></a>' +
                    '</div>';

        $("#attrValRow").append(rowHtml);
    }

    function delRow(i){
        $("#row_"+id).remove();
        return false;
    }
</script>

</head>

<body>
<div id="bodyDiv" style="margin-top:10px;overflow-x: hidden;">
    <div id="infoBoxDiv" class="my_infoBox alert alert-danger"></div>
    <div class="row">
        <form class="form-horizontal m-t" id="dataForm">
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label">所属商品分类：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <input type="hidden" id="categoryId" name="categoryId" value="${category.id}" />
                ${category.name}
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>属性名称：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <input type="text" id="attrName" name="attrName" value="${item.attrName}"  class="form-control" style="width:250px" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label">是否搜索项：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <select id="searchFlag" name="searchFlag" style="width:250px">
                    <option value="1">是</option>
                    <option value="0">否</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>排序：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <input type="text" id="sort" name="sort" value="${nextSort}" onkeyup="value=value.replace(/[^\d]/g,'')" class="form-control" style="width:250px" />
            </div>
        </div>
        <div class="form-group" id="attrValRow">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label">属性值：</label>
            <div id="row_0" class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <input type="text" name="attrVal" class="form-control" style="width:250px" placeholder="属性值"/>
                <input type="text" name="attrValSort" class="form-control" style="width:50px" placeholder="排序" />
                <a href="javascript:;"><i class="fa fa fa-plus-square"></i></a>
                <a href="javascript:;"><i class="fa fa-minus-square"></i></a>
            </div>
            <div class="col-sm-9 col-md-10 col-lg-11 col-sm-offset-3 col-md-offset-2 col-lg-offset-1 form-inline"  style="padding-left:0px;margin-top: 5px;">
                <input type="text" name="attrVal" class="form-control" style="width:250px" placeholder="属性值" />
                <input type="text" name="attrValSort" class="form-control" style="width:50px" placeholder="排序" />
                <a href="javascript:;"><i class="fa fa fa-plus-square"></i></a>
                <a href="javascript:;" ><i class="fa fa-minus-square"></i></a>
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