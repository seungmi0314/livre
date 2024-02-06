<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./../css/reset.css" />
<link rel="stylesheet" href="./../css/login.css" />
<link rel="stylesheet" href="./../css/header.css" />
<script src="./../js/login.js"></script>

<title>로그인 페이지</title>

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
		<!-- 왼쪽 하얀배경 영역 -->
		<div class="left"></div>

		<!-- 오른쪽 분홍색 배경 영역 -->
		<div class="right">

			<!-- <div class="login-box"> -->
			<div class="login-logo">
				<img src="./../assets/logo.svg">
				<p class="livre">livre</p>
			</div>

			<form action="#" method="post" id="loginform">
				<fieldset>
					<legend class="skip">로그인 양식</legend>
					<ul>
						<li>
							<!--이메일 입력--> <span><input class="form-input" type="text"
								name="user_email" id="user_email" placeholder="이메일 입력"></span>
						</li>

						<li class="error email_error">이메일을 입력해주세요</li>

						<li>
							<!--비밀번호 입력--> <span><input class="form-input"
								type="password" name="user_pw" id="user_pw"
								placeholder="비밀번호 입력"></span> <sapn class="pw_show_hide"
								title="비밀번호 보이기(수정)"></sapn>
						</li>

						<li class="error pw_error">비밀번호를 입력해주세요</li>
					</ul>

					<div class="remember-me">
						<!--자동 로그인-->
						<p>
							<label> <input type="checkbox" name="remember-check"
								id="remember-check"> <span>자동로그인</span>
							</label>
						</p>
						<!--비밀번호를 잊으셨나요?-->
						<a href="#" class="forget_pw">비밀번호를 잊으셨나요?</a>
					</div>

					<!--로그인 버튼-->
					<button type="submit" id="login_btn">로그인</button>

				</fieldset>
			</form>

			<div class="sns">
				<p>sns계정으로 간편로그인 하세요</p>
				<div class="sns-login">
					<div class="kakao">
						<img src="./../assets/login-kakao.svg">
					</div>
					<div class="naver">
						<img src="./../assets/login-naver.svg">
					</div>
					<div class="google">
						<img src="./../assets/login-google.svg">
					</div>
				</div>
			</div>

			<p class="yet">
				아직도 회원이 아니신가요?<a class="join" href="#">회원가입</a>
			</p>
		</div>

	</section>
</body>
</html>