<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>商品分类属性列表</title>
<%@include file="/jsp/grid.jsp" %>
<script type="text/javascript">


$(function(){
    $("#gridTable").grid({
        url :'${ctx}/categoryAttr/doList?categoryId=${categoryId}',
        idField: 'id',
        pagination: false,
        columns: [
			{
                field: 'opt',
                title: '操作',
                width: '20%',
                align: 'center',
                formatter: function(value, row, index){
                    var strArr = [];
				<tag:auth authCode="categoryAttr:update">
                    strArr.push("<a href='javascript:;' class='link' onclick=\"go('修改分类属性','${ctx}/categoryAttr/goUpdate?id="+row.id+"')\">修改</a>");
				</tag:auth>
                <tag:auth authCode="category:del">
                    strArr.push('<span class="link-sep">|</span>')
                    strArr.push("<a href='javascript:;' class='link' onclick=\"del("+row.id+")\">删除</a>");
                </tag:auth>
					return strArr.join("");
                }
            },
			{
				field: 'attrName',
                title: '属性名称',
                width: '120px'
			},
            {
                field: 'attrVals',
                title: '属性值'
            },
			{
				field: 'searchFlag',
                title: '搜索项',
                align: "center",
                width: '100px',
                formatter: function(value, row, index){
                    return value ? '<span class="label label-success">是</span>' : '<span class="label label-default">否</span>';
                }
			},
            {
                field: 'sort',
                title: '排序',
                width: '75px',
                formatter: function(value, row, index){
                    var strArr = [];
                    <tag:auth authCode="category:move">
                    strArr.push('<span class="link-sep">'+value+'</span>')
                    if(index != 0){
                        strArr.push("<div class='pull-right'><a href='javascript:;' class='link' onclick=\"move("+row.id+", false)\"><i class='fa fa-arrow-up'></i></a>");
                    }
                    strArr.push('<span class="link-sep">&nbsp;</span>')
                    strArr.push("<a href='javascript:;' class='link' onclick=\"move("+row.id+", true)\"><i class='fa fa-arrow-down'></i></a></div>");
                    </tag:auth>
                    return strArr.join("");
                }
            }
		]
    });
});

function del(id){
    $.del({url:"${ctx}/categoryAttr/doDel"});
}
function view(id){
    $.openWin({url: "${ctx}/categoryAttr/goView?id="+id, title:"查看分类属性"});
}

function move(id, downFlag){
    $.get("${ctx}/categoryAttr/doMove?id="+id+"&downFlag="+downFlag, function(obj){
        if(obj.rs){
            refresh();
        }else{
            $.alert("移动顺序失败："+obj.msg);
        }
    });
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
        <ol class="breadcrumb" style="line-height: normal;margin-bottom: 0px;">
            <c:forEach items="${parents}" var="item" varStatus="itemIndex">
                <c:if test="${itemIndex.index < lastIndex}">
                    <li><a href="javascript:window.parent.location.href='${ctx}/category/goTree?selId=${item.id}';">${item.name}</a></li>
                </c:if>
                <c:if test="${itemIndex.index == lastIndex}">
                    <li class="active">${item.name}</li>
                </c:if>
            </c:forEach>
        </ol>
        <tag:auth authCode="categoryAttr:save">
        <button type="button" class="btn btn-primary btn-sm" onclick="go('新增分类属性','${ctx}/categoryAttr/goSave?categoryId=${categoryId}')"><i class="fa fa-plus"></i> 新增分类属性 </button>
        </tag:auth>
    </div>
    <div id="gridDiv" style="overflow-y: auto;overflow-x: hidden;">
        <table id="gridTable" ></table>
    </div>
</div>
</body>
</html>