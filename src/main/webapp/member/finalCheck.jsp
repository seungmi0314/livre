<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/Mylivre/css/finalCheckStyle.css">
<link rel="stylesheet" href="/Mylivre/css/index.css" />
<link rel="stylesheet" href="/Mylivre/css/header.css" />
<script src="/Mylivre/js/finalCheckScript.js"></script>


<title>최종 완료</title>
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
				<div>
					<img id="finishImage"
						src="../assets/undraw_lightbulb_moment_re_ulyo.png">
				</div>
				<div id="finishTitle">
					<br /> <br /> <br /> 당신에 대해 잘 알았어요! <br /> <br /> 이제 리버로써 활동하러
					가봐요!
				</div>
				<br /> <br /> <br />
			</div>

			<div id="buttonDiv">
				<button type="button" id="preButton" onclick="goToPreviousPage()">잠시만요.</button>
				<button type="button" id="nextButton" onclick="moveToNextPage()">좋아요!</button>
			</div>
		</form>
	</section>


</body>
</html>