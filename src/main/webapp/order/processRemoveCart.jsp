<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 제거</title>
</head>
<body>
	<%@ include file="../inc/dbconn.jsp" %>
	<%
		PreparedStatement preparedStatement = null;
		
		//String orderId = (String) session.getAttribute("orderId");
		if (orderId == null) {
			// 세션 ID 가져오기
			String sessionId = session.getId();
			
			// 현재 날짜와 시간 가져오기
			java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
			String currentDateTime = simpleDateFormat.format(new java.util.Date());
			
			orderId = currentDateTime + "-" + sessionId;
			session.setAttribute("orderId", orderId);
			}
		
		String sql = "DELETE FROM cart WHERE orderId=?";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, orderId);
		preparedStatement.executeUpdate();
		
		response.sendRedirect("cart.jsp");
	%>
</body>
</html>