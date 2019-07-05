<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>电子书城</title>

	<jsp:include page="../Bootstrop.jsp"/>

</head>


<body class="main">

	<jsp:include page="/WEB-INF/view/head.jsp" />
	<jsp:include page="/WEB-INF/view/menu_search.jsp" />

	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>

				<td><div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="${pageContext.request.contextPath}/index">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;订单详细信息
					</div>

					<table cellspacing="0" class="infocontent">
						<tr>
							<td>
								<table width="100%" border="0" cellspacing="0">
									<tr>
										<td>
											<p>订单编号:${OrderInfo.orderId}</p></td>
									</tr>
									<tr>
										<td>
											<table cellspacing="1" class="carttable">
												<tr>
													<td width="10%">序号</td>
													<td width="40%">商品名称</td>
													<td width="10%">价格</td>
													<td width="10%">数量</td>
													<td width="10%">小计</td>
												</tr>
											</table>
											<c:set var="totalPrice" value="0"/>
											<c:forEach items="${OrderInfo.productsList}" var="product" varStatus="s">
												<table width="100%" border="0" cellspacing="0">
													<tr>
														<td width="10%">${s.count}</td>
														<td width="40%">${product.name}</td>
														<td width="10%">${product.price}</td>
														<td width="10%">${product.pnum}</td>
														<td width="10%">${product.price * product.pnum}</td>
													</tr>
												</table>
												<c:set var="totalPrice" value="${totalPrice + product.price*product.pnum}"/>
											</c:forEach>

											<table cellspacing="1" class="carttable">
												<tr>
													<td style="text-align:right; padding-right:40px;"><font
														style="color:#FF0000">合计：&nbsp;&nbsp;${totalPrice}</font></td>
												</tr>
											</table>

											<p>
												收货地址：${OrderInfo.receiverAddress}&nbsp;&nbsp;&nbsp;&nbsp;<br />
												收货人：&nbsp;&nbsp;&nbsp;${OrderInfo.receiverName}&nbsp;&nbsp;&nbsp;<br />
												联系方式：${OrderInfo.receiverPhone}
											</p>
											<hr>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>



	<jsp:include page="/WEB-INF/view/foot.jsp" />


</body>
</html>
