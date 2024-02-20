<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 찾기</title>

<link rel="stylesheet" type="text/css"
	href="/livre/css/findPassword.css">
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
			<input type="hidden" name="command" value="findPassword">

			<div class="container mt-3">
				<span id="banner"><b>비밀번호 찾기</b></span><br /> <br /> <br /> <br />


				<!-- 비밀번호 찾기 -->
				<div class="mb-3 mt-3">
					<label for="memberEmail" class="form-label" id="emailbanner"></label>
					<input id="memberEmail" type="text" class="form-control"
						name="memberEmail" placeholder="이메일 " required>
					<hr width="450px">
					<div class="valid-feedback"></div>
					<div class="invalid-feedback" id="validEmail">* 임시 비밀번호 발급을
						위해 이메일을 작성해주세요.</div>
				</div>

				</br> </br>
				<!-- 비밀번호 찾기 버튼 -->
				<button id="submitButton" type="submit" class="btn btn-primary"
					onclick="return checkEmail();">임시 비밀번호 전송</button>
				</br> </br>

				<!-- ============================================================== -->

			</div>
		</form>
		<script src="/livre/js/findPassword.js"></script>
	</section>
</body>
</html>