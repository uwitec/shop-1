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

</script>

</head>

<body>
<div id="bodyDiv" style="margin-top:10px;overflow-x: hidden;">
    <div id="infoBoxDiv" class="my_infoBox alert alert-danger"></div>
    <div class="row">
        <form class="form-horizontal m-t" id="dataForm">
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label">父类别：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <tag:tree id="pid" nodes="${nodes}" nodeId="id" nodePId="pid" beforeLoadTree="addRoot" nodeName="name" value="${selId}" showCleanBut="false"></tag:tree>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>类别名称：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <input type="text" id="name" name="name" value="${item.name}"  class="form-control" style="width:250px" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label">是否显示：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <select id="showFlag" name="showFlag" style="width:250px">
                    <option value="1">是</option>
                    <option value="0">否</option>
                </select>
            </div>
        </div>
            <div class="form-group">
                <label class="col-sm-3 col-md-2 col-lg-1 control-label">是否可挂商品：</label>
                <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                    <select id="goodsFlag" name="goodsFlag" style="width:250px">
                        <option value="0">否</option>
                        <option value="1">是</option>
                    </select>
                </div>
            </div>
        <div class="form-group">
            <label class="col-sm-3 col-md-2 col-lg-1 control-label"><i>*</i>排序：</label>
            <div class="col-sm-9 col-md-10 col-lg-11 form-inline"  style="padding-left:0px;">
                <input type="text" id="sort" name="sort" value="${nextSort}" onkeyup="value=value.replace(/[^\d]/g,'')" class="form-control" style="width:250px" />
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