<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>商品分类列表</title>
<%@include file="/jsp/grid.jsp" %>
<script type="text/javascript">
    $(function(){
    $("#gridTable").grid({
        url :'${ctx}/category/doList?selId=${selId}&goodsFlag=${goodsFlag}',
        idField: 'id',
        pagination: false,
        columns: [
			{
                field: 'opt',
                title: '操作',
                width: '140px',
                align: 'center',
                formatter: function(value, row, index){
                    var strArr = [];
				<tag:auth authCode="category:update">
                    strArr.push("<a href='javascript:;' class='link' onclick=\"go('修改商品分类','${ctx}/category/goUpdate?id="+row.id+"')\">修改</a>");
				</tag:auth>
                <tag:auth authCode="category:show">
                    strArr.push('<span class="link-sep">|</span>')
                    if(row.showFlag){
                        strArr.push("<a href='javascript:;' class='link' onclick=\"show("+row.id+", false)\">隐藏</a>");
                    }else{
                        strArr.push("<a href='javascript:;' class='link' style='color:yellow;' onclick=\"show("+row.id+", true)\">显示</a>");
                    }
                </tag:auth>
                <tag:auth authCode="category:del">
                    strArr.push('<span class="link-sep">|</span>')
                    strArr.push("<a href='javascript:;' class='link' onclick=\"del("+row.id+")\">删除</a>");
                </tag:auth>
					return strArr.join("");
                }
            },
			{
				field: 'name',
                title: '类别名称'
			},
            <c:if test="${goodsFlag}">
            {
                field: 'attrs',
                title: '类别属性',
                formatter: function(value, row, index){
                    if(value){
                        return "<a href=\"javascript:window.parent.location.href='${ctx}/category/goTree?selId="+row.id+"';\" class='link'>"+value+"</a>";
                    }else{
                        return "";
                    }

                }
            },
            </c:if>
			{
				field: 'showFlag',
                title: '是否显示',
                align: "center",
                width: '100px',
                formatter: function(value, row, index){
                    return value ? '<span class="label label-success">是</span>' : '<span class="label label-default">否</span>';
                }
			},
            {
                field: 'goodsFlag',
                title: '可挂商品',
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
    $.del({url:"${ctx}/category/doDel", datas:{id: id}});
}
function view(id){
    $.openWin({url: "${ctx}/category/goView?id="+id, title:"查看商品分类"});
}

function show(id, showFlag){
    var info = "你确定要<label class='label-danger'>显示</label>该分类设置吗？其所有子类别也将变为显示状态!";
    if(!showFlag){
        info = "你确定要<label class='label-danger'>隐藏</label>该分类吗？其所有子类别也将变为隐藏状态，<label class='label-danger'>分类下所有在售商品也将下线！</label>";
    }

    $.confirm(
            {   info: info,
                url: "${ctx}/category/doShow?id="+id+"&showFlag="+showFlag,
                onSuccess: function(){
                    window.parent.location.href = "${ctx}/category/goTree?selId=${selId}";
                },
                onFail: function(){
                    $.alert((showFlag? "显示失败": "隐藏失败") +obj.msg);
                }
            }
    );
}

    function move(id, downFlag){
        $.get("${ctx}/category/doMove?id="+id+"&downFlag="+downFlag, function(obj){
            if(obj.rs){
                window.parent.location.href = "${ctx}/category/goTree?selId=${selId}";
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
        <tag:auth authCode="category:save">
        <button type="button" class="btn btn-primary btn-sm" onclick="go('新增商品分类','${ctx}/category/goSave?selId=${selId}')"><i class="fa fa-plus"></i> 新增分类 </button>
        </tag:auth>
    </div>
    <div id="gridDiv" style="overflow-y: auto;overflow-x: hidden;">
        <table id="gridTable" ></table>
    </div>
</div>
</body>
</html>