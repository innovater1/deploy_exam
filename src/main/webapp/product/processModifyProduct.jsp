<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.example.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.example.oreilly.servlet.MultipartRequest"%>
<%@page import="com.example.dao.ProductRepository"%>
<%@page import="com.example.dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
</head>
<body>
	<%@ include file="../inc/dbconn.jsp"%>
	<% 
		request.setCharacterEncoding("UTF-8");
		String folder = "C:\\upload"; // 저장 폴더
		int maxSize = 5 * 1024 * 1024; // 업로드 최대 크기 5MB
		String encType = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, folder, maxSize, encType, new DefaultFileRenamePolicy());
	
		String productId = multipartRequest.getParameter("productId"); // 상품 아이디
		String productName = multipartRequest.getParameter("productName"); // 상품명
		String unitPrice = multipartRequest.getParameter("unitPrice"); // 상품 가격
		System.out.println(multipartRequest.getParameter("unitPrice"));
		String description = multipartRequest.getParameter("description"); // 상품 설명
		String manufacturer = multipartRequest.getParameter("manufacturer"); // 제조사
		String category = multipartRequest.getParameter("category"); // 분류
		String unitInStock = multipartRequest.getParameter("unitInStock"); // 재고수
		String condition = multipartRequest.getParameter("condition"); // 신상품 or 중고품 or 재생품
		String fileName = multipartRequest.getFilesystemName("fileName"); // 파일 이름
		
		// 문자열을 변경
		Integer price = unitPrice.isEmpty() ? 0 : Integer.parseInt(unitPrice);
		Long stock = unitInStock.isEmpty() ? 0L : Long.parseLong(unitInStock);
		
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		String sql = "select * from product where productId = ?";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, productId);
		resultSet = preparedStatement.executeQuery();
		
		if (resultSet.next()) {
			if (fileName != null) {
				sql = "update product set productName = ?, unitPrice = ?, description= ?, manufacturer = ?, category = ?,  unitInStock = ?," +
						"`condition` = ?, fileName = ? where productId = ?";
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, productName);
				preparedStatement.setInt(2, price);
				preparedStatement.setString(3, description);
				preparedStatement.setString(4, manufacturer);
				preparedStatement.setString(5, category);
				preparedStatement.setLong(6, stock);
				preparedStatement.setString(7, condition);
				preparedStatement.setString(8, fileName);
				preparedStatement.setString(9, productId);
				preparedStatement.executeUpdate();
			}
			else {
				sql = "update product set productName = ?, unitPrice = ?, description= ?, manufacturer = ?, category = ?,  unitInStock = ?," +
						"`condition` = ? where productId = ?";
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, productName);
				preparedStatement.setInt(2, price);
				preparedStatement.setString(3, description);
				preparedStatement.setString(4, manufacturer);
				preparedStatement.setString(5, category);
				preparedStatement.setLong(6, stock);
				preparedStatement.setString(7, condition);
				preparedStatement.setString(8, productId);
				preparedStatement.executeUpdate();
			}
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
		
		response.sendRedirect("editProduct.jsp");
	%>
</body>
</html>