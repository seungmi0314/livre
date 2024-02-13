<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%
String memberEmail = request.getParameter("memberEmail");
String memberPw = request.getParameter("memberPw");
String term_FL = request.getParameter("term_FL");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/livre/css/collectPreferenceFirstStyle.css">
<link rel="stylesheet" href="/livre/css/index.css" />
<link rel="stylesheet" href="/livre/css/header.css" />
<script>


//아이콘 선택시 보더 주기
function selectJenre(id) {
var imageToShowBorder = document.getElementById(id);
imageToShowBorder.classList.toggle('showBorder');
}

//이미지 선택 여부를 추적하기 위한 변수
var selectedImages = [];

function selectJenre(id) {
var imageToShowBorder = document.getElementById(id);
var index = selectedImages.indexOf(id);

if (index === -1) {
    // 선택되지 않은 경우
    selectedImages.push(id);
    imageToShowBorder.classList.add('showBorder');
} else {
    // 이미 선택된 경우 다시 클릭하면 선택 취소
    selectedImages.splice(index, 1);
    imageToShowBorder.classList.remove('showBorder');
}
}

//초기 진행 상태 설정
var progress = 0;

//진행 상태 갱신 함수
function updateProgress() {
var progressBar = document.getElementById('progress');
var progressText = document.getElementById('progressText');

// 진행도 업데이트
progressBar.style.width = progress + '%';
progressText.innerText = progress + '%';

// 다음 진행 상태로 이동
if (progress < 20) {
    progress++;
}
}

//10ms마다 진행 상태 업데이트
setInterval(updateProgress, 10);

function moveToNextPage() {
// 선택된 이미지 개수 확인
var selectedImageCount = document.querySelectorAll('.showBorder').length;

// 다음 페이지로 이동합니다.
window.location.href = "/livre/member/collectPreferenceSecond.jsp";
}

function skipPage() {
  window.location.href = "/livre/member/celebrate.jsp";
}


</script>


<title>선호장르1</title>
</head>
<body>
	<main>
		<header>
			<!-- 헤더 입니다 -->
			<div class="header">
				<img src="./../assets/logo.svg" class="h-logo">
				<p class="h-logo-name">livre</p>
			</div>

			<div class="header-right">
				<a href="#">로그인</a> <a href="#">회원가입</a>
			</div>
		</header>
	</main>

	<section>
		<!-- 진행도 창 -->
		<div id="progressBar">
			<div id="progress"></div>
			<div id="progressText">0%</div>
		</div>
		<br />

		<form name="logInForm" method="post" action="/livre/member/collectPreferenceSecond.jsp" >
			<div id="mainBoard">
				<div id="questionTitle">
					Q. 관심있는 분야를 알려줄래요? <br />
					<span id="chooseThree">원하는 만큼 선택 가능해요</span>
				</div>
				<br />
				<div id="firstLineDiv">

					<div id="economyDiv">
						<input type="checkbox" id="economyCheckbox" class="hiddenCheckbox"
							onclick="selectJenre('economy');" name="enrollDate"> <label
							for="economyCheckbox"><img id="economy"
							src="../assets/undraw_Finance_re_gnv2.png"></label>
						<div>경제</div>
					</div>

					<div id="healthDiv">
						<input type="checkbox" id="healthCheckbox" class="hiddenCheckbox"
							onclick="selectJenre('health');" name="enrollDate"> <label
							for="healthCheckbox"><img id="health"
							src="../assets/undraw_Personal_trainer_re_cnua.png"></label>
						<div>취미/건강</div>
					</div>

					<div id="childDiv">
						<input type="checkbox" id="childCheckbox" class="hiddenCheckbox"
							onclick="selectJenre('child');" name="enrollDate"> <label
							for="childCheckbox"><img id="child"
							src="../assets/undraw_Children_re_c37f.png"></label>
						<div>어린이</div>
					</div>
				</div>
				<br />
				<div id="secondLineDiv">
					<div id="historyDiv">
						<input type="checkbox" id="historyCheckbox" class="hiddenCheckbox"
							onclick="selectJenre('history');" name="enrollDate"> <label
							for="historyCheckbox"><img id="history"
							src="../assets/undraw_Image_focus_re_qqxc.png"></label>
						<div>역사</div>
					</div>


					<div id="travelDiv">
						<input type="checkbox" id="travelCheckbox" class="hiddenCheckbox"
							onclick="selectJenre('travel');" name="enrollDate"> <label
							for="travelCheckbox"><img id="travel"
							src="../assets/undraw_Travel_mode_re_2lxo.png"></label>
						<div>여행</div>
					</div>
					<div id="scienceDiv">
						<input type="checkbox" id="scienceCheckbox" class="hiddenCheckbox"
							onclick="selectJenre('science');" name="enrollDate"> <label
							for="scienceCheckbox"><img id="science"
							src="../assets/undraw_Scientist_ft0o.png"></label>
						<div>과학</div>
					</div>
				</div>
				<br />

				<div id="thirdLineDiv">
					<div id="cartoonDiv">
						<input type="checkbox" id="cartoonCheckbox" class="hiddenCheckbox"
							onclick="selectJenre('cartoon');" name="enrollDate"> <label
							for="cartoonCheckbox"><img id="cartoon"
							src="../assets/undraw_super_woman_dv0y.png"></label>
						<div>만화</div>
					</div>

					<div id="societyDiv">
						<input type="checkbox" id="societyCheckbox" class="hiddenCheckbox"
							onclick="selectJenre('society');" name="enrollDate"> <label
							for="societyCheckbox"><img id="society"
							src="../assets/undraw_Social_ideas_re_j5v4.png"></label>
						<div>사회</div>
					</div>

					<div id="novelDiv">
						<input type="checkbox" id="novelCheckbox" class="hiddenCheckbox"
							onclick="selectJenre('novel');" name="enrollDate"> <label
							for="novelCheckbox"><img id="novel"
							src="../assets/undraw_Bibliophile_re_xarc.png"></label>
						<div>소설/시/희곡</div>
					</div>
				</div>

				<div id="buttonDiv">
					<button type="submit" id="nextButton">다음</button>
				</div>
				<div id="skipDiv">
					<button type="submit" id="skipButton" onclick="skipPage()">건너뛰기</button>

				</div>

			</div>
			
			<input type="text" value="<%=memberEmail%>" name="memberEmail">
            <input type="text" value="<%=memberPw%>" name="memberPw">
            <input type="text" value="<%=term_FL%>" name="term_FL">
		</form>
	</section>


</body>


</html>