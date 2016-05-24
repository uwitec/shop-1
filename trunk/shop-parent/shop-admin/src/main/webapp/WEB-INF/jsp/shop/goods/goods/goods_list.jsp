<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>商品列表</title>
<%@include file="/jsp/grid.jsp" %>
<script type="text/javascript">


$(function(){
    $("#gridTable").grid({
        url :'${ctx}/goods/doList?id=${id}',
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
				<tag:auth authCode="goods:update">
                    strArr.push("<a href='javascript:;' class='link' onclick=\"go('修改商品','${ctx}/goods/goUpdate?id="+row.id+"')\">修改</a>");
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
				field: 'supperBrandId',
                title: '供应商品牌ID',
                width: '10%'
			},
			{
				field: 'name',
                title: '商品名称',
                width: '10%'
			},
			{
				field: 'code',
                title: '商品编码',
                width: '10%'
			},
			{
				field: 'productCode',
                title: '货品编码',
                width: '10%'
			},
			{
				field: 'price',
                title: '售价',
                width: '10%'
			},
			{
				field: 'title',
                title: '标题',
                width: '10%'
			},
			{
				field: 'status',
                title: '状态',
                width: '10%'
			},
			{
				field: 'newFlag',
                title: '是否新品',
                width: '10%'
			},
			{
				field: 'hotFlag',
                title: '是否热销',
                width: '10%'
			},
			{
				field: 'recommendFlag',
                title: '是否推荐',
                width: '10%'
			},
			{
				field: 'attr1Name',
                title: '主属性名称',
                width: '10%'
			},
			{
				field: 'attr2Name',
                title: '子属性名称',
                width: '10%'
			},
			{
				field: 'attr2Val',
                title: '子属性值',
                width: '10%'
			},
			{
				field: 'attr3Name',
                title: '附加属性名称',
                width: '10%'
			},
			{
				field: 'attr3Val',
                title: '附加属性值',
                width: '10%'
			},
			{
				field: 'cartFlag',
                title: '是否进购物车',
                width: '10%'
			},
			{
				field: 'freeExpressFlag',
                title: '是否免运费',
                width: '10%'
			},
			{
				field: 'saleStartTime',
                title: '促销开始时间',
                width: '10%'
			},
			{
				field: 'saleEndTime',
                title: '促销结束时间',
                width: '10%'
			},
			{
				field: 'limitNum',
                title: '限购数量',
                width: '10%'
			},
			{
				field: 'limitStartTime',
                title: '限购开始时间',
                width: '10%'
			},
			{
				field: 'limitEndTime',
                title: '限购结束时间',
                width: '10%'
			},
			{
				field: 'validityTime',
                title: '有效期',
                width: '10%'
			},
			{
				field: 'countDownFlag',
                title: '是否显示倒计时',
                width: '10%'
			}
		]
    });
});

function del(id){
    $.del({url:"${ctx}/goods/doDel"});
}
function view(id){
    $.openWin({url: "${ctx}/goods/goView?id="+id, title:"查看商品"});
}
</script>
</head>

<body style="overflow: hidden;">
<div class="my_gridBox">
    <form id="queryForm" >
        <table class="query">
            <tbody>
						<tr>
							<td class="td-label">商品名称</td>
							<td class="td-value">
								<input type="text" id="name" name="name" style="width:160px;"  />
							</td>
							<td class="td-label">商品编码</td>
							<td class="td-value">
								<input type="text" id="code" name="code" style="width:160px;"  />
							</td>
						</tr>
						<tr>
							<td class="td-label">标题</td>
							<td class="td-value">
								<input type="text" id="title" name="title" style="width:160px;"  />
							</td>
						</tr>
				</tbody>
			</table>
    </form>
    <div id="mytoolbar" style="margin-left:5px;">
        <tag:auth authCode="goods:save">
        <button type="button" class="btn btn-primary btn-sm" onclick="go('新增商品','${ctx}/goods/goSave')"><i class="fa fa-plus"></i> 新 增 </button>
        </tag:auth>
        <tag:auth authCode="goods:del">
		<button type="button" class="btn btn-danger btn-sm" onclick="del()"><i class="fa fa-trash-o"></i> 删  除</button>
        </tag:auth>
    </div>
    <div id="gridDiv" style="overflow-y: auto;overflow-x: hidden;">
        <table id="gridTable" ></table>
    </div>
</div>
</body>
</html>