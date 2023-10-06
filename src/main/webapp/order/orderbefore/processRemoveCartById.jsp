<%@page import="dto.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 선택 삭제 하기</title>
</head>
<body>
	<%
		String productId = request.getParameter("productId");
		if (productId == null || productId.trim().equals("")) {
			// null이 반환되거나 빈 문자열이 들어온 경우
			response.sendRedirect("../product/products.jsp");
			return;
		}
		
		// 유효한 productId인지 확인
		ProductRepository productRepository = ProductRepository.getInstance();
		Product product = productRepository.getProductById(productId);
		if (product == null) {
			response.sendRedirect("../exception/exceptionNoProduct.jsp");
			return;
		}
		
		// 세션에서 장바구니 목록 가져옴
		ArrayList<Cart> carts = (ArrayList<Cart>) session.getAttribute("carts");
		for (int i = 0; i < carts.size(); i++) {
			Cart cart = carts.get(i);
			if (cart.getProductId().equals(productId)) {
				carts.remove(cart);
				break;
			}
		}
		response.sendRedirect("cart.jsp");
	%>
</body>
</html>