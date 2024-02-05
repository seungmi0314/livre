<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="./../js/joinMemberShipScript.js"></script>
<link rel="stylesheet" href="./../css/joinMemberShipStyle.css">
<link rel="stylesheet" href="./../css/index.css" />
<link rel="stylesheet" href="./../css/header.css" />

<meta charset="UTF-8">
<title>Insert title here</title>
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
	<form name="logInForm" method="post" action="agreement.jsp">
		<!-- 로그인 배너 -->
		<div class="container mt-3">
			<span id="banner"><b>회원가입</b></span><br /> <span id="checkAccount">이미
				계정이 있나요?</span> &nbsp;<a href="" id="existingLogin">로그인</a> <br /> <br />
			<br/>
			<form action="/action_page.php" class="was-validated">
				<!-- 이메일 기입란 -->
				<div class="mb-3 mt-3">
					<label for="uname" class="form-label" id="emailbanner"></label>
					<input id="inputEmail" type="text" class="form-control" name="email"
						placeholder="이메일 " required>
					<div class="valid-feedback"></div>
					<hr width="450px">
					<div class="invalid-feedback" id="validEmail">* 올바른 이메일을
						작성해주세요.</div>
				</div>
				<!-- 비밀번호 기입란 -->
				<div class="mb-3">
					<label for="pwd" class="form-label" id="passwordbanner"></label> <input
						id="inputPassword" type="password" class="form-control" id="pwd"
						placeholder="비밀번호" required>
					<div class="valid-feedback"></div>
					<hr width="450px">
					<div class="invalid-feedback" id="validPassword">* 비밀번호는 영문,
						숫자, 특수기호를 포함한 8자리 이상이여야 합니다.</div>
				</div>
				<!--  비밀번호 확인 기입란 -->
				<div class="mb-3">
					<label for="pwdCheck" class="form-label" id="passwordCheckbanner"></label>
					<input id="inputPasswordck" type="password" class="form-control"
						id="pwdck" placeholder="비밀번호 확인" required>
					<div class="valid-feedback"></div>
					<hr width="450px">
					<div class="invalid-feedback" id="validPasswordck">* 비밀번호가
						일치하지 않습니다.</div>
				</div>
				</br> </br>
				<!-- 가입하기 버튼 -->
				<button id="submitButton" type="button" class="btn btn-primary" onclick="return checkEmail();">가입하기</button>
				</br> </br>
				</form>
				<!-- SNS로그인 -->
				<div class="flex-container">
					<div class="flex-item">
						<hr width="200px">
					</div>
					<div id="accounLine1" class="flex-item">
						<b>&nbsp;&nbsp;<span id="chooseAccount">다음으로 계정으로 가입하기</span>&nbsp;&nbsp;
						</b>
					</div>
					<div id="accounLine2" class="flex-item">
						<hr width="200px" height="30px">
						</br>
					</div>
				</div>
				<!-- 카카오톡 로그인 -->
				<a href="https://www.kakaocorp.com/page/service/service/KakaoTalk"><img
					id="kakaoIcon" class="img-concert" src="./../assets/kakaoIcon.png"
					width="40px" height="40px" /></a> </br> </br>
				<!-- 환영문구 -->
				<span id="welcomeTitle"> <b>어서오세요! </br>
					</br> 책에 대한 당신만의 생각이 궁금해요. </br>
					</br> 리버(livrer)가 되어 우리에게 들려줄래요?
				</b>
				</span>
			</form>
		</div>
	</section>
</body>
</html>