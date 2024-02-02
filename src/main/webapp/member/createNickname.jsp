<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./../css/createNicknameStyle.css">
<link rel="stylesheet" href="./../css/index.css" />
<link rel="stylesheet" href="./../css/header.css" />
<script src="./../js/createNicknameScript.js"></script>


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
</html>