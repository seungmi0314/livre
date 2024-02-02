// 가입하기 버튼 클릭 이벤트 처리
document.getElementById('submitButton').addEventListener('click', function() {
    // 페이지 이동
    window.location.href = 'collectPreferenceFirstStyle.css';
});

// 이메일 입력란 객체 가져오기
var emailInput = document.getElementById('inputEmail');

// 이메일 입력 이벤트 리스너
emailInput.addEventListener('blur', function() {
    var email = emailInput.value;
    var emailError = document.getElementById('validEmail');

    if (!validateEmail(email)) {
        emailError.style.display = 'block';
        emailInput.classList.add('is-invalid');
    } else {
        emailError.style.display = 'none';
        emailInput.classList.remove('is-invalid');
        emailInput.classList.add('is-valid');
    }
});

// 이메일 유효성 검사 함수
function validateEmail(email) {
    var pattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return pattern.test(email);
}
