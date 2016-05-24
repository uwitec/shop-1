<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>查看 商品</title>
    <%@include file="/jsp/form.jsp" %>
    <script type="text/javascript">
    </script>
</head>

<body>
<div class="row panel-row" id="panelDiv1" >
    <div class="panel panel-default">
        <div class="panel-heading collapsed panel-heading-style" href="#panel1" data-toggle="collapse" aria-expanded="false">商品详情</div>
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
                              <th scope="row">商品分类ID</th>
                              <td>
                              ${item.categoryId}
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">供应商品牌ID</th>
                              <td>
                              ${item.supperBrandId}
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">商品名称</th>
                              <td>
                              ${item.name}
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">商品编码</th>
                              <td>
                              ${item.code}
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">货品编码</th>
                              <td>
                              ${item.productCode}
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">售价</th>
                              <td>
                              ${item.price}
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">标题</th>
                              <td>
                              ${item.title}
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">是否新品</th>
                              <td>
                              ${item.newFlag}
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">是否热销</th>
                              <td>
                              ${item.hotFlag}
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">是否推荐</th>
                              <td>
                              ${item.recommendFlag}
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">主属性名称</th>
                              <td>
                              ${item.attr1Name}
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">子属性名称</th>
                              <td>
                              ${item.attr2Name}
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">子属性值</th>
                              <td>
                              ${item.attr2Val}
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">附加属性名称</th>
                              <td>
                              ${item.attr3Name}
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">附加属性值</th>
                              <td>
                              ${item.attr3Val}
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">是否进购物车</th>
                              <td>
                              ${item.cartFlag}
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">是否免运费</th>
                              <td>
                              ${item.freeExpressFlag}
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">促销开始时间</th>
                              <td>
                              ${item.saleStartTime}
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">促销结束时间</th>
                              <td>
                              ${item.saleEndTime}
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">限购数量</th>
                              <td>
                              ${item.limitNum}
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">限购开始时间</th>
                              <td>
                              ${item.limitStartTime}
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">限购结束时间</th>
                              <td>
                              ${item.limitEndTime}
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">有效期</th>
                              <td>
                              ${item.validityTime}
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">是否显示倒计时</th>
                              <td>
                              ${item.countDownFlag}
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
