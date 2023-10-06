<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.mvc.model.BoardDTO" %>


<%
    List boardList = (List) request.getAttribute("boardList");
    int totalRecord = (Integer) request.getAttribute("totalRecord");
    int pageNum = (Integer) request.getAttribute("pageNum");
    int totalPage = (Integer) request.getAttribute("totalPage");
    int startNum = (Integer) request.getAttribute("startNum");
%>
<html lang="ko">
<head>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <title>Board</title>
    <script type="text/javascript">
        function checkForm() {
            location.href = "./boardAddForm.do";
        }
    </script>
</head>
<body>
<jsp:include page="/inc/menu.jsp"/>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">게시판</h1>
    </div>
</div>
    <div class="container">

            <div>
                <div class="text-right">
                    <span class="badge badge-success">전체 <%=totalRecord%>건</span>
                </div>
            </div>

    </div>
    <div style="padding-top: 50px">
        <table class="table table-hover">
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성일</th>
                <th>조회</th>
                <th>글쓴이</th>
            </tr>
            <%
                BoardDTO board;
                for (int j = 0; j < boardList.size(); j++) {
                    board = (BoardDTO) boardList.get(j);

            %>
            <tr>
                <td><%=startNum%></td>
                <td><a href="./boardView.do?num=<%=board.getNum()%>&pageNum=<%=pageNum%>"><%=board.getSubject()%>></a></td>
                <td><%=board.getAddDate()%></td>
                <td><%=board.getHit()%></td>
                <td><%=board.getName()%></td>
            </tr>
            <%
                    startNum--;
                }
            %>
        </table>
    </div>
    <div align="center">
        <c:set var="pageNum" value="<%=pageNum%>" />

        <c:forEach var="i" begin="1" end="<%=totalPage%>">
            <a href="./boardList.do?pageNum=${i}">
                <c:choose>
                    <c:when test="${pageNum==i}">
                       <font color='4C5317'><b> [${i}]</b></font>
                    </c:when>
                    <c:otherwise>
                       <font color='4C5317'><b> [${i}]</b></font>
                    </c:otherwise>
                </c:choose>
            </a>
        </c:forEach>
    </div>
    <div align="left">
    <form action="./BoardList.do" method="post">
        <table>
            <tr>
                <td width="100%" align="left">
                    <select name="items" class="txt">
                        <option value="subject">제목에서</option>
                        <option value="content">본문에서</option>
                        <option value="name">글쓴이에서</option>
                    </select> <input name="text" type="text" />
                    <input type="submit" id="btnAdd" class="btn btn-primary" value="검색" />
                </td>
                <td width="100%" align="right">
                    <a href="#" onclick="checkForm(); return false;" class="btn btn=primary">글쓰기</a>
                </td>
            </tr>
        </table>
    </form>
    </div>
    <hr>
</div>
</body>