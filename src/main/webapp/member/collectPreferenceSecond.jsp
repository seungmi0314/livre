<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./../css/collectPreferenceSecondStyle.css">
<link rel="stylesheet" href="./../css/index.css" />
<link rel="stylesheet" href="./../css/header.css" />
<script src="./../js/collectPreferenceSecondScript.js"></script>
<title>선호장르2</title>


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
			Q. 관심있는 분야를 알려줄래요?
			<br/>
			<span id="chooseThree">3개까지 선택 가능해요</span>
			</div>
			<br />
			<div id="firstLineDiv">

				<div id="artDiv" onclick=selectJenre('art');>
					<a href="#"><img id="art"
						src="../assets/undraw_Making_art_re_ee8w.png"></a>
					<div>예술/대중문화</div>
				</div>

				<div id="cookingDiv" onclick=selectJenre('cooking');>
					<a href="#"><img id="cooking"
						src="../assets/undraw_Cooking_p7m1.png"></a>
					<div>요리</div>
				</div>

				<div id="humanitiesDiv" onclick=selectJenre('humanities');>
					<a href="#"><img id="humanities"
						src="../assets/undraw_Logic_re_nyb4.png"></a>
					<div>인문학</div>
				</div>
			</div>
			<br />

			<div id="secondLineDiv">
				<div id="selfdevDiv" onclick=selectJenre('selfdev');>
					<a href="#"><img id="selfdev"
						src="../assets/undraw_Reading_time_re_phf7.png"></a>
					<div>자기계발</div>
				</div>

				<div id="religionDiv" onclick=selectJenre('religion');>
					<a href="#"><img id="religion"
						src="../assets/undraw_Speed_test_re_pe1f.png"></a>
					<div>종교/역학</div>
				</div>

				<div id="teenagerDiv" onclick=selectJenre('teenager');>
					<a href="#"><img id="teenager"
						src="../assets/undraw_true_friends_c94g.png"></a>
					<div>청소년</div>
				</div>
			</div>
			<br />

			<div id="thirdLineDiv">
				<div id="mobileDiv" onclick=selectJenre('mobile');>
					<a href="#"><img id="mobile"
						src="../assets/undraw_android_jr64.png"></a>
					<div>컴퓨터/모바일</div>
				</div>

				<div id="gardeningDiv" onclick=selectJenre('gardening');>
					<a href="#"><img id="gardening"
						src="../assets/undraw_Gardening_re_e658.png"></a>
					<div>가정/원예/인테리어</div>
				</div>

				<div id="sportsDiv" onclick=selectJenre('sports');>
					<a href="#"><img id="sports"
						src="../assets/undraw_Basketball_re_7701.png"></a>
					<div>스포츠</div>
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