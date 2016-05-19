<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>查看 商品分类属性值</title>
    <%@include file="/jsp/form.jsp" %>
    <script type="text/javascript">
    </script>
</head>

<body>
<div class="row panel-row" id="panelDiv1" >
    <div class="panel panel-default">
        <div class="panel-heading collapsed panel-heading-style" href="#panel1" data-toggle="collapse" aria-expanded="false">商品分类属性值详情</div>
        <div id="panel1" class="panel-collapse collapse in" aria-expanded="true" >
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="panel-body-table table table-bordered " >
                        <colgroup>
                            <col class="col-xs-1">
                            <col class="col-xs-5">
                            <col class="col-xs-1">
                            <col class="col-xs-5">
                        </colgroup>
                        <tbody>
                          <tr>
                              <th scope="row">id</th>
                              <td>
                              ${item.id}
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">分类属性ID</th>
                              <td>
                              ${item.categoryAttrId}
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">属性值</th>
                              <td>
                              ${item.val}
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">排序</th>
                              <td>
                              ${item.sort}
                              </td>
                          </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
