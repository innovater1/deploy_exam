<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
	
	<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<meta charset="UTF-8"><base>
	<title>회원등록</title>
	</head>
	<body>
		<jsp:include page="../../inc/menu.jsp"/>
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">회원등록</h1>
			</div>
		</div>
		<div class="container">
		<form name="frmMember" action="./processAddMember.jsp" method="post">
			<div class="form-group row" >
				<label class="col-sm-2">회원 아이디</label>
				<div class="col-md-3">
			 	<input type="text" name="memberId" class="form-control">
				</div>
			</div>
			<div class="form-group row" >
				<label class="col-sm-2">비밀번호</label>
				<div class="col-md-3">
			 	<input type="text" name="passwd" class="form-control">
				</div>
			</div>
			<div class="form-group row" >
				<label class="col-sm-2">비밀번호 확인</label>
				<div class="col-md-3">
			 	<input type="text" name="passwdcheck" class="form-control">
				</div>
			</div>
			<div class="form-group row" >
				<label class="col-sm-2">이름</label>
				<div class="col-md-3">
			 	<input type="text" name="memberName" class="form-control">
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">성별</label>
				<div class="col-sm-10">
					<input name="gender" type="radio" value="남"> 남
					<input name="gender" type="radio" value="여"> 여
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">생일</label>
				<div class="col-sm-4  ">
					<input type="text" name="birthyy" maxlength="4" placeholder="년(4자)" size="6">
					<select name="birthmm">
						<option value="">월</option>
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select> <input type="text" name="birthdd" maxlength="2" placeholder="일" size="4">
				</div>
			</div>
			<div class="form-group  row ">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-10">
					<input type="text" name="mail1" maxlength="50">@
					<select name="mail2">
						<option>naver.com</option>
						<option>daum.net</option>
						<option>gmail.com</option>
						<option>nate.com</option>
					</select>
				</div>
			</div>
			<div class="form-group row" >
				<label class="col-sm-2">연락처</label>
				<div class="col-md-3">
			 	<input type="text" name="phone" class="form-control">
				</div>
			</div>
			<div class="form-group row" >
				<label class="col-sm-2">우편번호</label>
				<div class="col-md-3">
			 	<input type="text" name="zipCode" class="form-control">
				</div>
			</div>
			<div class="form-group row" >
				<label class="col-sm-2">주소 1</label>
				<div class="col-md-3">
			 	<input type="text" name="address01" class="form-control">
				</div>
			</div>
			<div class="form-group row" >
				<label class="col-sm-2">주소 2</label>
				<div class="col-md-3">
			 	<input type="text" name="address02" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-10">
					<input type="submit" class="btn btn-primary" value="가입">
				</div>
			</div>	
			</form>
			</div>
		<jsp:include page="../../inc/footer.jsp"/>
	</body>
</html>