$(document).ready(function() {
    // 초기에 모든 invalid-feedback 요소를 숨깁니다.
    $('.invalid-feedback').hide();

    $('#submitButton').click(function() {
        // 이메일, 비밀번호, 비밀번호 확인 유효성 검사
        if (checkEmail() && checkPassword() && confirmPassword()) {
            // 유효한 경우 다음 페이지로 이동
            window.location.href = 'agreement.jsp'; // 이동할 페이지 경로를 적절히 수정하세요
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