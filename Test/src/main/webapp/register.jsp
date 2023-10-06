<%@ page contentType="text/html;charset=UTF-8" %>

<html lang="ko">
<head>
    <title>Register</title>
    <meta charset="UTF-8">
</head>
<body>
    <form action="/member/register" method="post">
        <h2>환영합니다.</h2>
        <p>통합 근태관리 솔루션 시프티, 지금 바로 시작해보세요.</p>
        <p>이메일 <input type="text" name="memberEmail"></p>
        <p>비밀번호  <input type="text" name="passwd"></p>
        <p>* 8자 이상이면서 최소한 숫자 하나와 글자 하나를 포함해야 합니다</p>
        <p>비밀번호 재확인  <input type="text" name="passwdCheck"></p>
        <p>* 비밀번호를 다시 입력해주세요</p>
        <p>이름 <input type="text" name="memberName"></p>
        <p>전화번호 (선택)  <input type="text" name="phone"></p>
        <p><input type="checkbox" name="agreeTerms"><a href="#">이용약관</a>과<a href="#">개인정보 방침</a>에 동의합니다.</p>
        <p><input type="submit" value="가입하기"></p>
    </form>
</body>
</html>
