<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./../css/inputGoalStyle.css">
<link rel="stylesheet" href="./../css/index.css" />
<link rel="stylesheet" href="./../css/header.css" />
<script src="./../js/inputGoalScript.js"></script>


<title>목표권수 기입</title>
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
		<br />

		<form className="checkForm">
			<div id="mainBoard">
				<div id="questionTitle">
					Q. 목표를 정하면 동기부여가 되요. <br /> <span id="goalBooks"> 올해 책을 몇권
						읽어볼까요? </span>
				</div>
				<br />
				<div id="inputGoalDiv">
					<input type="number" min="1">
				</div>
				<span id="goalPromise"> 권 읽어볼게요. </span> <br /> <span
					id="goalAdvice"> 대한민국 성인 평균 한 해 독서량은 4.5권이라나봐요. <br /> 우리는 그
					이상을 해보는 건 어떨까요?
				</span> <br />
				<div>
					<img id="goalImage" src="../assets/undraw_Reading_list_re_bk72.png">
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