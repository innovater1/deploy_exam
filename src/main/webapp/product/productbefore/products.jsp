<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%@ page errorPage="/exception/exceptionNoProduct.jsp"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<meta charset="UTF-8"><base>
	<title>상품 목록</title>
	</head>
	<body>
		<jsp:include page="../../inc/menu.jsp"/>
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">컴퓨터 목록</h1>
			</div>
		</div>
	
	<%
		ProductRepository productRepository = ProductRepository.getInstance();
		ArrayList<Product> products = productRepository.getAllProducts();
	%>
		<div class="container">
			<div class="row" align="center">
		<%//list의 경우 foreach문으로 작성하는 것이 유리
		for(Product product : products) {
		%>
		<div class="col-md-4">
			<img src="/upload/<%=product.getFileName()%>" style="width:100%">
			<h3><%=product.getProductName()%></h3>
			<p><%=product.getDescription() %></p>
			<p><%=product.getUnitPrice() %></p>
			<p><a href="../product/product.jsp?productId=<%=product.getProductId()%>" class="btn btn-secondary" role="button">
			상세정보 >></a></p>
		</div>
		<%
		}
		%>
		</div>
		<hr>
		</div>
		<jsp:include page="../../inc/footer.jsp"/>
	</body>
</html>