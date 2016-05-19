<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>查看 商品分类</title>
    <%@include file="/jsp/form.jsp" %>
    <script type="text/javascript">
    </script>
</head>

<body>
<div class="row panel-row" id="panelDiv1" >
    <div class="panel panel-default">
        <div class="panel-heading collapsed panel-heading-style" href="#panel1" data-toggle="collapse" aria-expanded="false">商品分类详情</div>
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
                              <th scope="row">主键</th>
                              <td>
                              ${item.id}
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">父类别</th>
                              <td>
                              ${item.pid}
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">类别名称</th>
                              <td>
                              ${item.name}
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">是否显示</th>
                              <td>
                              ${item.showFlag}
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
