<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>商品分类属性列表</title>
<%@include file="/jsp/grid.jsp" %>
<script type="text/javascript">


$(function(){
    $("#gridTable").grid({
        url :'${ctx}/categoryAttr/doList?id=${id}',
        idField: 'id',
        columns: [
            {
                field: 'chk',
                checkbox: true,
                width: '3%',
                align: 'center'
            },
			{
                field: 'opt',
                title: '操作',
                width: '20%',
                align: 'center',
                formatter: function(value, row, index){
                    var strArr = [];
				<tag:auth authCode="categoryAttr:update">
                    strArr.push("<a href='javascript:;' class='link' onclick=\"go('修改商品分类属性','${ctx}/categoryAttr/goUpdate?id="+row.id+"')\">修改</a>");
				</tag:auth>
					return strArr.join("");
                }
            },
			{
				field: 'id',
                title: 'id',
                width: '10%'
			},
			{
				field: 'categoryId',
                title: '商品分类ID',
                width: '10%'
			},
			{
				field: 'attrName',
                title: '属性名称',
                width: '10%'
			},
			{
				field: 'searchFlag',
                title: '是否搜索项',
                width: '10%'
			},
			{
				field: 'sort',
                title: '排序',
                width: '10%'
			}
		]
    });
});

function del(id){
    $.del({url:"${ctx}/categoryAttr/doDel"});
}
function view(id){
    $.openWin({url: "${ctx}/categoryAttr/goView?id="+id, title:"查看商品分类属性"});
}
</script>
</head>

<body style="overflow: hidden;">
<div class="my_gridBox">
    <form id="queryForm" >
        <table class="query">
            <tbody>
				</tbody>
			</table>
    </form>
    <div id="mytoolbar" style="margin-left:5px;">
        <tag:auth authCode="categoryAttr:save">
        <button type="button" class="btn btn-primary btn-sm" onclick="go('新增商品分类属性','${ctx}/categoryAttr/goSave')"><i class="fa fa-plus"></i> 新 增 </button>
        </tag:auth>
        <tag:auth authCode="categoryAttr:del">
		<button type="button" class="btn btn-danger btn-sm" onclick="del()"><i class="fa fa-trash-o"></i> 删  除</button>
        </tag:auth>
    </div>
    <div id="gridDiv" style="overflow-y: auto;overflow-x: hidden;">
        <table id="gridTable" ></table>
    </div>
</div>
</body>
</html>