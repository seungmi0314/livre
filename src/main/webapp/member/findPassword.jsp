<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 찾기</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="/livre/js/findPassword.js"></script>
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
		<form name="logInForm" method="post" action="<%=withFormTag%>">
			<input type="hidden" name="command" value="meInsert">

			<div class="container mt-3">
				<span id="banner"><b>비밀번호 찾기</b></span><br /> <br /> <br /> <br />
				

					<!-- 비밀번호 찾기 -->
					<div class="mb-3 mt-3">
						<label for="uname" class="form-label" id="emailbanner"></label> <input
							id="inputEmail" type="text" class="form-control"
							name="emailParam" placeholder="이메일 " required>
						<div class="valid-feedback"></div>
						<hr width="450px">
						<div class="invalid-feedback" id="validEmail">* 올바른 이메일을
							작성해주세요.</div>
					</div>

					</br> </br>
					<!-- 비밀번호 찾기 버튼 -->
					<button id="submitButton" type="button" class="btn btn-primary"
						onclick="return checkEmail();">인증코드 전송</button>
					</br> </br> 
					
					<!-- ============================================================== -->
					
					<input type="hidden" id="hiddenEmail" name="email"
						value="<%=(String) request.getAttribute("memberEmail")%>">
					<div class="findPwdClass1">
						<input type="text" id="findPwdAuth" placeholder="인증번호 입력"
							autocomplete="off">
						<button type="button" id="findPwdAuthButton">인증</button>
					</div>
					<span id="findPwdAuthId"></span>

					<div class="findPwdClass2">
						<input type="text" id="newPassword" name="pass"
							placeholder="새로운 패스워드를 입력하세요" autocomplete="off"> <input
							type="text" id="newPasswordCheck"
							placeholder="새로운 패스워드를 다시 입력하세요" autocomplete="off">
					</div>
					<button id="newPasswordButton">변경</button>

				</form>
			</div>
		
	</section>
</body>
</html>