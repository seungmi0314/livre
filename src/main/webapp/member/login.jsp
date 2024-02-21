<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ include file="../common/common.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/livre/css/reset.css" />
<link rel="stylesheet" href="/livre/css/login.css" />
<link rel="stylesheet" href="/livre/css/header.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="/livre/js/snsLogin.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<title>로그인 페이지</title>

<style>
.carousel-inner {
	margin-top: 250px;
}

.carousel-caption {
	color: black;
	padding: 10px
}
</style>

</head>

<body>
	<main></main>

	<section>
		<!-- 왼쪽 하얀배경 영역 -->
		<div class="left">

			<div id="carouselExampleCaptions" class="carousel slide"
				data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active" data-bs-interval="2500">
						<img src="/livre/assets/loginImage01.svg" class="d-block w-100"
							alt="..." style="width: 800px; height: 472px">

						<div class="carousel-caption">
							<h5>지금의 감동, 나누면 배가 될거에요.</h5>
						</div>
					</div>
					<div class="carousel-item" data-bs-interval="2500">
						<img src="/livre/assets/loginImage02.svg" class="d-block w-100"
							alt="..." style="width: 470px; height: 415px">
						<div class="carousel-caption">
							<h5>캘린더로 나만의 독서 정보를 한눈에 정리할 수 있어요.</h5>
						</div>
					</div>
					<div class="carousel-item" data-bs-interval="2500">
						<img src="/livre/assets/loginImage03.svg" class="d-block w-100"
							alt="..." style="width: 800px; height: 520px">
						<div class="carousel-caption">
							<h5>마음에 드는 감상문을 모아보세요.</h5>
						</div>
					</div>
				</div>
			</div>

		</div>

		<!-- 오른쪽 분홍색 배경 영역 -->
		<div class="right">
			<div class="right2">
				<!-- <div class="login-box"> -->
				<div class="login-logo">
					<img src="/livre/assets/logo.svg">
					<p class="livre">livre</p>
				</div>

				<!-- 쿠키값으로 email정보 받아오기 -->
				<%
				String chek = null;
				String memberEmail = "";
				Cookie[] cookie = request.getCookies(); // 쿠키 생성
				if (cookie != null) {
					for (int i = 0; i < cookie.length; i++) {
						if (cookie[i].getName().equals("checkbox")) { // 내가 원하는 쿠키명 찾아서 값 저장
					chek = "checked";
					memberEmail = cookie[i].getValue();
					System.out.println(memberEmail);
						}
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
									name="memberEmail" id="inputEmail" placeholder="이메일 입력"
									value="<%=memberEmail%>"></span>
							</li>

							<li class="invalid-feedback" id="validEmail">* 올바른 형식의 이메일을
								작성해주세요.</li>

							<li>
								<!--비밀번호 입력--> <span class="password"> <input
									class="form-input" type="password" name="memberPw"
									id="inputPassword" placeholder="비밀번호 입력" value=""> <i
									class="fa fa-eye-slash fa-lg"></i>
							</span>
							</li>

							<li class="invalid-feedback" id="validPassword">* 비밀번호는 영문,
								숫자, 특수기호를 포함한 8자리 이상이여야 합니다.</li>
						</ul>

						<div class="remember-me">
							<!--이메일 기억하기-->
							<p>
								<label> <input type="checkbox" name="checkbox"
									id="checkbox" value="chk" <%=chek%>> <span>이메일
										저장</span>
								</label>
							</p>
							<!--비밀번호를 잊으셨나요?-->
							<a href="/livre/member/findPassword.jsp" class="forget_pw">비밀번호를
								잊으셨나요?</a>
						</div>

						<!--로그인 버튼-->
						<button class="submit" id="login_btn"
							onclick="return validCheck();">로그인</button>

					</fieldset>
				</form>

				<div class="sns">
					<p>sns계정으로 간편로그인 하세요</p>
					<div class="sns-login">
						<form id="kakaoLoginForm" method="POST"
							action="/livre/member/kakaoLogin" value="카카오톡 간편로그인">
							<div class="kakao" onclick="kakaoLogin()">
								<img src="/livre/assets/login-kakao.svg">
							</div>
						</form>
						<form id="naverLoginForm" method="POST"
							action="/livre/member/naverLogin" value="네이버 간편로그인">
							<div class="naver" onclick="naverLogin()">
								<img src="/livre/assets/login-naver.svg">
							</div>
						</form>
						<form id="googleLoginForm" method="POST"
							action="/livre/member/googleLogin" value="구글 간편로그인">
							<div class="google" onclick="googleLogin()">
								<img src="/livre/assets/login-google.svg">
							</div>
						</form>
					</div>
				</div>

				<p class="yet">
					아직도 회원이 아니신가요?<a class="join" href="/livre/member/agreement.jsp">회원가입</a>
				</p>
			</div>
		</div>
		<script src="/livre/js/login.js"></script>
	</section>
</body>
</html>