<%@page import="dto.Product"%>
<%@page import="dto.Cart"%>
<%@page import="dao.ProductRepository"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카트 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="../../inc/menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
	<div class="container">
			<div class="row">
				<table width="100%">
					<tr>
						<td align="left">
							<a href="#" class="btn btn-danger btn-removeAll">비우기</a>
							<a href="#" class="btn btn-danger btn-selected">선택삭제</a>
							<a href="./shippingInfo.jsp" class="btn btn-success">주문</a>
						</td>
					</tr>		
				</table>
			</div>
	<div style="padding-top: 50px">
		<form name="frmCart" method="post">
		<input type="hidden" name="productId">
			<table class="table table-hover">
				<tr>
					<td>선택</td>
					<td>사진</td>
					<td>상품</td>
					<td>가격</td>
					<td>수량</td>
					<td>소계</td>
					<td>비고</td>
				</tr>
					
			<%
				ArrayList<Cart> carts = (ArrayList<Cart>) session.getAttribute("carts");
				if (carts == null) {
					 carts = new ArrayList<Cart>();
					 session.setAttribute("carts", carts);
				}
				int sumPrice = 0;
				ProductRepository productRepository = ProductRepository.getInstance();
				for(Cart cart : carts) {
					Product product = productRepository.getProductById(cart.getProductId());
					Integer price = product.getUnitPrice() * cart.getCartCnt();
					sumPrice += price;
			%>
			<tr>
				<td><input type="checkbox" name="checkedId" value="<%=product.getProductId()%>"></td>
				<td><img src="/upload/<%=product.getFileName()%>" style="width:100px"></td>
				<td><a href="../product/product.jsp?productId=<%=product.getProductId()%>">
				<%=product.getProductName()%></a></td>		
				<td><%=product.getUnitPrice()%></td>		
				<td><%=cart.getCartCnt()%></td>		
				<td><%=price%></td>
				<td><a href="#" role="<%=cart.getProductId()%>" class="badge badge-danger btn-removeById">삭제</a> </td>
			</tr>
			<%
				}
			%>
			<tr>
				<td colspan="7">합계:<%=sumPrice%>원</td> 
			</tr>
			</table>
			</form>
		<a href="../product/products.jsp" class="btn btn-secondary"> %laquo; 쇼핑 계속하기</a>
		<script> // 전체 삭제
			document.addEventListener('DOMContentLoaded', function () {
				const btnRemoveAll = document.querySelector(".btn-removeAll");
				btnRemoveAll.addEventListener('click', function () {
					if (confirm('정말 삭제하시겠습니까?')) {
						location.href = './processRemoveCart.jsp';
					}
				});
			});
			
		</script>
		<script> // 선택 삭제
			const btnRemoveSelected = document.querySelector(".btn-selected");
			const frmCart = document.querySelector('form[name=frmCart]');
			btnRemoveSelected.addEventListener('click', function() {
				if (confirm('정말 삭제하시겠습니까?')) {
					
					frmCart.action = '../order/processRemoveCartSelected.jsp';
					frmCart.submit();
				}
			});
		</script>	
		<script> // 선택 삭제
			const btnRemoveByIds = document.querySelectorAll(".btn-removeById");
			btnRemoveByIds.forEach(button => {
				button.addEventListener('click', function(e) {
					if (confirm('정말 삭제하시겠습니까?')) {
						frmCart.productId.value = e.target.role;
						frmCart.action = '../order/processRemoveCartById.jsp';
						frmCart.submit();
					}
				});
			});
		</script>
				
</body>
</html>