<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>电子书城</title>

	<jsp:include page="../Bootstrop.jsp"/>

	<script>
		$(function () {
			$("#submitOrder").click(function () {
				var dataOrderForm = $("#orderForm").serialize();

				$.ajax({
					type:'post',
					url:'${pageContext.request.contextPath}/addOrders.do',
					data:dataOrderForm,
					//返回的数据类型
					dataType:'JSON'
				})

				alert("提交订单成功！")
			})
		})
	</script>
</head>

<body class="main">
	<jsp:include page="/WEB-INF/view/head.jsp" />

	<jsp:include page="/WEB-INF/view/menu_search.jsp" />

	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>

				<td><div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="${pageContext.request.contextPath}/index">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;<a
							href="${pageContext.request.contextPath}/cart">&nbsp;购物车</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;订单
					</div>

					<form id="orderForm">
						<table cellspacing="0" class="infocontent">
							<tr>
								<td><table width="100%" border="0" cellspacing="0">
										<tr>
											<td>
												<img src="${pageContext.request.contextPath}/staticresource/images/buy2.gif" width="635" height="38" />
												<p>您好：${user.username}先生！欢迎您来到商城结算中心</p>
											</td>
										</tr>
										<tr>
											<td><table cellspacing="1" class="carttable">
													<tr>
														<td width="10%">序号</td>
														<td width="40%">商品名称</td>
														<td width="10%">价格</td>
														<td width="10%">类别</td>
														<td width="10%">数量</td>
														<td width="10%">小计</td>
													</tr>
												</table>

												<table width="100%" border="0" cellspacing="0">
													<c:set var="totalPrice" value="0"></c:set>
													<c:forEach items="${Cart}" var="enity" varStatus="i">
														<tr>
															<td width="10%">${i.count}</td>
															<td width="40%">${enity.key.name}</td>
															<td width="10%">${enity.key.price}</td>
															<td width="10%">${enity.key.category}</td>
															<td width="10%"><input name="text" type="text" value="${enity.value}" style="width:20px" readonly="readonly" /></td>
															<td width="10%">${enity.value * enity.key.price}</td>
														</tr>
														<c:set var="totalPrice" value="${totalPrice + enity.value * enity.key.price}"></c:set>
													</c:forEach>
												</table>

												<table cellspacing="1" class="carttable">
													<tr>
														<td style="text-align:right; padding-right:40px;"><font style="color:#FF0000">合计：&nbsp;&nbsp;${totalPrice}元</font></td>
													</tr>
												</table>

												<p>收货地址：<input name="receiverAddress" type="text" style="width:350px" />&nbsp;&nbsp;&nbsp;&nbsp;<a href="#"></a><br />
													收货人：&nbsp;&nbsp;&nbsp;&nbsp;<input name="receiverName" type="text" style="width:150px" />&nbsp;&nbsp;&nbsp;&nbsp;<a href="#"></a><br />
													联系方式：<input type="text" name="receiverPhone" style="width:150px" />&nbsp;&nbsp;&nbsp;&nbsp;
												</p>
												<hr />
												<p style="text-align:right" >
													<button type="button" class="btn-default btn" id="submitOrder">提交表单</button>
												</p>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</div>

	<jsp:include page="/WEB-INF/view/foot.jsp" />


</body>
</html>
