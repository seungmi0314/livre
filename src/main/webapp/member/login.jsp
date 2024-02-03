<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./../css/login.css?after" />
<link rel="stylesheet" href="./../css/header.css" />
<!-- <link rel="stylesheet" href="./../css/menu.css" /> -->
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

			<div class="login-box">

				<div class="login-logo">
					<img src="./../assets/logo.svg">
					<p class="livre">livre</p>
				</div>

				<form>
					<!--이메일 입력-->
					<input class="form-input" type="email" id="email"
						placeholder="이메일 입력"><br />

					<!--비밀번호 입력-->
					<input class="form-input" type="password" id="password"
						placeholder="비밀번호 입력">


					<div class="remember-reset">
						<!--자동 로그인-->
						<label><input type="checkbox" id="remember-check">자동로그인</label>

						<!--비밀번호를 잊으셨나요?-->
						<a>
							<p>비밀번호를 잊으셨나요?</p>
						</a>
					</div>

					<!--로그인 버튼-->
					<button type="submit">로그인</button>
				</form>

			</div>

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
				아직도 회원이 아니신가요?<a>회원가입</a>
			</p>
		</div>

	</section>
</body>
</html>