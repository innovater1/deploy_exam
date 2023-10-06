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
	<jsp:include page="../inc/menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
	<div class="container">
			<div class="row">
			<%@ include file="../inc/dbconn.jsp"%>
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
				PreparedStatement preparedStatement = null;
				ResultSet resultSet = null;
				int sum = 0;
				
				String sql = "select * from cart C inner join product P on C.productId = P.productId where (orderId=?)";
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, orderId);
				resultSet = preparedStatement.executeQuery();
				while (resultSet.next()) {
					Integer price = resultSet.getInt("unitPrice") * resultSet.getInt("cnt");
					sum += price;
			%>
			<tr>
				<td><input type="checkbox" name="checkedId" value="<%=resultSet.getString("num")%>"></td>
				<td><img src="/upload/<%=resultSet.getString("fileName")%>" style="width:100px"></td>
				<td><a href="../product/product.jsp?productId=<%=resultSet.getString("productId")%>">
				<%=resultSet.getString("productName")%></a></td>		
				<td><%=resultSet.getString("unitPrice")%></td>		
				<td><input type="text" name="cnt_<%=resultSet.getString("productId")%>" value="<%=resultSet.getInt("cnt")%>">
					<a href="#" class="btn-plus" role="<%=resultSet.getString("productId")%>" about="plus">+</a>
					<a href="#" class="btn-minus" role="<%=resultSet.getString("productId")%>" about="minus">-</a>
				</td>		
				<td><%=price%></td>
				<td><a href="#" role="<%=resultSet.getString("productId")%>" class="badge badge-danger btn-removeById">삭제</a> </td>
			</tr>
			<%
				}
			%>
			<tr>
				<td colspan="7">합계:<%=sum%>원</td> 
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