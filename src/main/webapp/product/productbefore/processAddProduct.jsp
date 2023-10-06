<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
		
		ProductRepository productRepository = ProductRepository.getInstance();
		
		Product product = new Product();
		product.setProductId(productId);
		product.setProductName(productName);
		product.setUnitPrice(price);
		product.setDescription(description);
		product.setManufacturer(manufacturer);
		product.setCategory(category);
		product.setUnitInStock(stock);
		product.setCondition(condition);
		product.setFileName(fileName);
		
		productRepository.addProduct(product);
		
		System.out.println(product); // 과정 확인을 위해 로그를 찍음. 
		
		response.sendRedirect("products.jsp");
	%>
</body>
</html>