<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/Mylivre/css/createNicknameStyle.css">
<script src="/Mylivre/js/createNicknameScript.js"></script>
<link rel="stylesheet" href="/Mylivre/css/index.css" />
<link rel="stylesheet" href="/Mylivre/css/header.css" />



<title>닉네임 기입</title>
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
<div id="progressBar">
		<div id="progress"></div>
		<div id="progressText">0%</div>
	</div>
	<br/>

	<form className="checkForm">
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
			<input type="text" placeholder="멋진 이름을 지어주세요!">
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
			<img id="nicknameImage" src="../assets/undraw_travel_together_re_kjf2.png">
			</div>
			</div>

			<div id="buttonDiv">
				<button type="button" id="preButton" onclick="goToPreviousPage()">이전</button>
				<button type="button" id="nextButton" onclick="moveToNextPage()">다음</button>
			</div>
	</form>
</section>


</body>
<script>
//랜덤 닉네임 설정
var nicknames = ["21세기 윤동주", "현명한 백석", "책읽는 셰익스피어", "지혜로운 트루먼", "문학소년 소크라테스"];

window.onload = function() {
    var randomIndex = Math.floor(Math.random() * nicknames.length);
    var randomNickname = nicknames[randomIndex];
    var nicknameInput = document.querySelector('input[type="text"]');
    nicknameInput.value = randomNickname;
};

// 이미지 선택 시 보더 주기
function selectJenre(id) {
    var imageToShowBorder = document.getElementById(id);
    imageToShowBorder.classList.toggle('showBorder');
}

// 이미지 선택 여부를 추적하기 위한 변수
var selectedImages = [];

function trackSelectedImages(id) {
    var imageToShowBorder = document.getElementById(id);
    var index = selectedImages.indexOf(id);

    if (index === -1) {
        if (selectedImages.length < 1) {
            selectedImages.push(id);
            imageToShowBorder.classList.add('showBorder');
        }
    } else {
        selectedImages.splice(index, 1);
        imageToShowBorder.classList.remove('showBorder');
    }
}



// 다음 페이지로 이동
function moveToNextPage() {
    var inputNickname = document.querySelector('input[type="text"]').value;

    if (inputNickname.trim().length < 2) {
        alert("두 자리 이상의 멋진 별명을 지어주세요.");
        return;
    }

    window.location.href = "/Mylivre/member/finalCheck.jsp";
}

// 이전 페이지로 이동
function goToPreviousPage() {
    history.back();
}
</script>
</html>