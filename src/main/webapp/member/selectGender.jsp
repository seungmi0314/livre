<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%
// 사용자로부터 전달된 파라미터를 처리하고, 선택된 장르를 배열로 저장합니다.
String memberEmail = request.getParameter("memberEmail");
String memberPw = request.getParameter("memberPw");
String term_FL = request.getParameter("term_FL");
String gender = request.getParameter("gender"); // 추가된 부분
String[] genreList = request.getParameterValues("genreList");
if (genreList == null) {
 // 선택된 장르가 없는 경우, 빈 배열로 초기화합니다.
 genreList = new String[0];
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/livre/css/selectGenderStyle.css">
<link rel="stylesheet" href="/livre/css/header.css" />
<script>
// 이미지 선택 함수
function selectGender(gender) {
    // 모든 이미지에서 보더 스타일 제거
    var allImages = document.querySelectorAll('img');
    allImages.forEach(function(img) {
        img.classList.remove('showBorder');
    });

    // 선택된 이미지에 보더 스타일 추가
    var selectedImage = document.getElementById(gender + 'Icon');
    selectedImage.classList.add('showBorder');
}

// 초기 진행 상태 설정
var progress = 25;

// 진행 상태 갱신 함수
function updateProgress() {
    var progressBar = document.getElementById('progress');
    var progressText = document.getElementById('progressText');

    // 진행도 업데이트
    progressBar.style.width = progress + '%';
    progressText.innerText = progress + '%';

    // 다음 진행 상태로 이동
    if (progress < 50) {
        progress++;
    }
}

// 10ms마다 진행 상태 업데이트
setInterval(updateProgress, 10);

function moveToNextPage() {
    // 다음 페이지로 이동합니다.
    window.location.href = "/livre/member/createNickname.jsp";
}

// preButton을 눌렀을 때 이전 페이지로 돌아가는 함수
function goToPreviousPage() {
    history.back(); // 브라우저의 이전 페이지로 이동
}

// 이미지 선택 함수
function selectGender(gender) {
    // 모든 이미지에서 보더 스타일 제거
    var allImages = document.querySelectorAll('img');
    allImages.forEach(function(img) {
        img.classList.remove('showBorder');
    });

    // 선택된 이미지에 보더 스타일 추가
    var selectedImage = document.getElementById(gender + 'Icon');
    selectedImage.classList.add('showBorder');
}
</script>

<title>성별선택</title>
</head>
<body>
<section>
    <div id="progressBar">
        <div id="progress"></div>
        <div id="progressText">0%</div>
    </div>
    <br />
    <form className="checkForm" method="post" action="<%=withFormTag%>">
    <input type="hidden" name="command" value="createNickname">
        <div id="mainBoard">
            <div id="questionTitle">
                Q. 당신의 성별을 알려주세요 <br /> <br /> <br /> <br />
            </div>
            <br />
            <div id="firstLineDiv">
                <input type="radio" id="manRadio" name="gender" class="hiddenRadio" value="man" onclick="selectGender('man');"> 
                <label for="manRadio"> 
                    <img id="manIcon" src="/livre/assets/Man free icons designed by Freepik.jpg">
                    <div id="manText">남자</div>
                </label> 
                <input type="radio" id="womanRadio" name="gender" class="hiddenRadio" value="woman" onclick="selectGender('woman');"> 
                <label for="womanRadio">
                    <img id="womanIcon" src="/livre/assets/Mom free vector icons designed by Freepik.jpg">
                    <div id="womanText">여자</div>
                </label>
            </div>
            <div id="buttonDiv">
                <button type="button" id="preButton" onclick="goToPreviousPage()">이전</button>
                <button type="submit" id="nextButton">다음</button>
            </div>
        </div>
        <input type="hidden" value="<%=memberEmail%>" name="memberEmail">
        <input type="hidden" value="<%=memberPw%>" name="memberPw">
        <input type="hidden" value="<%=term_FL%>" name="term_FL">
		<input type="hidden" name="genreList" value="<%= genreList != null ? java.util.Arrays.stream(genreList).collect(java.util.stream.Collectors.joining(",")) : "" %>">
    </form>
</section>
</body>
</html>