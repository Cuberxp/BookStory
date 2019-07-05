<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>电子书城</title>

	<jsp:include page="../Bootstrop.jsp"/>

	<script type="text/javascript">
		function chick() {
			var pnum = ${product.pnum};

			if(pnum <= 0){
				alert("库存不足");

				return ;
			}

			location.href = "${pageContext.request.contextPath}/addProucts.do?id=${product.id}";

			return true;
		}
	</script>

</head>

<body class="main">

	<jsp:include page="/WEB-INF/view/head.jsp" />

	<jsp:include page="/WEB-INF/view/menu_search.jsp" />


	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>

				<td>
					<div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="${pageContext.request.contextPath}index.jsp">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;<a
							href="${pageContext.request.contextPath}/showProductByCategory.do?category=${product.category}">&nbsp;${product.category}</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;${product.name}
					</div>

					<table cellspacing="0" class="infocontent">
						<tr>
							<td><img src="${pageContext.request.contextPath}/staticresource/ad/page_ad.jpg" width="645px" height="84px" />

								<table width="100%%" border="0" cellspacing="0">
									<tr>
										<td width="30%">

											<div class="divbookcover">
												<p>
													<img src="${pageContext.request.contextPath}/staticresource/bookcover${product.imgurl}" width="213" height="269" border="0" />
												</p>
											</div>

											<div style="text-align:center; margin-top:25px">
												<span onclick = "chick()" style="cursor:pointer;">
													<img src="${pageContext.request.contextPath}/staticresource/images/buybutton.gif" border="0"/>
												</span>
											</div>

										</td>

										<td style="padding:20px 5px 5px 5px">
											<img src="${pageContext.request.contextPath}/staticresource/images/miniicon3.gif" width="16" height="13" /><font class="bookname">&nbsp;&nbsp;${product.name}</font>
											<hr/>
											<p>售价：<font color="#FF0000">￥${product.price}</font></p>
											<hr/>
											<p>类别：${product.category}</p>
											<hr/>
											<p>库存:${product.pnum == 0 ? "该商品己缺,库存为0":product.pnum}</p>
											<hr/>
											<p><b>内容简介：${product.description}</b></p>
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
