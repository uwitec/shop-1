<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>新增 商品分类</title>
<%@include file="/jsp/form.jsp" %>
<%@include file="/jsp/ztree.jsp" %>
<script type="text/javascript">
function save(){
    $.save({'url':'${ctx}/category/doSave'});
}

//校验函数
$(function() {
	$("#dataForm").validate({
		rules: {
			"id": {
                required: true,
				
			},
			"pid": {
                required: true,
				
			},
			"name": {
                required: true,
				validIllegalChar: true
			},
			"showFlag": {
                required: true,
				
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
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>主键：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <input type="text" id="id" name="id" value="${item.id}" onkeyup="value=value.replace(/[^\d]/g,'')" class="form-control" style="width:250px" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>父类别：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <input type="text" id="pid" name="pid" value="${item.pid}" onkeyup="value=value.replace(/[^\d]/g,'')" class="form-control" style="width:250px" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>类别名称：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <input type="text" id="name" name="name" value="${item.name}"  class="form-control" style="width:250px" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>是否显示：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <input type="text" id="showFlag" name="showFlag" value="${item.showFlag}"  class="form-control" style="width:250px" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>排序：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <input type="text" id="sort" name="sort" value="${item.sort}" onkeyup="value=value.replace(/[^\d]/g,'')" class="form-control" style="width:250px" />
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