<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./../css/collectPreferenceFirstStyle.css">
<link rel="stylesheet" href="./../css/index.css" />
<link rel="stylesheet" href="./../css/header.css" />
<script src="./../js/collectPreferenceFirstScript.js"></script>

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

	<form className="checkForm">
		<div id="mainBoard">
			<div id="questionTitle">
				Q. 관심있는 분야를 알려줄래요? <br />
				<sapn id="chooseThree">3개까지 선택 가능해요</sapn>
			</div>
			<br />
			<div id="firstLineDiv">

				<div id="economyDiv" onclick=selectJenre('economy');>
					<a href="#"><img id="economy"
						src="../assets/undraw_Finance_re_gnv2.png"></a>
					<div>경제</div>
				</div>

				<div id="healthDiv" onclick=selectJenre('health');>
					<a href="#"><img id="health"
						src="../assets/undraw_Personal_trainer_re_cnua.png"></a>
					<div>건강/취미</div>
				</div>

				<div id="childDiv" onclick=selectJenre('child');>
					<a href="#"><img id="child"
						src="../assets/undraw_Children_re_c37f.png"></a>
					<div>어린이</div>
				</div>
			</div>
			<br />

			<div id="secondLineDiv">
				<div id="historyDiv" onclick=selectJenre('history');>
					<a href="#"><img id="history"
						src="../assets/undraw_Image_focus_re_qqxc.png"></a>
					<div>역사</div>
				</div>

				<div id="" travel"Div" onclick=selectJenre('travel');>
					<a href="#"><img id="travel"
						src="../assets/undraw_Travel_mode_re_2lxo.png"></a>
					<div>여행</div>
				</div>

				<div id="scienceDiv" onclick=selectJenre('science');>
					<a href="#"><img id="science"
						src="../assets/undraw_Scientist_ft0o.png"></a>
					<div>과학</div>
				</div>
			</div>
			<br />

			<div id="thirdLineDiv">
				<div id="cartoonDiv" onclick=selectJenre('cartoon');>
					<a href="#"><img id="cartoon"
						src="../assets/undraw_super_woman_dv0y.png"></a>
					<div>만화</div>
				</div>

				<div id="societyDiv" onclick=selectJenre('society');>
					<a href="#"><img id="society"
						src="../assets/undraw_Social_ideas_re_j5v4.png"></a>
					<div>사회</div>
				</div>

				<div id="novelDiv" onclick=selectJenre('novel');>
					<a href="#"><img id="novel"
						src="../assets/undraw_Bibliophile_re_xarc.png"></a>
					<div>소설/시/희곡</div>
				</div>
			</div>

			<div id="buttonDiv">

				<button type="button" id="nextButton" onclick="moveToNextPage()">다음</button>
			</div>

		</div>


	</form>
	</section>
	

</body>
</html>