<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>电子商城</title>


	<jsp:include page="../Bootstrop.jsp"/>

	<script type="text/javascript" src="${pageContext.request.contextPath}/staticresource/js/my.js"></script>

</head>

<body class="main" onload="startSecond();">

	<jsp:include page="/WEB-INF/view/head.jsp" />
	<jsp:include page="/WEB-INF/view/menu_search.jsp" />
	<div id="divcontent">
		<table width="850px" border="0" cellspacing="0">
			<tr>
				<td style="padding:30px; text-align:center">
					<table width="60%" border="0" cellspacing="0" style="margin-top:70px">
						<tr>
							<td style="width:98PX"><img src="${pageContext.request.contextPath}/staticresource/images/IconTexto_WebDev_009.jpg" width="128" height="128" />
							</td>
							<td style="padding-top:30px">
								<font style="font-weight:bold; color:#FF0000">帐户激活成功</font><br /> <br /><a href="${pageContext.request.contextPath}/index"><span id="second">5</span>秒后自动为您转跳回首页</a>
							</td>
						</tr>
					</table>
					<h1>&nbsp;</h1>
				</td>
			</tr>
		</table>
	</div>



	<jsp:include page="/WEB-INF/view/foot.jsp" />


</body>
</html>
