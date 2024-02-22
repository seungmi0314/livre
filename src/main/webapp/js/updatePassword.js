$(document).ready(function() {
	// 비밀번호 입력란 값 변경 시 유효성 검사
	$('#newPassword').on('keyup', function() {
		checkPassword();
		// 비밀번호 확인 입력란에 값이 있을 때만 비밀번호 일치 검사 실행
		if ($('#inputPasswordck').val().length > 0) {
			confirmPassword();
		}
	});

	// 비밀번호 확인 입력란 값 변경 시 유효성 검사
	$('#inputPasswordck').on('keyup', function() {
		confirmPassword();
	});

	// 폼 제출 버튼 클릭 시 처리
	$('form[name="logInForm"]').on('submit', function(event) {
		var isPasswordValid = checkPassword();
		var isConfirmPasswordValid = confirmPassword();

		// 유효성 검사가 실패하면 폼 제출 방지
		if (!isPasswordValid || !isConfirmPasswordValid) {
			event.preventDefault();
			// 여기서 사용자에게 유효성 검사 실패를 알릴 수 있습니다.
			alert("비밀번호 유효성 검사에 실패했습니다. 다시 확인해주세요.");
		}
	});
});

function checkPassword() {
	var password = $('#newPassword').val();
	var passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;

	if (!passwordPattern.test(password)) {
		$('#newPasswordInvalidFeedback').show();
		return false;
	} else {
		$('#newPasswordInvalidFeedback').hide();
		return true;
	}
}

function confirmPassword() {
	var password = $('#newPassword').val();
	var confirmPassword = $('#inputPasswordck').val();

	if (password !== confirmPassword) {
		$('#validPasswordck').show();
		return false;
	} else {
		$('#validPasswordck').hide();
		return true;
	}
}
