<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 제거</title>
</head>
<body>
	<%
		session.invalidate();
		response.sendRedirect("cart.jsp");
	%>
</body>
</html>