<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%
//한글 깨짐 방지
request.setCharacterEncoding("UTF-8");
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
	function submitForm() {
		// 선택된 체크박스 값을 저장할 배열
		var selectedGenres = [];

		// 모든 체크박스 요소 가져오기
		var checkboxes = document.querySelectorAll('input[type="checkbox"]');

		// 각 체크박스의 상태 확인
		checkboxes.forEach(function(checkbox) {
			if (checkbox.checked) {
				selectedGenres.push(checkbox.value); // 체크된 경우 배열에 추가
			}
		});

		// 선택된 체크박스 값을 감추기 위해 숨겨진 input 요소에 설정
		document.getElementById('selectedGenresInput').value = selectedGenres
				.join(',');

		// 폼 제출
		document.getElementById('logInForm').submit();
	}

	//아이콘 선택시 보더 주기
	function selectGenre(id) {
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
		if (progress < 25) {
			progress++;
		}
	}

	//10ms마다 진행 상태 업데이트
	setInterval(updateProgress, 10);

	function moveToNextPage() {
		// 선택된 이미지 개수 확인
		var selectedImageCount = document.querySelectorAll('.showBorder').length;

		// 다음 페이지로 이동합니다.
		window.location.href = "/livre/member/selectGender.jsp";
	}

	
    // 폼을 서브밋하는 함수
    function submitForm(command) {
        document.logInForm.action = "<%=withFormTag%>?command=" + command;
        document.logInForm.submit();
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

		<form name="logInForm" method="post"
			action="<%=withFormTag%>">
			<input type="hidden" name="command"
				value="selectGender">
			<input type="hidden" name="command"
				value="celebrate">
			<div id="mainBoard">
				<div id="questionTitle">
					Q. 관심있는 분야를 알려줄래요? <br /> <span id="chooseThree">원하는 만큼 선택
						가능해요</span>
				</div>
				<br />
				<div id="firstLineDiv">

					<div id="economyDiv">
						<input type="checkbox" id="economyCheckbox" class="hiddenCheckbox"
							onclick="selectJenre('economy');" name="genreNo" value="1">
						<label for="economyCheckbox"><img id="economy"
							src="/livre/assets/undraw_Finance_re_gnv2.png"></label>
						<div>경제</div>
					</div>
					<div id="healthDiv">
						<input type="checkbox" id="healthCheckbox" class="hiddenCheckbox"
							onclick="selectJenre('health');" name="genreNo" value="2">
						<label for="healthCheckbox"><img id="health"
							src="/livre/assets/undraw_Personal_trainer_re_cnua.png"></label>
						<div>취미/건강</div>
					</div>
					<div id="childDiv">
						<input type="checkbox" id="childCheckbox" class="hiddenCheckbox"
							onclick="selectJenre('child');" name="genreNo" value="3">
						<label for="childCheckbox"><img id="child"
							src="/livre/assets/undraw_Children_re_c37f.png"></label>
						<div>어린이</div>
					</div>
					<div id="artDiv">
						<input type="checkbox" id="artCheckbox" class="hiddenCheckbox"
							onclick="selectJenre('art');" name="genreNo" value="10">
						<label for="artCheckbox"><img id="art"
							src="/livre/assets/undraw_Making_art_re_ee8w.png"></label>
						<div>예술/대중문화</div>
					</div>
					<div id="cookingDiv">
						<input type="checkbox" id="cookingCheckbox" class="hiddenCheckbox"
							onclick="selectJenre('cooking');" name="genreNo" value="11">
						<label for="cookingCheckbox"><img id="cooking"
							src="/livre/assets/undraw_Cooking_p7m1.png"></label>
						<div>요리</div>
					</div>
					<div id="humanitiesDiv">
						<input type="checkbox" id="humanitiesCheckbox"
							class="hiddenCheckbox" onclick="selectJenre('humanities');"
							name="genreNo" value="12"> <label
							for="humanitiesCheckbox"><img id="humanities"
							src="/livre/assets/undraw_Logic_re_nyb4.png"></label>
						<div>인문학</div>
					</div>
				</div>
				<br />
				<div id="secondLineDiv">
					<div id="historyDiv">
						<input type="checkbox" id="historyCheckbox" class="hiddenCheckbox"
							onclick="selectJenre('history');" name="genreNo" value="4">
						<label for="historyCheckbox"><img id="history"
							src="/livre/assets/undraw_Image_focus_re_qqxc.png"></label>
						<div>역사</div>
					</div>
					<div id="travelDiv">
						<input type="checkbox" id="travelCheckbox" class="hiddenCheckbox"
							onclick="selectJenre('travel');" name="genreNo" value="5">
						<label for="travelCheckbox"><img id="travel"
							src="/livre/assets/undraw_Travel_mode_re_2lxo.png"></label>
						<div>여행</div>
					</div>
					<div id="scienceDiv">
						<input type="checkbox" id="scienceCheckbox" class="hiddenCheckbox"
							onclick="selectJenre('science');" name="genreNo" value="6">
						<label for="scienceCheckbox"><img id="science"
							src="/livre/assets/undraw_Scientist_ft0o.png"></label>
						<div>과학</div>
					</div>
					<div id="selfdevDiv">
						<input type="checkbox" id="selfdevCheckbox" class="hiddenCheckbox"
							onclick="selectJenre('selfdev');" name="genreNo" value="13">
						<label for="selfdevCheckbox"><img id="selfdev"
							src="/livre/assets/undraw_Reading_time_re_phf7.png"></label>
						<div>자기계발</div>
					</div>
					<div id="religionDiv">
						<input type="checkbox" id="religionCheckbox"
							class="hiddenCheckbox" onclick="selectJenre('religion');"
							name="genreNo" value="14"> <label for="religionCheckbox"><img
							id="religion" src="/livre/assets/undraw_Speed_test_re_pe1f.png"></label>
						<div>종교/역학</div>
					</div>
					<div id="teenagerDiv">
						<input type="checkbox" id="teenagerCheckbox"
							class="hiddenCheckbox" onclick="selectJenre('teenager');"
							name="genreNo" value="15"> <label for="teenagerCheckbox"><img
							id="teenager" src="/livre/assets/undraw_true_friends_c94g.png"></label>
						<div>청소년</div>
					</div>
				</div>
				<br />
				<div id="thirdLineDiv">
					<div id="cartoonDiv">
						<input type="checkbox" id="cartoonCheckbox" class="hiddenCheckbox"
							onclick="selectJenre('cartoon');" name="genreNo" value="7">
						<label for="cartoonCheckbox"><img id="cartoon"
							src="/livre/assets/undraw_super_woman_dv0y.png"></label>
						<div>만화</div>
					</div>
					<div id="societyDiv">
						<input type="checkbox" id="societyCheckbox" class="hiddenCheckbox"
							onclick="selectJenre('society');" name="genreNo" value="8">
						<label for="societyCheckbox"><img id="society"
							src="/livre/assets/undraw_Social_ideas_re_j5v4.png"></label>
						<div>사회</div>
					</div>
					<div id="novelDiv">
						<input type="checkbox" id="novelCheckbox" class="hiddenCheckbox"
							onclick="selectJenre('novel');" name="genreNo" value="9">
						<label for="novelCheckbox"><img id="novel"
							src="/livre/assets/undraw_Bibliophile_re_xarc.png"></label>
						<div>소설/시</div>
					</div>
					<div id="mobileDiv">
						<input type="checkbox" id="mobileCheckbox" class="hiddenCheckbox"
							onclick="selectJenre('mobile');" name="genreNo" value="16">
						<label for="mobileCheckbox"><img id="mobile"
							src="/livre/assets/undraw_android_jr64.png"></label>
						<div>컴퓨터/모바일</div>
					</div>
					<div id="gardeningDiv">
						<input type="checkbox" id="gardeningCheckbox"
							class="hiddenCheckbox" onclick="selectJenre('gardening');"
							name="genreNo" value="17"> <label for="gardeningCheckbox"><img
							id="gardening" src="/livre/assets/undraw_Gardening_re_e658.png"></label>
						<div>가정/원예</div>
					</div>
					<div id="sportsDiv">
						<input type="checkbox" id="sportsCheckbox" class="hiddenCheckbox"
							onclick="selectJenre('sports');" name="genreNo" value="18">
						<label for="sportsCheckbox"><img id="sports"
							src="/livre/assets/undraw_Basketball_re_7701.png"></label>
						<div>스포츠</div>
					</div>
				</div>

				<div id="buttonDiv">
					<button type="submit" id="nextButton" onclick="submitForm('selectGender')">다음</button>
				</div>
				<div id="skipDiv">
					<button type="submit" id="skipButton" onclick="submitForm('celebrate')">건너뛰기</button>

				</div>

			</div>


			<input type="text" value="<%=memberEmail%>" name="memberEmail">
			<input type="text" value="<%=memberPw%>" name="memberPw"> <input
				type="text" value="<%=term_FL%>" name="term_FL">

		</form>
	</section>


</body>


</html>