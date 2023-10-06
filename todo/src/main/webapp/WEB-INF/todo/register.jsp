<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ko">
<head>
    <title>Todo Register</title>
</head>
<body>
    <form action="/todo/register" method="post">
        <div>
            <input type="text" name="title" placeholder="INSERT TITLE">
        </div>
        <div>
            <input type="date" name="dueDate">
        </div>
        <div>
            <button type="submit">RESISTER</button>
            <button type="reset">RESET</button>
        </div>
    </form>
</body>
</html>
