<%@page import="com.example.dao.MemberRepository"%>
<%@page import="com.example.dto.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로세스 추가멤버</title>
</head>
<body>
	private String memberId; // 아이디
	private String passwd; // 비밀번호
	private String memberName; // 이름
	private String gender; // 성별
	private String birthday; // 생일 예) 2000-10-01
	private String email; // 이메일 예) abc@abc.com
	private String phone; // 연락처
	private String address; // 주소

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
		String address = request.getParameter("address"); // 주소
		
		MemberRepository memberRepository = MemberRepository.getInstance();
		
		Member member = new Member();
		member.setMemberId(memberId);
		member.setPasswd(passwd);
		member.setMemberName(memberName);
		member.setGender(gender);
		member.setBirthday(birthday);
		member.setEmail(email);
		member.setPhone(phone);
		member.setAddress(address);
		
		memberRepository.addMember(member);
		
		System.out.println(member); // 과정 확인을 위해 로그를 찍음. 
		
		response.sendRedirect("");
	%>
</body>
</html>