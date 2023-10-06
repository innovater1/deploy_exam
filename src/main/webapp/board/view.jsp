<%@ page import="com.example.mvc.model.BoardDTO" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    BoardDTO board = (BoardDTO) request.getAttribute("board");
    String pageNum = request.getParameter("pageNum");
    String sessionMemberId = (String) session.getAttribute("sessionMemberId");
%>
<html lang="ko">
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <meta charset="UTF-8">
    <title>View</title>
</head>
<body>
    <jsp:include page="../inc/menu.jsp"/>
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">게시판</h1>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 control-label">성명</label>
        <div class="col-sm-5">
            <%=board.getName()%>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 control-label">제목</label>
        <div class="col-sm-5">
            <%=board.getSubject()%>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 control-label">내용</label>
        <div class="col-sm-5">
            <%=board.getContent()%>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-offset-2 col-sm-10">
            <%
                if(sessionMemberId != null && sessionMemberId.equals(board.getMemberId())) {
                    // 비회원의 경우 sessionMemberId != null 수행 후 종료
                //if(sessionMemberId.equals(board.getMemberId()) && sessionMemberId != null) {
            %>
            <form name="frmView" method="post">
                <input type="hidden" name="pageNum" value="<%=pageNum%>">
                <input type="hidden" name="num" value="<%=board.getNum()%>">
            </form>
            <span class="btn btn-danger btn-remove"> 삭제 </span>
            <span class="btn btn-success btn-modify"> 수정 </span>
            <%
                }
            %>
            <a href="./boardList.do?pageNum=<%=pageNum%>" class="btn btn-primary"> 목록 </a>
        </div>
    </div>
    <hr>
</div>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const btnModify = document.querySelector('.btn-modify');
            const btnRemove = document.querySelector('.btn-remove');
            const frmView = document.querySelector('form[name=frmView]');

            btnModify.addEventListener('click', function () {
                frmView.action = './boardModifyForm.do';
                frmView.submit();
            });
            btnRemove.addEventListener('click', function () {
                if (confirm('정말 삭제 하시겠습니까??')) {
                frmView.action = './boardRemoveAction.do';
                frmView.submit();

                }
            });
        });
    </script>
    <jsp:include page="../inc/footer.jsp"/>
</body>
</html>
