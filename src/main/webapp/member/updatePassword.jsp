<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common3.jsp"%>
<%
String term_FL = request.getParameter("term_FL");
%>
<%@ page import="com.livre.model.dao.MemberDao"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 변경</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="/livre/js/snsLogin.js"></script>

<link rel="stylesheet" type="text/css"
	href="/livre/css/updatePassword.css">
<link rel="stylesheet" href="/livre/css/index.css" />
<link rel="stylesheet" href="/livre/css/header.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<meta charset="UTF-8">
<title>Insert title here</title>
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
			<input type="hidden" name="command" value="collectPreference">
			<!-- 로그인 배너 -->
			<div class="container mt-3">
				<span id="banner"><b>비밀번호 변경</b></span><br /> <br /> <br /> <br />

				<!-- 비밀번호 기입란 -->
				<div class="mb-3">
					<label for="pwd" class="form-label" id="passwordbanner"></label> <input
						id="inputPassword" type="password" class="form-control"
						name="memberPw" placeholder="기존 비밀번호 입력" name="passwordParam">

					<div class="valid-feedback"></div>
					<hr width="450px">
					<div class="invalid-feedback" id="validPassword">* 비밀번호는 영문,
						숫자, 특수기호를 포함한 8자리 이상이여야 합니다.</div>
				</div>
				<!--  비밀번호 확인 기입란 -->
				<div class="mb-3">
					<label for="pwdCheck" class="form-label" id="passwordCheckbanner"></label>
					<input id="inputPasswordck" type="password" class="form-control"
						id="pwdck" placeholder="새로운 비밀번호 입력" required>
					<div class="valid-feedback"></div>
					<hr width="450px">
					<div class="invalid-feedback" id="validPassword">* 비밀번호는 영문,
						숫자, 특수기호를 포함한 8자리 이상이여야 합니다.</div>
				</div>

				<!--  비밀번호 확인 기입란 -->
				<div class="mb-3">
					<label for="pwdCheck" class="form-label" id="passwordCheckbanner"></label>
					<input id="inputPasswordck" type="password" class="form-control"
						id="pwdck" placeholder="새로운 비밀번호 확인" required>
					<div class="valid-feedback"></div>
					<hr width="450px">
					<div class="invalid-feedback" id="validPasswordck">* 비밀번호가
						일치하지 않습니다.</div>
				</div>
				</br> </br>
				<!-- 가입하기 버튼 -->
				<button id="submitButton" type="submit" class="btn btn-primary"
					onclick="return checkEmail();">변경하기</button>
				</br> </br> <input type="hidden" value="<%=term_FL%>" name="term_FL">
		</form>
		</div>
	</section>
</body>
</html>