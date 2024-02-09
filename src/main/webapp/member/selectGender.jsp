<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/Mylivre/css/selectGenderStyle.css">
<link rel="stylesheet" href="/Mylivre/css/index.css" />
<link rel="stylesheet" href="/Mylivre/css/header.css" />
<script src="/Mylivre/js/selectGenderScript.js"></script>

<title>성별선택</title>
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
					Q. 당신의 성별을 알려주세요 <br /> <br /> <br /> <br />
				</div>
				<br />
				<div id="firstLineDiv">
					<input type="radio" id="manRadio" name="gender" class="hiddenRadio"
						value="man"> <label for="manRadio"> <img
						id="manIcon"
						src="../assets/Man free icons designed by Freepik.jpg"
						onclick="selectGender('man');">
						<div id="manText">남자</div>
					</label> <input type="radio" id="womanRadio" name="gender"
						class="hiddenRadio" value="woman"> <label for="womanRadio">
						<img id="womanIcon"
						src="../assets/Mom free vector icons designed by Freepik.jpg"
						onclick="selectGender('woman');">
						<div id="womanText">여자</div>
					</label>
				</div>

				<div id="buttonDiv">
					<button type="button" id="preButton" onclick="goToPreviousPage()">이전</button>
					<button type="button" id="nextButton" onclick="moveToNextPage()">다음</button>
				</div>

			</div>


		</form>

	</section>


</body>

</html>