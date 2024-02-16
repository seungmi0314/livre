<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%
String term_FL = request.getParameter("term_FL");
%>
<%@ page import="com.livre.model.dao.MemberDao"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 페이지</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
$(document).ready(function() {
    // 초기에 모든 invalid-feedback 요소를 숨깁니다.
    $('.invalid-feedback').hide();

    // 이메일 입력란 값 변경 시 유효성 검사
    $('#inputEmail').on('keyup', function() {
        checkEmail();
    });

    // 비밀번호 입력란 값 변경 시 유효성 검사
    $('#inputPassword').on('keyup', function() {
        checkPassword();
    });

    // 비밀번호 확인 입력란 값 변경 시 유효성 검사
    $('#inputPasswordck').on('keyup', function() {
        confirmPassword();
    });

    $('#submitButton').click(function(event) {
        // 이벤트 기본 동작 중단
        //event.preventDefault();

        // 이메일, 비밀번호, 비밀번호 확인 유효성 검사
        var isEmailValid = checkEmail();
        var isPasswordValid = checkPassword();
        var isConfirmPasswordValid = confirmPassword();

        // 유효성 검사 결과 확인
        /* if (isEmailValid && isPasswordValid && isConfirmPasswordValid) {
            // 폼 제출
            $('form[name="logInForm"]').submit();
        } */
    });
});

function checkEmail() {
    var email = $('#inputEmail').val();           
        
    // 이메일 정규식 패턴
    var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    
    // 이메일 형식 및 길이 유효성 검사
    if (!emailPattern.test(email) || email.length < 4 || email.length > 30) {
        $('#validEmail').show(); // 이메일 형식이 올바르지 않을 경우 해당 요소를 보이게 합니다.
        $('#inputEmail').focus();
        return false;
    } else {
        $('#validEmail').hide(); // 이메일 형식이 올바르다면 해당 요소를 숨깁니다.
    }

    return true;
}

function checkPassword() {
    var password = $('#inputPassword').val();
    var passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;

    if (!passwordPattern.test(password)) {
        $('#validPassword').show(); // 비밀번호 형식이 올바르지 않을 경우 해당 요소를 보이게 합니다.
        $('#inputPassword').focus();
        return false;
    } else {
        $('#validPassword').hide(); // 비밀번호 형식이 올바르다면 해당 요소를 숨깁니다.
    }

    return true;
}

function confirmPassword() {
    var password = $('#inputPassword').val();
    var confirmPassword = $('#inputPasswordck').val();

    if (password !== confirmPassword) {
        $('#validPasswordck').text('비밀번호가 일치하지 않습니다. 다시 입력해주세요.').show();
        $('#inputPasswordck').focus();
        return false;
    } else {
        $('#validPasswordck').hide();
    }

    return true;
    
}

</script>
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