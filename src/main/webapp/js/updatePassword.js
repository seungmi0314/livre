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

    $('#submitButton').click(function(event) {
        var isPasswordValid = checkPassword();
        var isConfirmPasswordValid = confirmPassword();

        if (!isPasswordValid || !isConfirmPasswordValid) {
            event.preventDefault();
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
