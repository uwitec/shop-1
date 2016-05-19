<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>商品分类属性值树</title>
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
                $("#listFrame").attr("src", "${ctx}/categoryAttrVal/goList?id="+treeNode.id);
                return true;
            }
        }
    };

    var zNodes ="${nodes};
    $(document).ready(function(){
        $("#treeDiv, #listFrame").height($.h());
        zTree = $.fn.zTree.init($("#tree"), setting, zNodes);
        var root = zTree.getNodesByFilter(function (node) { return node.level == 0 }, true);
        zTree.expandNode(root, true);
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
            <iframe id="listFrame" name="listFrame" frameborder=0 scrolling=auto width=100% src="${ctx}/categoryAttrVal/goList"></iframe>
        </div>
    </div>
</div>
</body>
</html>


