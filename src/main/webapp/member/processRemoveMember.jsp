<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 페이지</title>
<%@ include file="../inc/dbconn.jsp"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String sessionMemberId = (String) session.getAttribute("sessionMemberId");
		
		PreparedStatement preparedStatement = null;
		String sql = "delete from member where memberId = ?";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, sessionMemberId);
		preparedStatement.executeUpdate();
		
		session.invalidate();
		
		response.sendRedirect("resultMember.jsp");
	%>
</body>
</html>