<%@page import="java.sql.PreparedStatement"%>
<%@page import="dao.MemberRepository"%>
<%@page import="dto.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로세스 추가멤버</title>
<%@ include file="../inc/dbconn.jsp"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
	<% 
		request.setCharacterEncoding("UTF-8");
	
		String memberId = request.getParameter("memberId"); // 회원 아이디
		String passwd = request.getParameter("passwd"); // 비밀번호
		String memberName = request.getParameter("memberName"); // 이름		
		String gender = request.getParameter("gender"); // 성별
		String birthyy = request.getParameter("birthyy"); // 생일 (년)
		String birthmm = request.getParameter("birthmm"); // 생일 (월)
		String birthdd = request.getParameter("birthdd"); // 생일 (일)
		String birthday = birthyy + "-" + birthmm + "-" + birthdd;
		String mail1 = request.getParameter(" mail1"); // 이메일1 
		String mail2 = request.getParameter("mail2"); // 이메일2
		String email = mail1 + "@" + mail2;
		String phone = request.getParameter("phone"); // 연락처
		String zipCode = request.getParameter("zipCode"); // 우편번호
		String address01 = request.getParameter("address01"); // 주소 1
		String address02 = request.getParameter("address02"); // 주소 1
		
		PreparedStatement preparedStatement = null;
		
		String sql = "INSERT INTO member (memberId, passwd, memberName, gender, birthday, " + 
				"email, phone, zipCode, address01, address02, "
				+ "addDate)" + 
				"VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now())";
		preparedStatement = connection.prepareStatement(sql);
		
		preparedStatement.setString(1, memberId);
		preparedStatement.setString(2, passwd);
		preparedStatement.setString(3, memberName);
		preparedStatement.setString(4, gender);
		preparedStatement.setString(5, birthday);
		preparedStatement.setString(6, email);
		preparedStatement.setString(7, phone);
		preparedStatement.setString(8, zipCode);
		preparedStatement.setString(9, address01);
		preparedStatement.setString(10, address02);
		
		if (preparedStatement.executeUpdate() == 1) { // insert 가 성공적으로 수행.
			response.sendRedirect("resultMember.jsp?msg=1");
		}
		else { 
			response.sendRedirect("addMember.jsp?msg=1");
		}
			
	%>
</body>
</html>