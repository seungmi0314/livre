$(document).ready(function() {
	// 초기에 모든 invalid-feedback 요소를 숨깁니다.
	$('.invalid-feedback').hide();

	// 폼 제출 이벤트 핸들러 추가
	$('#loginform').on('submit', function(e) {
		return validCheck(); // 유효성 검사를 수행하고 결과에 따라 폼 제출을 결정
	});
});

function validCheck() {
	// 이메일과 비밀번호 유효성 검사 실행
	var isEmailValid = checkEmail();
	var isPasswordValid = checkPassword();

	// 두 검사 모두 통과해야 폼 제출
	if (isEmailValid && isPasswordValid) {
		return true; // 폼 제출 허용
	} else {
		return false; // 폼 제출 방지
	}
}

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

$('.password i').on('click', function() {
	$('input').toggleClass('active');
	if ($('input').hasClass('active')) {
		$(this).attr('class', "fa fa-eye fa-lg")
			.prev('input').attr('type', "text");
	} else {
		$(this).attr('class', "fa fa-eye-slash fa-lg")
			.prev('input').attr('type', 'password');
	}
});
;



