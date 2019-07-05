<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>BookStore首页</title>

	<jsp:include page="Bootstrop.jsp"/>

</head>

<body class="main">

	<%@include file="head.jsp"%>
	<%@include file="menu_search.jsp" %>

	<div id="divad">
	<img src="${pageContext.request.contextPath}/staticresource/ad/index_ad.jpg" />
	</div>

	<div id="divcontent">
		<table width="900px" border="0" cellspacing="0">
			<tr>
				<td width="497">
					<img src="${pageContext.request.contextPath}/staticresource/images/billboard.gif" width="497" height="38" />
					<table cellspacing="0" class="ctl">
						<tr>
							<td>&middot;<a href="news.html" style="color:#000000">图书3折起，支持在线浏览
									先看再买不后悔,任何商品免费送货</a></td>
						</tr>
						<tr>
							<td>&middot;<a href="news.jsp" style="color:#000000">Lonely
									Planet 已出版600多种旅行指南，几乎覆盖了全世界的每个角落。</a></td>
						</tr>
						<tr>
							<td>&middot;<a href="news.html" style="color:#000000">2007年中旅游图书畅销榜速递中国游,世界游,旅游图书全部7折封顶</a></td>
						</tr>
						<tr>
							<td>&middot;<a href="news.html" style="color:#000000">50万种图书3折,百货团购价热卖
									畅销榜新书速递,促销天天有</a></td>
						</tr>
						<tr>
							<td>&middot;<a href="news.html" style="color:#000000">50万种图书3折,百货团购价热卖
									畅销榜新书速递,促销天天有</a></td>
						</tr>
					</table>
				</td>
				<td style="padding:5px 15px 10px 40px"><table width="100%" border="0" cellspacing="0">
						<tr>
							<td>
								<img src="${pageContext.request.contextPath}/staticresource/images/hottitle.gif" width="126" height="29" />
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellspacing="0">
						<tr>
							<td style="width:50px; text-align:center"><a href="info.html">
								<img src="${pageContext.request.contextPath}/staticresource/bookcover/travelbook.jpg" width="102" height="130" border="0" /> </a><br /> <a href="info.html">TravelBook<br />作者:Lonley Plant</a></td>
							<td style="width:50px; text-align:center"><a href="info.html">
								<img src="${pageContext.request.contextPath}/staticresource/bookcover/java2.jpg" width="102" height="130" border="0" />
							</a>
								<br />
								<a href="info.html">Java2入门经典(JDK5) <br /> 作者:(美)霍顿</a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>


	<jsp:include page="/WEB-INF/view/foot.jsp"/>


</body>
</html>
