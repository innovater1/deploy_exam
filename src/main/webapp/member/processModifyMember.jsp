<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원 수정</title>
  <%@ include file="../inc/dbconn.jsp"%>
</head>
<body>
<%
  request.setCharacterEncoding("UTF-8");

  String sessionMemberId = (String) session.getAttribute("sessionMemberId");
  String passwd = request.getParameter("passwd");
  String memberName = request.getParameter("memberName"); // 고객 이름
  String gender = request.getParameter("gender"); // 성별
  String birthday = request.getParameter("birthyy") + "-" + request.getParameter("birthmm") + "-" + request.getParameter("birthdd"); // 생년월일
  String email = request.getParameter("mail1") + "@" + request.getParameter("mail2"); // 이메일
  String phone = request.getParameter("phone"); // 연락처
  String zipCode = request.getParameter("zipCode"); // 우편번호
  String address01 = request.getParameter("address01"); // 주소 1
  String address02 = request.getParameter("address02"); // 주소 2

  PreparedStatement preparedStatement = null;


  String sql = "update member set passwd = ?, memberName = ?, gender = ?, birthday = ?, email = ?, phone = ?, zipCode = ?, address01 = ?, address02 = ? where memberId = ?";
  preparedStatement = connection.prepareStatement(sql);
  preparedStatement.setString(1, passwd);
  preparedStatement.setString(2, memberName);
  preparedStatement.setString(3, gender);
  preparedStatement.setString(4, birthday);
  preparedStatement.setString(5, email);
  preparedStatement.setString(6, phone);
  preparedStatement.setString(7, zipCode);
  preparedStatement.setString(8, address01);
  preparedStatement.setString(9, address02);
  preparedStatement.setString(10, sessionMemberId);


  if (preparedStatement.executeUpdate() == 1) {
    response.sendRedirect("resultMember.jsp?msg=0");
  }
  else {
    response.sendRedirect("modifyMember.jsp?msg=1");
  }

  if (preparedStatement != null) {
    preparedStatement.close();
  }
  if (connection != null) {
    connection.close();
  }

%>
</body>
</html>