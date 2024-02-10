<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ include file="../common/common.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/livre/css/reset.css" />
<link rel="stylesheet" href="/livre/css/login.css" />
<link rel="stylesheet" href="/livre/css/header.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="/livre/js/login.js"></script>

<title>로그인 페이지</title>

</head>

<body>
	<main></main>

	<section>
		<!-- 왼쪽 하얀배경 영역 -->
		<div class="left"></div>

		<!-- 오른쪽 분홍색 배경 영역 -->
		<div class="right">

			<!-- <div class="login-box"> -->
			<div class="login-logo">
				<img src="/livre/assets/logo.svg">
				<p class="livre">livre</p>
			</div>

			<!-- 쿠키값으로 email정보 받아오기 -->
			<%
			String cookie = "";
			Cookie[] cookies = request.getCookies(); //쿠키생성
			if (cookies != null && cookies.length > 0)
				for (int i = 0; i < cookies.length; i++) {
					if (cookies[i].getName().equals("memberEmail")) { // 내가 원하는 쿠키명 찾아서 값 저장
				cookie = cookies[i].getValue();
					}
				}
			%>

			<form action="<%=withFormTag%>" method="post" id="loginform">
				<input type="hidden" name="command" value="login">
				<fieldset>
					<legend class="skip">로그인 양식</legend>
					<ul>
						<li>
							<!--이메일 입력--> <span><input class="form-input" type="text"
								name="memberEmail" id="memberEmail" placeholder="이메일 입력"
								value="<%=cookie%>"></span>
						</li>

						<li class="error email_error">이메일을 입력해주세요</li>

						<li>
							<!--비밀번호 입력--> <span class="password"> <input
								class="form-input" type="password" name="memberPw" id="memberPw"
								placeholder="비밀번호 입력" value=""> <i
								class="fa fa-eye-slash fa-lg"></i>
						</span>
						</li>

						<li class="error pw_error">비밀번호를 입력해주세요</li>
					</ul>

					<div class="remember-me">
						<!--이메일 기억하기-->
						<p>
							<label> <input type="checkbox" name="checkbox"
								id="checkbox" value="<%=cookie%>"> <span>이메일 저장</span>
							</label>
						</p>
						<!--비밀번호를 잊으셨나요?-->
						<a href="#" class="forget_pw">비밀번호를 잊으셨나요?</a>
					</div>

					<!--로그인 버튼-->
					<button type="submit" id="login_btn" onclick="return validCheck();">로그인</button>

				</fieldset>
			</form>

			<div class="sns">
				<p>sns계정으로 간편로그인 하세요</p>
				<div class="sns-login">
					<div class="kakao">
						<img src="/livre/assets/login-kakao.svg">
					</div>
					<div class="naver">
						<img src="/livre/assets/login-naver.svg">
					</div>
					<div class="google">
						<img src="/livre/assets/login-google.svg">
					</div>
				</div>
			</div>

			<p class="yet">
				아직도 회원이 아니신가요?<a class="join"
					href="/livre/member/joinMemberShip.jsp">회원가입</a>
			</p>
		</div>

	</section>
</body>
</html>