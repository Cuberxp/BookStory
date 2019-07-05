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

	<script src="${pageContext.request.contextPath}/staticresource/js/user.js"></script>

	<script>
		$(function () {
			$("#updateForm").submit(function () {
				return checkPassword() && checkRepassword() && checkTelephone();
			});
			$("#password").blur(checkPassword);
			$("#repassword").blur(checkRepassword);
			$("#telephone").blur(checkTelephone);
		});
	</script>

</head>

<body class="main">
	<jsp:include page="/WEB-INF/view/head.jsp" />
	<jsp:include page="/WEB-INF/view/menu_search.jsp" />

	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td width="25%">
					<table width="100%" border="0" cellspacing="0"
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
							<td class="listtd"><img src="${pageContext.request.contextPath}/staticresource/images/miniicon.gif" width="9"
                                                    height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a href="${pageContext.request.contextPath}/checkOrder.do">订单查询</a>
							</td>
						</tr>

						<tr>
							<td class="listtd"><img src="${pageContext.request.contextPath}/staticresource/images/miniicon.gif" width="9"
                                                    height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a href="${pageContext.request.contextPath}/logout.do">用戶退出</a>
							</td>
						</tr>
					</table>
				</td>
				<td>
					<div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="${pageContext.request.contextPath}/WEB-INF/view/index.jsp">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/myAccount">&nbsp;我的帐户</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;用户信息修改
					</div>

					<table cellspacing="0" class="infocontent">
						<tr>
							<td>
								<form id="updateForm" action="${pageContext.request.contextPath}/updateUser.do" method="post">
									<input type="hidden" name="id" value="${user.id}">
									<table width="100%" border="0" cellspacing="2" class="upline">
										<tr>
											<td style="text-align:right; width:20%">会员邮箱：</td>
											<td style="width:40%; padding-left:20px">${user.email}</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td style="text-align:right">会员名：</td>
											<td style="padding-left:20px">${user.username}</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td style="text-align:right">修改密码：</td>
											<td>
												<input type="password" name="password" id="password" class="textinput" />
											</td>
											<td>
												<font di="password_T" color="#999999"></font>
											</td>
										</tr>
										<tr>
											<td style="text-align:right">重复密码：</td>
											<td><input type="password" class="textinput" id="repassword"/>
											</td>
											<td><font id="repassword_T" color="#999999"></font></td>
										</tr>
										<tr>
											<td style="text-align:right">性别：</td>
											<td colspan="2">&nbsp;&nbsp;
												<c:if test="${user.gender == '男'}">
													<input type="radio" name="gender" value="男" checked="checked" /> 男
												</c:if>
												<c:if test="${user.gender != '男'}">
													<input type="radio" name="gender" value="男" /> 男
												</c:if>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<c:if test="${user.gender == '女'}">
													<input type="radio" name="gender" value="女" checked="checked" /> 女
												</c:if>
												<c:if test="${user.gender != '女'}">
													<input type="radio" name="gender" value="女" /> 女
												</c:if>
										</tr>
										<tr>
											<td style="text-align:right">联系方式：</td>
											<td colspan="2">
												<input name="telephone" type="text" id="telephone" value="${user.telephone}" class="textinput" />
											</td>
											<td><font id="telephone_T" color="#999999"></font></td>
										</tr>

										<tr>
											<td style="text-align:right">&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
									</table>

									<p style="text-align:center">

										<input type="image" src="${pageContext.request.contextPath}/staticresource/images/botton_gif_025.gif" border="0">

									</p>
									<p style="text-align:center">&nbsp;</p>
								</form>
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
