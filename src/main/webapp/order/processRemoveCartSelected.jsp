<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<meta charset="UTF-8"><base>
	<title>장바구니 수정 삭제</title>
	</head>
	<body>
		<%@ include file="../inc/dbconn.jsp"%>
		<%
			String productId = request.getParameter("productId");
		
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;
			
			String sql = "select * from product where productId = ?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, productId);
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) { // productId에 대한 상품이 있다면
				sql = "delete from product where productId =?";
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, productId);
				preparedStatement.executeUpdate();
			}
			else {
				out.println("일치하는 상품이 없습니다.");
			}
			if (resultSet != null) {
				resultSet.close();
			}
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			if (connection != null) {
				connection.close();
			}
		%>
		