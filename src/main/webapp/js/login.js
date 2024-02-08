


/*window.onload = function() {
	const 

	const pw_show_hide = document.querySelector('.pw_show_hide')
	const input_email = document.querySelector('input[type=text]')
	const input_pw = document.querySelector('input[type=password]')
	const email_error = document.querySelector('.email_error')
	const pw_error = document.querySelector('.pw_error')
	console.log(pw_show_hide, input_pw, email_error, pw_error)

	input_email.addEventListener('click', function() {
		email_error.style.display = 'block'
	})
	input_pw.addEventListener('click', function() {
		pw_error.style.display = 'block'
	})


	// 눈모양 번갈아가면서 보이기
	let i = true
	pw_show_hide.addEventListener('click', function() {
		if (i == true) {
			pw_show_hide.style.backgroundPosition = '-105px 0'
			i = false
		} else {
			pw_show_hide.style.backgroundPosition = '-126px 0'
			i = true
		}
	})*/

/*	// JavaScript 코드 (login.js 파일 등)

	// 페이지 로드 시 호출되는 함수
	document.addEventListener("DOMContentLoaded", function() {
		// 저장된 쿠키를 확인하여 체크박스 상태 설정
		checkRememberEmail();
	});

	// 체크박스의 변경 사항을 감지하는 함수
	function validCheck() {
		var rememberCheckbox = document.getElementById("remember-check");
		var memberEmailInput = document.getElementById("memberEmail");

		// 체크박스가 체크된 경우
		if (rememberCheckbox.checked) {
			// 쿠키에 이메일 정보 저장
			setCookie("rememberEmail", memberEmailInput.value, 30); // 30일 동안 유지되는 쿠키
		} else {
			// 체크가 해제된 경우 쿠키 삭제
			deleteCookie("rememberEmail");
		}

		return true; // 원래의 submit 이벤트를 계속 진행
	}

	// 쿠키를 설정하는 함수
	function setCookie(name, value, days) {
		var expires = "";
		if (days) {
			var date = new Date();
			date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
			expires = "; expires=" + date.toUTCString();
		}
		document.cookie = name + "=" + value + expires + "; path=/";
	}

	// 쿠키를 가져오는 함수
	function getCookie(name) {
		var nameEQ = name + "=";
		var cookies = document.cookie.split(';');
		for (var i = 0; i < cookies.length; i++) {
			var cookie = cookies[i];
			while (cookie.charAt(0) == ' ') {
				cookie = cookie.substring(1, cookie.length);
			}
			if (cookie.indexOf(nameEQ) == 0) {
				return cookie.substring(nameEQ.length, cookie.length);
			}
		}
		return null;*/
	

// 쿠키를 삭제하는 함수
function deleteCookie(name) {
	document.cookie = name + "=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
}

// 저장된 쿠키를 확인하고 이메일을 입력란에 설정하는 함수
function checkRememberEmail() {
	var rememberCheckbox = document.getElementById("remember-check");
	var memberEmailInput = document.getElementById("memberEmail");

	// 저장된 이메일 쿠키 확인
	var rememberEmail = getCookie("rememberEmail");

	if (rememberEmail) {
		// 쿠키가 존재하면 이메일 입력란에 설정하고 체크박스를 체크
		memberEmailInput.value = rememberEmail;
		rememberCheckbox.checked = true;
	}
}

 // onload end

