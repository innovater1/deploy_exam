<%@page import="com.example.dto.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.example.dto.Product"%>
<%@page import="com.example.dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 선택 삭제 하기</title>
</head>
<body>
	<%@ include file="../inc/dbconn.jsp" %>
	<%
		String productId = request.getParameter("productId");
		if (productId == null || productId.trim().equals("")) {
			// null이 반환되거나 빈 문자열이 들어온 경우
			response.sendRedirect("../product/products.jsp");
			return;
		}
		
		// 유효한 productId인지 확인
		PreparedStatement preparedStatement = null;
		String sql = "delete from cart where productId = ? and orderId = ?";
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, productId);
			preparedStatement.setString(2, orderId);
			preparedStatement.executeUpdate();
		} catch (SQLException e){
			throw  new RuntimeException(e);

		} finally {
			try {
				if (preparedStatement != null) preparedStatement.close();
				if (connection != null) connection.close();
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
		}
		response.sendRedirect("cart.jsp");
	%>
</body>
</html>