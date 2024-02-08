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
<style>
@charset "UTF-8";
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;


}
section {
	width: 100vw;
	height: 100vh;
	margin: 0;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

#mainBoard {
	display:flex;
	flex-direction:column;
	justify-content:center;
	text-align: center;
	width: 350px;
	height: 450px;
	background: #FFF4F4;
	padding: 30px;
	border-radius: 20px;
}

img {
	width: 120px;
	height:130px;
	border-radius: 20px;
}

img:hover {
	opacity: 0.7;
}

#nextButton:hover, #preButton:hover {
	background-color: #D17D7D;
}

#nextButton:active, #preButton:active {
	background-color: #E4C8C8;
}

#firstLineDiv{
	display: flex;
	flex-direction: row;
	justify-content: center;
	justify-content: space-between;
	font-size: 14px;
}

#manIcon.showBorder, #womanIcon.showBorder {
	border: 2px solid #C24B4B;
	margin: -2px;
}

#manText, #womenText{
	font-weight: 700;
	color: #742323;
}

#buttonDiv {
	display: flex;
	flex-direction: row;
	justify-content: center;
	justify-content: space-between;
	margin-top: 70px;
}

#preButton, #nextButton {
	align-items: center;
	border: none;
	border-radius: 10px;
	background: #C24B4B;
	width: 90px;
	height: 25px;
	font-size: 14px;
	font-weight: 700;
	color: white;
	font-weight: 700;
	transition: all ease-in-out 0.15s;
	cursor: pointer;
}

#preButton {
	justify-content: flex-start;
}

#nextButton {
	justify-content: flex-end;
}


#questionTitle {
	color: #742323;
	font-weight: 700;
	margin-bottom: 30px; 
}

#progressDiv {
	width: 300px;
	height: 30px;
	background-color: #f0f0f0;
	border-radius: 20px;
}

/* 프로그래스 바 스타일 */
#progressBar {
	width: 500px;
	height: 25px;
	background-color: #FFFFFF;
	border: 1px solid #E8D0D0;
	border-radius: 20px;
	position: relative;
	border-radius: 20px;
}

/* 프로그래스 바가 채워지는 부분의 스타일 */
#progress {
	width: 0%;
	height: 100%;
	background-color: #FFF4F4; /* 채워진 부분의 색상 */
	border-radius: 20px;
	transition: width 0.5s ease; /* 채워지는 애니메이션 */
}

/* 프로그래스 바 텍스트의 스타일 */
#progressText {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: black; /* 텍스트 색상 */
}


.hiddenCheckbox {
	display: none;
}
</style>

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
					Q. 당신의 성별을 알려주세요 <br /> <br /> <br/> <br/>
				</div>
				<br />
				<div id="firstLineDiv">

					<div id="manIconDiv" onclick=selectJenre('manIcon');>
						<a href="#"><img id="manIcon"
							src="../assets/Man free icons designed by Freepik.jpg"></a>
						<div id="manText">남자</div>
					</div>

					<div id="womanIconDiv" onclick=selectJenre('womanIcon');>
						<a href="#"><img id="womanIcon"
							src="../assets/Mom free vector icons designed by Freepik.jpg"></a>
						<div id="womenText">여자</div>
					</div>
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