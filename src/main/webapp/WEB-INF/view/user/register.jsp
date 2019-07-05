<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>BookStore注册页面</title>

	<jsp:include page="/WEB-INF/view/Bootstrop.jsp"/>

	<script src="${pageContext.request.contextPath}/staticresource/js/user.js"></script>
	<script type="text/javascript">
		function changeImage() {
			document.getElementById("img").src = "${pageContext.request.contextPath}/getCode?time="+new Date().getTime();
		}
		$(function () {
			$("#registerForm").submit(function () {
				return checkEmail() && checkUsername() && checkPassword() && checkRepassword() && checkTelephone();
			});

			$("#username").blur(checkUsername);
			$("#password").blur(checkPassword);
			$("#email").blur(checkEmail);
			$("#repassword").blur(checkRepassword);
			$("#telephone").blur(checkTelephone);
		});
	</script>
</head>


<body class="main">
	<%--导入头 --%>
	<%@include file="/WEB-INF/view/head.jsp"%>

	<%--导入导航条与搜索 --%>
	<%@include file="/WEB-INF/view/menu_search.jsp"%>

	<div id="divcontent">
		<form id="registerForm" action="${pageContext.request.contextPath}/register.do" method="post">
			<table width="850px" border="0" cellspacing="0">
				<tr>
					<td style="padding:30px">
						<h1>新会员注册</h1>
						
						<table width="70%" border="0" cellspacing="2" class="upline">
							<tr align="center">
								<td></td>
								<td><font color="red">${register_err}</font> </td>
								<td></td>
							<</tr>
							<tr>
								<td style="text-align:right; width:20%">会员邮箱：</td>
								<td style="width:40%">
									<input id="email" type="text" class="textinput" name="email" />
								</td>
								<td>
									<font id="email_T" color="#999999"></font>
								</td>
							</tr>
							<tr>
								<td style="text-align:right">会员名：</td>
								<td>
									<input id="username" type="text" class="textinput" name="username" />
								</td>
								<td><font id="username_T" color="#999999"></font></td>
							</tr>
							<tr>
								<td style="text-align:right">密码：</td>
								<td><input id="password" type="password" class="textinput" name="password" /></td>
								<td><font id="password_T" color="#999999"></font></td>
							</tr>
							<tr>
								<td style="text-align:right">重复密码：</td>
								<td><input id="repassword" type="password" class="textinput" name="repassword" /></td>
								<td><font id="repassword_T" color="#999999"></font></td>
							</tr>
							<tr>
								<td style="text-align:right">性别：</td>
								<td colspan="2">&nbsp;&nbsp;<input type="radio"
									name="gender" value="男" checked="checked" /> 男
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"
									name="gender" value="女" /> 女</td>
							</tr>
							<tr>
								<td style="text-align:right">联系电话：</td>
								<td colspan="2"><input id="telephone" type="text" class="textinput"
									style="width:350px" name="telephone" /></td>
								<td><font id="telephone_T" color="#999999"></font></td>
							</tr>
							<tr>
								<td style="text-align:right">个人介绍：</td>
								<td colspan="2"><textarea class="textarea" name="introduce"></textarea>
								</td>
							</tr>

						</table>



						<h1>注册校验</h1>
						<table width="80%" border="0" cellspacing="2" class="upline">
							<tr>
								<td style="text-align:right; width:20%">输入校验码：</td>
								<td style="width:50%"><input type="text" name="textinput" />
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td style="text-align:right;width:20%;">&nbsp;</td>
								<td colspan="2" style="width:50%"><img
									src="${pageContext.request.contextPath}/getCode" width="180"
									height="30" class="textinput" style="height:30px;" id="img" />&nbsp;&nbsp;
									<a href="javascript:void(0);" onclick="changeImage()">看不清换一张</a>
								</td>
							</tr>
						</table>

						<table width="70%" border="0" cellspacing="0">
							<tr>
								<td style="padding-top:20px; text-align:center">
									<input type="image" src="${pageContext.request.contextPath}/staticresource/images/signup.gif" name="submit" border="0">
								</td>
							</tr>
						</table>

					</td>
				</tr>
			</table>
		</form>
	</div>



	<jsp:include page="/WEB-INF/view/foot.jsp" />



</body>
</html>
