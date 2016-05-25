<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>商品分类树</title>
<%@include file="/jsp/base.jsp" %>
<%@include file="/jsp/ztree.jsp" %>
<script type="text/javascript">
    $(window).resize(function(){
        $("#treeDiv, #listFrame").height($.h());
    });

    var zTree;
    var setting = {
        view: {
            dblClickExpand: false,
            showLine: true,
            selectedMulti: false
        },

        data: {
            key: {
                name: "name"
            },
            simpleData: {
                enable:true,
                idKey: "id",
                pIdKey: "pid",
                rootPId: null
            }
        },

        callback: {
            beforeClick: function(treeId, treeNode) {
                if (treeNode.isParent) {
                    zTree.expandNode(treeNode, true);
                }
                $("#listFrame").attr("src", "${ctx}/category/goRouter?selId="+treeNode.id);
                return true;
            }
        }
    };

    var zNodes = ${nodes};
    $(document).ready(function(){
        zNodes.push({id:0, name:"商品分类", pid: -1, open: true, isParent: true});
        $("#treeDiv, #listFrame").height($.h());
        zTree = $.fn.zTree.init($("#tree"), setting, zNodes);

        <c:if test="${!empty selId}">
        var selNode = zTree.getNodeByParam("id", ${selId});
        zTree.selectNode(selNode);
        zTree.expandNode(selNode, true);
        </c:if>
    });

    function getNode(id){
        return zTree.getNodeByParam("id", id);
    }
</script>
</head>
<body>
<div class="container-fluid">

    <div class="row">
        <div class="col-xs-2" id="treeDiv" style="padding: 0px 5px 0px 0px;overflow: auto;">
            <div id="tree" class="ztree"></div>
        </div>
        <div class="col-xs-10" id="frameDiv" style="padding: 0px;overflow: hidden;">
            <iframe id="listFrame" name="listFrame" frameborder=0 scrolling=auto width=100% src="${ctx}/category/goRouter?selId=${selId}"></iframe>
        </div>
    </div>
</div>
</body>
</html>


