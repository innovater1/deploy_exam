<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ko">
<head>
    <title>Todo Remove</title>
</head>
<body>
    <form id="form2" action="/todo/remove" method="post">
        <input type="hidden" name="tno" value="${dto.tno}" readonly>
        <div>
            <button type="submit">Remove</button>
        </div>
    </form>
</body>
</html>
