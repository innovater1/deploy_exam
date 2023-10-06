<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
<title>장바구니 추가</title>
</head>
<body>
	<%@ include file="../../DB/dbconn.jsp" %>
	<%
		String productId = request.getParameter("productId");
		if (productId == null || productId.trim().equals("")) {
			// null이 반환하거나 빈 문자열이 들어온 경우
			response.sendRedirect("../product/products.jsp");
			return;
		}
		
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		// 주문번소 관련 처리
		String orderId = (String) session.getAttribute("orderId");
		if (orderId == null) {
			// 세션 ID 가져오기
			String sessionId = session.getId();
			
			// 현재 날짜와 시간 가져오기
			java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
			String currentDateTime = simpleDateFormat.format(new java.util.Date());
			
			orderId = currentDateTime + "-" + sessionId;
			session.setAttribute("orderId", orderId);
		}
		
		// 동일한 주문 번호에 같은 상품번호가 있으면 업데이트
		String sql = "SELECT num FROM cart WHERE (orderId=?) AND (productId=?)";
		preparedStatement = conn.prepareStatement(sql);
		preparedStatement.setString(1, orderId);
		preparedStatement.setString(2, productId);
		resultSet =  preparedStatement.executeQuery();
		if (resultSet.next()) {
			sql = "UPDATE cart SET cnt = cnt +1 WHERE num=?";
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setInt(1, resultSet.getInt("num"));
			preparedStatement.executeUpdate();
		}
		else {
			String memberId = (String) session.getAttribute("sessionMemberId");
			memberId = (memberId == null) ? "Guest" : memberId;
			
			int cnt = 1;
			
			sql = "INSERT INTO cart (orderId, memberId, productId, cnt, addDate) " + "VALUES (?, ?, ?, ?, now())";
			try {
				preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setString(1, orderId);
				preparedStatement.setString(2, memberId);
				preparedStatement.setString(3, productId);
				preparedStatement.setInt(4, cnt);
				preparedStatement.executeUpdate();
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
		}
		
		if (resultSet != null) {
			resultSet.close();
		}
		if (preparedStatement != null) {
			preparedStatement.close();
		}
		if (conn != null) {
			conn.close();
		}
		
		// 상품 상세 페이지로 이동
		response.sendRedirect("../product/product.jsp?productId=" + productId);
		
	%>
</body>
</html>