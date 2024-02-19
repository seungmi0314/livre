<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 변경</title>


<link rel="stylesheet" type="text/css"
	href="/livre/css/updatePassword.css">
<link rel="stylesheet" href="/livre/css/index.css" />
<link rel="stylesheet" href="/livre/css/header.css" />


<meta charset="UTF-8">
</head>

<body>
	<main>
		<header>
			<!-- 헤더 입니다 -->
			<div class="header">
				<img src="/livre/assets/logo.svg" class="h-logo">
				<p class="h-logo-name">livre</p>
			</div>

			<div class="header-right">
				<a href="#">로그인</a> <a href="#">회원가입</a>
			</div>
		</header>
	</main>

	<section>

		<form name="findPasswordForm" method="post" action="<%=withFormTag%>">
			<input type="hidden" name="command" value="tempPassword"> <span
				id="banner"><b>임시 비밀번호 입력</b></span><br /> <br /> <br /> <br />


			<!-- 인증코드 입력 -->
			<div class="findPwdClass1">
				<input type="text" id="findPwdAuth" name="findPwdAuth"
					placeholder="임시 비밀번호 입력" autocomplete="off">
				<button type="submit" id="findPwdAuthButton" onclick="return checkAuthentication();">확인</button>
			</div>
			<span id="findPwdAuthId"></span>
		</form>


		<!-- 비밀번호 변경 -->
		<!-- <div class="findPwdClass2">
			<input type="text" id="newPassword" name="pass"
				placeholder="새로운 패스워드 입력" autocomplete="off"> <input
				type="text" id="newPasswordCheck" placeholder="새로운 패스워드 확인"
				autocomplete="off">
		</div>
		<button id="newPasswordButton">변경</button>
  -->
<!-- <script src="/livre/js/tempPassword.js"></script> -->
	</section>


</body>


</html>