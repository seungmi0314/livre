<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%
//한글 깨짐 방지
request.setCharacterEncoding("UTF-8");
// 사용자로부터 전달된 파라미터를 처리하고, 선택된 장르를 배열로 저장합니다.
String memberEmail = request.getParameter("memberEmail");
String memberPw = request.getParameter("memberPw");
String memberNick = request.getParameter("memberNick");
String term_FL = request.getParameter("term_FL");
String gender = request.getParameter("gender"); // 추가된 부분
String[] genreList = request.getParameterValues("genreList");
if (genreList == null) {
    genreList = new String[0];
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/livre/css/finalCheckStyle.css">
    <link rel="stylesheet" href="/livre/css/index.css" />
    <link rel="stylesheet" href="/livre/css/header.css" />
    <script src="/livre/js/finalCheckScript.js"></script>

    <title>최종 완료</title>
</head>
<body>
    <main>
        <header>
            <!-- 헤더 입니다 -->
            <div class="header">
                <img src="/livre/assets/logo.svg" class="h-logo">
                <p class="h-logo-name">livre</p>
            </div>

            <div class="header-right">
                <a href="#">로그인</a> <a href="#">회원가입</a>
            </div>
        </header>
    </main>
    
    <section>
        <div id="progressBar">
            <div id="progress"></div>
            <div id="progressText">0%</div>
        </div>
        <br />

        <form className="checkForm" method="post" action="<%=withFormTag%>">
        <input type="hidden" name="command" value="celebrate">
            <div id="mainBoard">
                <div>
                    <img id="finishImage" src="/livre/assets/undraw_lightbulb_moment_re_ulyo.png">
                </div>
                <div id="finishTitle">
                    <br /> <br /> <br /> 당신에 대해 잘 알았어요! <br /> <br /> 이제 리버로써 활동하러
                    가봐요!
                </div>
                <br /> <br /> <br />
            </div>

            <div id="buttonDiv">
                <button type="button" id="preButton" onclick="goToPreviousPage()">잠시만요.</button>
                <button type="submit" id="nextButton">좋아요!</button>
            </div>

     		<input type="text" value="<%=memberEmail%>" name="memberEmail">
			<input type="text" value="<%=memberPw%>" name="memberPw">
			<input type="text" value="<%=term_FL%>" name="term_FL">
			<input type="text" value="<%=gender%>" name="gender">
			<input type="text" value="<%=memberNick%>" name="memberNick">
			<input type="text" name="genreList" value="<%= genreList != null ? java.util.Arrays.stream(genreList).collect(java.util.stream.Collectors.joining(",")) : "" %>">
        </form>
    </section>
</body>
</html>