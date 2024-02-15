$(document).ready(function() {
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
});

/*
$(document).ready(function() {
});

function validCheck() {  form validation check 
	var memberEmail = $('#memberEmail').val();

	// 이메일 정규식 패턴
	var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

	if (!emailPattern.test(memberEmail) || memberEmail.length < 4 || memberEmail.length > 30) {
		$('#validEmail').show(); // 이메일 형식이 올바르지 않을 경우 해당 요소를 보이게 합니다.
		$('#inputEmail').focus();
		return false;
	} else {
		$('#validEmail').hide(); // 이메일 형식이 올바르다면 해당 요소를 숨깁니다.
	}

	var memberPw = $('#memberPw').val();
	if (memberPw.length < 5 || memberPw.length > 12) {
		alert('비밀 번호는 5자리 이상 12자리 이하로 입력해 주세요.');
		$('#memberPw').focus();
		return false;
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
}*/