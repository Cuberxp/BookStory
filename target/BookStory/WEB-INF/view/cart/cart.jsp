<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="javax.swing.text.html.HTML" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>购物车</title>

	<jsp:include page="../Bootstrop.jsp"/>

</head>

<body class="main">
	<jsp:include page="/WEB-INF/view/foot.jsp" />
	<jsp:include page="/WEB-INF/view/menu_search.jsp" />

	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td>
					<div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="index">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;购物车
					</div>

					<table cellspacing="0" class="infocontent">
						<tr>
							<td>
								<img src="${pageContext.request.contextPath}/staticresource/ad/page_ad.jpg" width="666" height="89" />
								<table width="100%" border="0" cellspacing="0">
									<tr>
										<td>
											<img src="${pageContext.request.contextPath}/staticresource/images/buy1.gif" width="635" height="38" />
										</td>
									</tr>
									<tr>
										<td>
											<table cellspacing="1" class="carttable">
												<tr>
													<td width="10%">序号</td>
													<td width="30%">商品名称</td>
													<td width="10%">价格</td>
													<td width="20%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数量</td>
													<td width="10%">库存</td>
													<td width="10%">小计</td>
													<td width="10%">取消</td>
												</tr>
											</table> 
                                            <table width="100%" border="0" cellspacing="0">
												 <c:set var="totalPrice" value="0"></c:set>
                                                <c:forEach items="${Cart}" var="enity" varStatus="i">
                                                    <tr>
                                                        <td width="10%">${i.count}</td>
                                                        <td width="30%">${enity.key.name}</td>
                                                        <td width="10%">${enity.key.price}</td>
                                                        <td width="20%">

                                                            <input type="button" value='-' style="width:20px" onclick="choice(${enity.key.id},${enity.value - 1})">
                                                            <input name="text" type="text"  value=${enity.value} style="width:40px;text-align:center" />
                                                            <input type="button" value='+' style="width:20px" onclick="choice(${enity.key.id},${enity.value + 1})">

															<script>
																function choice(id,num) {
																    if(num > ${enity.key.pnum}){
																		alert("不能大于库存");

																		return ;
																	}
																	if(num <= 0){
																		var flag = confirm("你确定要删除这件商品吗？");

																		if(flag){
																			location.href = "${pageContext.request.contextPath}/changeNum.do?id=" + id + "&num=" + num;

																			return ;
																		}

																		return ;
																	}

																	location.href = "${pageContext.request.contextPath}/changeNum.do?id=" + id + "&num=" + num;
																}
															</script>
                                                        </td>

                                                        <td width="10%">${enity.key.pnum}</td>
                                                        <td width="10%">${enity.value * enity.key.price}</td>

                                                        <td width="10%"><a href="${pageContext.request.contextPath}/changeNum.do?id=${enity.key.id}&num=0" class="btn btn-default">取消</a></td>
                                                    </tr>
														<c:set var="totalPrice" value="${totalPrice + enity.value * enity.key.price}"></c:set>
                                                </c:forEach>
                                            </table>

											<table cellspacing="1" class="carttable">
												<tr>
													<td style="text-align:right; padding-right:40px;">
                                                        <font style="color:#FF6600; font-weight:bold">合计：&nbsp;&nbsp;${totalPrice}元</font>
													</td>
												</tr>
											</table>
											<div style="text-align:right; margin-top:10px">
												<a href="${pageContext.request.contextPath}/showProductByCategory.do"><img src="${pageContext.request.contextPath}/staticresource/images/gwc_jx.gif" border="0" /> </a>
												&nbsp;&nbsp;&nbsp;&nbsp;
												<span id="buy" style="cursor:pointer;"><img src="${pageContext.request.contextPath}/staticresource/images/gwc_buy.gif" border="0" /> </span>
											</div>

											<script type="text/javascript">
												$("#buy").click(function () {
													if(${Cart == null}){
														alert("购物车为空!");
													}else{
														location.href = "${pageContext.request.contextPath}/order";
													}
												});
											</script>
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
