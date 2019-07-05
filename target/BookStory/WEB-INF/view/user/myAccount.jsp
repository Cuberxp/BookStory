<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>


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
				<td width="25%"><table width="100%" border="0" cellspacing="0"
						style="margin-top:30px">
						<tr>
							<td class="listtitle">我的帐户</td>
						</tr>
						<tr>
							<td class="listtd"><img src="${pageContext.request.contextPath}/staticresource/images/miniicon.gif" width="9"
													height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a href="${pageContext.request.contextPath}/modifyuserinfo">用户信息</a>
							</td>
						</tr>

						<tr>
							<td class="listtd"><img src="${pageContext.request.contextPath}/staticresource/images/miniicon.gif" width="9"
                                                    height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="${pageContext.request.contextPath}/modifyuserinfoupdateuser">用户信息修改</a></td>
						</tr>

						<tr>
							<td class="listtd">
								<img src="${pageContext.request.contextPath}/staticresource/images/miniicon.gif" width="9" height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a href="${pageContext.request.contextPath}/checkOrder.do">订单查询</a>
							</td>
						</tr>
						<tr>
							<td class="listtd">
								<img src="${pageContext.request.contextPath}/staticresource/images/miniicon.gif" width="9" height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a href="${pageContext.request.contextPath}/logout.do">用戶退出</a>
							</td>
						</tr>
					</table>
				</td>
				<td>
					<div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="${pageContext.request.contextPath}/index">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;<a
							href="${pageContext.request.contextPath}/myAccount">&nbsp;我的帐户</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;欢迎
					</div>
					<table cellspacing="0" class="infocontent">
						<tr>
							<td style="padding:20px"><p>
									<img src="${pageContext.request.contextPath}/staticresource/ad/myad.jpg" width="631" height="436" />
								</p>
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
