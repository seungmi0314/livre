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
    
    $('#inputEmail').keyup(function(){
		/* id를 변경하는 경우, 다시 중복 체크를 유도하기 위하여 false로 변경해 주어야 합니다. */
		$('#isRegister').val('false'); 
	});

    $('#submitButton').click(function(event) {
        // 이벤트 기본 동작 중단
        //event.preventDefault();

        // 이메일, 비밀번호, 비밀번호 확인 유효성 검사
        var isEmailValid = checkEmail();
        var isPasswordValid = checkPassword();
        var isConfirmPasswordValid = confirmPassword();

        // 유효성 검사 결과 확인
         if (isEmailValid && isPasswordValid && isConfirmPasswordValid) {
            // 폼 제출
            $('form[name="logInForm"]').submit();
        } else {
            // 유효성 검사를 통과하지 못한 경우 회원가입 막기
            event.preventDefault();
        }
        
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


function emailCheck(){/* 이메일 중복 체크를 수행합니다. */
	var isRegister = $('#isRegister').val();
	console.log('isRegister='+isRegister);
	/* alert(isRegister); */
	var email = $('#inputEmail').val();
	if(email==''){
		alert('중복 체크를 위하여 email을 입력해 주셔야 합니다.');
		$('#inputEmail').focus(); 
		return ;
	}
	
	var url = '<%=notWithFormTag%>meEmailCheck&memberEmail=' + email ;
	window.open(url, 'emailCheck', 'width=640, height=340') ;
}

function validCheck(){/* form validation check */
	
	/* 회원 가입 체크용 변수가 true인지 체크합니다. */
	var isRegister = $('#isRegister').val();
	if(isRegister=='false'){
			alert('이메일 중복 체크가 필요합니다.');
			$('#inputEmail').focus(); /* $('#id').select(); */
			return false ;
		}
	
		var email = $('#inputEmail').val();  		
}

</script>
<link rel="stylesheet" type="text/css"
	href="/livre/css/joinMemberShipStyle.css">
<link rel="stylesheet" href="/livre/css/index.css" />
<link rel="stylesheet" href="/livre/css/header.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section>
		<form name="logInForm" method="post" action="<%=withFormTag%>">
			<input type="hidden" name="command" value="collectPreference">
			<!-- 로그인 배너 -->
			<div class="container mt-3">
				<span id="banner"><b>회원가입</b></span><br /> <span id="checkAccount">이미
					계정이 있나요?</span> &nbsp;<a href="" id="existingLogin">로그인</a> <br /> <br />
				<br />
				<!-- 이메일 기입란 -->
				<%-- 중복 체크를 했는지 판단하기 위한 부울 타입의 히든 양식으로 true 이면 회원 가입이 가능합니다.  --%>
					<input type="hidden" id="isRegister" name="isRegister" value="false">
					
				<div class="mb-3 mt-3">
					<label for="uname" class="form-label" id="emailbanner"></label> <input
						id="inputEmail" type="text" class="form-control"
						name="memberEmail" placeholder="이메일 ">
					<button type="button" class="btn btn-primary" onclick="emailCheck();" id="validButton">중복
						체크</button>
					<div class="valid-feedback"></div>
					<hr width="450px">
					<div class="invalid-feedback" id="validEmail">* 올바른 형식의 이메일을
						작성해주세요.</div>
				</div>
				<!-- 비밀번호 기입란 -->
				<div class="mb-3">
					<label for="pwd" class="form-label" id="passwordbanner"></label> <input
						id="inputPassword" type="password" class="form-control"
						name="memberPw" placeholder="비밀번호" name="passwordParam">

					<div class="valid-feedback"></div>
					<hr width="450px">
					<div class="invalid-feedback" id="validPassword">* 비밀번호는 영문,
						숫자, 특수기호를 포함한 8자리 이상이여야 합니다.</div>
				</div>
				<!--  비밀번호 확인 기입란 -->
				<div class="mb-3">
					<label for="pwdCheck" class="form-label" id="passwordCheckbanner"></label>
					<input id="inputPasswordck" type="password" class="form-control"
						id="pwdck" placeholder="비밀번호 확인" required>
					<div class="valid-feedback"></div>
					<hr width="450px">
					<div class="invalid-feedback" id="validPasswordck">* 비밀번호가
						일치하지 않습니다.</div>
				</div>
				<br> <br>
				<!-- 가입하기 버튼 -->
				<button id="submitButton" type="submit" class="btn btn-primary"
					onclick="return checkEmail();">가입하기</button>
				<br> <br>
				<!-- SNS로그인 -->
				<div class="flex-container">
					<div class="flex-item">
						<hr width="200px">
					</div>
					<div id="accounLine1" class="flex-item">
						<b>&nbsp;&nbsp;<span id="chooseAccount">다음으로 계정으로 가입하기</span>&nbsp;&nbsp;
						</b>
					</div>
					<div id="accounLine2" class="flex-item">
						<hr width="200px">
						<br>
					</div>
				</div>
				<!-- 카카오톡 로그인 -->
				<a href="https://www.kakaocorp.com/page/service/service/KakaoTalk"><img
					id="kakaoIcon" class="img-concert"
					src="/livre/assets/kakaoIcon.png" width="40px" height="40px" /></a> <br> <br>
				<!-- 환영문구 -->
				<span id="welcomeTitle"> <b> 어서오세요! <br> <br>
						책에 대한 당신만의 생각이 궁금해요. <br> <br> 리버(livrer)가 되어 우리에게 들려줄래요?
				</b>
				</span> <input type="hidden" value="<%=term_FL%>" name="term_FL">
		</form>
		</div>
	</section>
</body>
</html>