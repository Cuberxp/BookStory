<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div id="divhead">
	<table cellspacing="0" class="headtable">
		<tr>
			<td>
				<a href="index"><img src="${pageContext.request.contextPath}/staticresource/images/logo.png" width="95px" height="30px" border="0" /> </a>
			</td>
			<td style="text-align:right">
				<img src="${pageContext.request.contextPath}/staticresource/images/cart.gif" width="26" height="23" style="margin-bottom:-4px" />
				&nbsp;<a href="cart">购物车</a> | <a href="#">帮助中心</a> | <a href="myAccount.do">我的帐户(${user.username})</a>| <a href="register">新用户注册</a>
			</td>
		</tr>
	</table>
</div>