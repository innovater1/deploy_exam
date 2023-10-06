<%@page import="java.net.URLEncoder"%>
<%@page import="com.example.dao.MemberRepository"%>
<%@page import="com.example.dto.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송 정보 처리</title>
</head>
<body>
	<% 
		String encoding = "UTF-8";
		request.setCharacterEncoding(encoding);
	
		/*Cookie orderId = new Cookie("orderId", URLEncoder.encode(request.getParameter("orderId"), encoding)); // 주문 아이디
		Cookie orderName = new Cookie("orderName", URLEncoder.encode(request.getParameter("orderName"), encoding)); // 주문자 이름
		Cookie tel = new Cookie("tel", URLEncoder.encode(request.getParameter("tel"), encoding)); // 연락처	
		Cookie zipCode = new Cookie("zipCode", URLEncoder.encode(request.getParameter("zipCode"), encoding)); // 우편번호
		Cookie address01 = new Cookie("address01", URLEncoder.encode(request.getParameter("address01"), encoding)); // 주소 1
		Cookie address02 = new Cookie("address02", URLEncoder.encode(request.getParameter("address02"), encoding)); // 주소 2 */
		
		session.setAttribute("orderId", request.getParameter("orderId"));
	    session.setAttribute("orderName", request.getParameter("orderName"));
	    session.setAttribute("tel", request.getParameter("tel"));
	    session.setAttribute("zipCode", request.getParameter("zipCode"));
	    session.setAttribute("address01", request.getParameter("address01"));
	    session.setAttribute("address02", request.getParameter("address02"));
		
		/*int maxAge = 24 * 60 * 60; // 하루를 초로 나타냄
		orderId.setMaxAge(maxAge);
		orderName.setMaxAge(maxAge);
		tel.setMaxAge(maxAge);
		zipCode.setMaxAge(maxAge);
		address01.setMaxAge(maxAge);
		address02.setMaxAge(maxAge); */
		
		
		
		
		/* response.addCookie(orderId);
		response.addCookie(orderName);
		response.addCookie(tel);
		response.addCookie(zipCode);
		response.addCookie(address01);
		response.addCookie(address02); */
		
		response.sendRedirect("orderConfirm.jsp");
	%>
</body>
</html>