<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common3.jsp"%>

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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<title>Insert title here</title>
</head>
<body>
	<main></main>
	<section>
		<form name="logInForm" method="post" action="<%=withFormTag%>">
			<input type="hidden" name="command" value="updatePassword">
			<!-- 로그인 배너 -->
			<div class="container mt-3">
				<span id="banner"><b>비밀번호 변경</b></span><br /> <br /> <br /> <br />

				<!-- 기존 비밀번호 입력 -->
				<div class="mb-3">
					<label for="currentPassword" class="form-label"></label> <input
						id="currentPassword" type="password" class="form-control"
						placeholder="기존 비밀번호 입력">

					<div class="valid-feedback"></div>
					<hr width="450px">
					<div class="invalid-feedback" id="validPassword"></div>
				</div>

				<!--  새로운 비밀번호 입력 -->
				<div class="mb-3" style="position: relative;">
                    <input id="newPassword"  name="newPassword" type="password" class="form-control" placeholder="비밀번호" required>
                    <div class="valid-feedback"></div>
                    <hr width="450px">
                    <span class="invalid-feedback" id="newPasswordInvalidFeedback">* 비밀번호는 영문, 숫자, 특수기호를 포함한 8자리 이상이여야 합니다.</span>
                </div>

				<!-- 새로운 비밀번호 확인 -->
				 <div class="mb-3" style="position: relative;">
                    <input id="inputPasswordck" type="password" class="form-control" placeholder="비밀번호 확인" required>
                    <div class="valid-feedback"></div>
                    <hr width="450px">
                    <span class="invalid-feedback" id="validPasswordck">* 비밀번호가 일치하지 않습니다.</span>
                </div>
				</br> </br>
				<!-- 가입하기 버튼 -->
				<button id="submitButton" type="submit" class="btn btn-primary">변경하기</button>
				<!-- onclick="return checkEmail();" 나중에 넣어 -->
				</br> </br>
			</div>
		</form>
		<script src="/livre/js/updatePassword.js"></script>
	</section>
</body>
</html>