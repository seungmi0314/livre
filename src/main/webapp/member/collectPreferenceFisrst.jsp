<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="/livre/css/collectPreferenceFirstStyle.css">
<link rel="stylesheet" href="/livre/css/index.css" />
<link rel="stylesheet" href="/livre/css/header.css" />
<script src="/livre/js/collectPreferenceFirstScript.js"></script>


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
					<sapn id="chooseThree">원하는 만큼 선택 가능해요</sapn>
				</div>
				<br />
				<div id="firstLineDiv">

					<div id="economyDiv">
						<input type="checkbox" id="economyCheckbox" class="hiddenCheckbox"
							onclick="selectJenre('economy');"> <label
							for="economyCheckbox"><img id="economy"
							src="../assets/undraw_Finance_re_gnv2.png"></label>
						<div>경제</div>
					</div>

					<div id="healthDiv">
						<input type="checkbox" id="healthCheckbox" class="hiddenCheckbox"
							onclick="selectJenre('health');"> <label
							for="healthCheckbox"><img id="health"
							src="../assets/undraw_Personal_trainer_re_cnua.png"></label>
						<div>취미/건강</div>
					</div>

					<div id="childDiv">
						<input type="checkbox" id="childCheckbox" class="hiddenCheckbox"
							onclick="selectJenre('child');"> <label
							for="childCheckbox"><img id="child"
							src="../assets/undraw_Children_re_c37f.png"></label>
						<div>어린이</div>
					</div>
				</div>
				<br />
				<div id="secondLineDiv">
					<div id="historyDiv">
						<input type="checkbox" id="historyCheckbox" class="hiddenCheckbox"
							onclick="selectJenre('history');"> <label
							for="historyCheckbox"><img id="history"
							src="../assets/undraw_Image_focus_re_qqxc.png"></label>
						<div>역사</div>
					</div>


					<div id="travelDiv">
						<input type="checkbox" id="travelCheckbox" class="hiddenCheckbox"
							onclick="selectJenre('travel');"> <label
							for="travelCheckbox"><img id="travel"
							src="../assets/undraw_Travel_mode_re_2lxo.png"></label>
						<div>여행</div>
					</div>
					<div id="scienceDiv">
						<input type="checkbox" id="scienceCheckbox" class="hiddenCheckbox"
							onclick="selectJenre('science');"> <label
							for="scienceCheckbox"><img id="science"
							src="../assets/undraw_Scientist_ft0o.png"></label>
						<div>과학</div>
					</div>
				</div>
				<br/>
				
				<div id="thirdLineDiv">
					<div id="cartoonDiv">
						<input type="checkbox" id="cartoonCheckbox" class="hiddenCheckbox"
							onclick="selectJenre('cartoon');"> <label
							for="cartoonCheckbox"><img id="cartoon"
							src="../assets/undraw_super_woman_dv0y.png"></label>
						<div>만화</div>
					</div>

					<div id="societyDiv">
						<input type="checkbox" id="societyCheckbox" class="hiddenCheckbox"
							onclick="selectJenre('society');"> <label
							for="societyCheckbox"><img id="society"
							src="../assets/undraw_Social_ideas_re_j5v4.png"></label>
						<div>사회</div>
					</div>

					<div id="novelDiv">
						<input type="checkbox" id="novelCheckbox" class="hiddenCheckbox"
							onclick="selectJenre('novel');"> <label
							for="novelCheckbox"><img id="novel"
							src="../assets/undraw_Bibliophile_re_xarc.png"></label>
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