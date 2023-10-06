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
	<title>상품 정보</title>
	</head>
	<body>
		<jsp:include page="../../inc/menu.jsp"/>
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3"> 가전 정보</h1>
			</div>
		</div>
	
	<%
		String productId = request.getParameter("productId");
		ProductRepository productRepository = ProductRepository.getInstance();
		Product product = productRepository.getProductById(productId);
	%>
		<div class="container">
			<div class="row" align="center">
				<div class="col-md-6">
					<img src="/upload/<%=product.getFileName()%>" style="width:100%">
					<h3><%=product.getProductName()%></h3>
					<p><%=product.getDescription() %></p>
					<p><%=product.getUnitPrice() %></p>
					<p><strong>상품 코드</strong> : <span class="badge badge-danger">
						<%=product.getProductId() %>
					</span>
					<p><strong>제조사</strong> : <%=product.getManufacturer() %>
					<p><strong>분류</strong> : <%=product.getCategory() %>
					<p><strong>재고 수</strong> : <%=product.getUnitInStock() %>
					<h4><%=product.getUnitPrice() %>원</h4>
					
					<form name="frmAddCart" action="../order/processAddCart.jsp" method="post">
						<input type="hidden" name="productId" value="<%=product.getProductId()%>">
					</form>
					<p>
						<a href="#" class="btn btn-info"> 장바구니 담기 >> </a>
						<a href="../order/cart.jsp" class="btn btn-info"> 장바구니 목록 >> </a>
						<a href="../product/products.jsp" class="btn btn-secondary"> 상품 목록 >> </a> 
					</p>
				</div>
			<hr>
		</div>
		<script>
			document.addEventListener('DOMContentLoaded', function () {
				const btnCart = document.querySelector(".btn-info");
				const frmAddCart = document.querySelector('form[name=frmAddCart]');
				
				btnCart.addEventListener('click', function () {
					frmAddCart.submit();
				});
			});
		</script>
		<jsp:include page="../../inc/footer.jsp"/>
	</body>
</html>