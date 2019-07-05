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
				<td width="25%">
					<table width="100%" border="0" cellspacing="0" style="margin-top:30px">
						<tr>
							<td class="listtitle">我的帐户</td>
						</tr>
						<tr>
							<td class="listtd"><img src="${pageContext.request.contextPath}/staticresource/images/miniicon.gif" width="9"
													height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a href="${pageContext.request.contextPath}/modifyuserinfo">用户信息</a>
							</td>
						</tr>
						<tr>
							<td class="listtd">
								<img src="${pageContext.request.contextPath}/staticresource/images/miniicon.gif" width="9" height="6" />&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="${pageContext.request.contextPath}/modifyuserinfo">用户信息修改</a>
							</td>
						</tr>

						<tr>
							<td class="listtd">
								<img src="${pageContext.request.contextPath}/staticresource/images/miniicon.gif" width="9" height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a href="checkOrder.do">订单查询</a>
							</td>
						</tr>
						<tr>
							<td class="listtd"><img src="${pageContext.request.contextPath}/staticresource/images/miniicon.gif" width="9" height="6" />
								&nbsp;&nbsp;&nbsp;&nbsp; <a href="${pageContext.request.contextPath}/logout.do">用戶退出</a>
							</td>
						</tr>

					</table>
				</td>
				<td>
					<div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="${pageContext.request.contextPath}/index">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
						<a href="${pageContext.request.contextPath}/myAccount">&nbsp;我的帐户</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;订单查询
					</div>

					<table cellspacing="0" class="infocontent">
						<tr>
							<td style="padding:20px"><p>欢迎${user.username}光临商城！</p>
								<p>
									您有<font style="color:#FF0000">${len}</font>个订单
								</p>
								<table width="100%" border="0" cellspacing="0" class="tableopen">
									<tr>
										<td bgcolor="#A3E6DF" class="tableopentd01">订单号</td>
										<td bgcolor="#A3D7E6" class="tableopentd01">收件人</td>
										<td bgcolor="#A3CCE6" class="tableopentd01">订单时间</td>
										<td bgcolor="#A3B6E6" class="tableopentd01">状态</td>
										<td bgcolor="#A3E2E6" class="tableopentd01">操作</td>
									</tr>
									<c:forEach items="${orders}" var="order">
										<tr>
											<td class="tableopentd02">${order.id}</td>
											<td class="tableopentd02">${order.receiverName}</td>
											<td class="tableopentd02">${order.ordertime}</td>
											<td class="tableopentd02">${order.paystate == 1 ? '已支付' : '未支付'}</td>
											<td class="tableopentd03"><a href="${pageContext.request.contextPath}/checkDetails.do?OrderId=${order.id}">查看</a>&nbsp;&nbsp;
												<a href="${pageContext.request.contextPath}/deleteOrder.do?OrderId=${order.id}">刪除</a>
											</td>
										</tr>
									</c:forEach>
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
