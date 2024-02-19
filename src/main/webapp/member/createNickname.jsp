<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%
// 한글 깨짐 방지
request.setCharacterEncoding("UTF-8");
// 사용자로부터 전달된 파라미터를 처리하고, 선택된 장르를 배열로 저장합니다.
String memberEmail = request.getParameter("memberEmail");
String memberPw = request.getParameter("memberPw");
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
    <link rel="stylesheet" href="/livre/css/createNicknameStyle.css">
    <script src="/livre/js/createNicknameScript.js"></script>
    <link rel="stylesheet" href="/livre/css/index.css" />
    <link rel="stylesheet" href="/livre/css/header.css" />

    <title>닉네임 기입</title>
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
        <br/>
        <form className="checkForm" method="post" action="<%=withFormTag%>">
        <input type="hidden" name="command" value="finalCheck">
            <div id="mainBoard">
                <div id="questionTitle">
                    Q. 이제 livre 에서 활동할
                    <br/>
                    <span id="askNickname">
                    멋진 별명을 알려주세요.
                    </span>
                </div>
                <br />
                <div id="inputNicknameDiv">
                    <input type="text" name="memberNick" placeholder="멋진 이름을 지어주세요!">
                    <br/>
                </div>
                <span id="greating">
                (이)라고 합니다.
                <br/>
                잘부탁해요!
                </span>
                <br/>
                <span id="nicknameAdvice">
                별명은 다른 리버에게 보이는 나의 얼굴입니다.
                <br/>
                언제든 바꿀 수 있지만, 신중히 지어주세요!
                </span>
                <br/>
                <div>
                    <img id="nicknameImage" src="/livre/assets/undraw_travel_together_re_kjf2.png">
                </div>
            </div>

            <div id="buttonDiv">
                <button type="button" id="preButton" onclick="goToPreviousPage()">이전</button>
                <button type="submit" id="nextButton">다음</button>
            </div>
        	<input type="hidden" value="<%=memberEmail%>" name="memberEmail">
			<input type="hidden" value="<%=memberPw%>" name="memberPw">
			<input type="hidden" value="<%=term_FL%>" name="term_FL">
			<input type="hidden" value="<%=gender%>" name="gender">
			<input type="hidden" name="genreList" value="<%= genreList != null ? java.util.Arrays.stream(genreList).collect(java.util.stream.Collectors.joining(",")) : "" %>">





        </form>
    </section>
</body>
</html>