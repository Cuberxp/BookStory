<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>商品列表</title>

	<jsp:include page="../Bootstrop.jsp"/>

</head>

<body class="main">

	<jsp:include page="/WEB-INF/view/head.jsp" />
	<jsp:include page="/WEB-INF/view/menu_search.jsp" />

	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td>
					<div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="${pageContext.request.contextPath}/WEB-INF/view/index.jsp">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;图书列表
					</div>

					<table cellspacing="0" class="listcontent">
						<tr>
							<td>
								<h1>图书目录</h1>
								<hr />
								<h1>${productsName == '*' ? null : productsName}搜索结果</h1>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;共${productsPage.total}种图书

								<hr />
								<div style="margin-top:20px; margin-bottom:5px">
									<img src="${pageContext.request.contextPath}/images/productlist.gif" width="100%" height="38" />
								</div>

								<table cellspacing="0" class="booklist">
									<tr>
										<c:forEach items="${productsPage.list}" var="product">
											<td>
												<div class="divbookpic">
													<p>
														<a href="${pageContext.request.contextPath}/products/product_info?id=${product.id}"><img src="${pageContext.request.contextPath}/bookcover${product.imgurl}" width="115px" height="129px" border="0" /></a>
													</p>
												</div>
												<div class="divlisttitle">
													<a href="${pageContext.request.contextPath}/products/product_info?id=${product.id}">书名:${product.name}<br />售价:${product.price} </a>
												</div>
											</td>
										</c:forEach>
									</tr>
								</table>

								<c:if test="${productsPage.totalPage != 0}">
									<div class="pagination">
										<p>第${productsPage.currentPage}页/共${productsPage.totalPage}页</p>
										<ul>
												<%--如果是第一页的话不能执行上一页--%>
											<c:if test="${productsPage.currentPage == 1}">
												<li class="disablepage">上一页 &lt;&lt;</li>
											</c:if>
											<c:if test="${productsPage.currentPage > 1}">
												<li>
													<a href="${pageContext.request.contextPath}/products/showProductByName?productsName=${productsName}&page=${productsPage.currentPage - 1}">上一页</a>
												</li>
											</c:if>

											<c:forEach begin="1" end="${productsPage.totalPage}" var="i">
											<li><a href="${pageContext.request.contextPath}/products/showProductByName?productsName=${productsName}&page=${i}">${i}</a>
												</c:forEach>

												<c:if test="${productsPage.currentPage == productsPage.totalPage}">
											<li class="nextpage">下一页&gt;&gt;</li>
											</c:if>
											<c:if test="${productsPage.currentPage < productsPage.totalPage}">
												<li>
													<a href="${pageContext.request.contextPath}/products/showProductByName?productsName=${productsName}&page=${productsPage.currentPage + 1}">下一页&gt;&gt;</a>
												</li>
											</c:if>
										</ul>
									</div>
								</c:if>

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
