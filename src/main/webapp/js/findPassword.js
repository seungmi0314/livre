/*const url = "http://localhost:8090/livre/";

const hiddenEmail = document.getElementById("hiddenEmail");
// 모든 부분들을 가려놨다가 이메일 인증이 되면
// 해당 창들이 보이게 하는 작업
$("#newPassword").css("display", "none");
$("#newPasswordCheck").css("display", "none");
$("#newPasswordButton").css("display", "none");

$(function() {
	$.ajax({
		url: "findPwdSendEmail",
		data: { "inputEmail": hiddenEmail.value },
		success: function(result) {
		},
		error: function() {
		}
	})
});

const findPwdAuth = document.getElementById("findPwdAuth"); // document 타입으로 선택자 선택
const findPwdAuthButton = document.getElementById("findPwdAuthButton");
const findPwdAuthId = $("#findPwdAuthId"); // jquery로 선택자 선택

findPwdAuthButton.addEventListener("click", function() { // 1. 인증 버튼 클릭했을 때
	
	if (findPwdAuth.value.length == 8) { // 2. 입력된 인증번호가 6자리 맞는지 확인
		$.ajax({
			url: "checkNumber",
			data: {
				"cNumber": findPwdAuth.value,
				"inputEmail": hiddenEmail.value
			},
			success: function(result) {

				if (result == 1) { //    1  : 인증번호 O , 시간도 O
					findPwdAuthId.text("인증되었습니다.").css("color", "green");
					$("#newPassword").css("display", "block");
					$("#newPasswordCheck").css("display", "block");
					$("#newPasswordButton").css("display", "block");

				} else if (result == 2) { //    2  : 인증번호 O , 시간이 X 
					alert("만료된 인증번호 입니다");
				} else {  // 그외는 인증번호 일치하지않을 때!
					alert("인증번호가 일치하지 않습니다."); 
				}
			},
			error: function() { 
				console.log("이메일 인증 실패");
			}
		})
	} else {  // 인증번호가 8글자가 아닐경우
		alert("인증번호를 정확하게 입력해주세요.");
		findPwdAuth.focus();
	}
});


// 새로운 비밀번호 변경창 나왔을 때
const newPassword = document.getElementById("newPassword");
const newPasswordButton = document.getElementById("newPasswordButton");

newPasswordButton.addEventListener("click", function() { // 새로운비밀번호 변경창 나왔을 때 그 변경버튼 클릭했을 때
	// 영대소문자, 숫자, 특수기호 최소 하나씩 8글자 이상
	const regExp3 = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*~()_+])[a-zA-Z\d!@#$%^&*~()_+]{8,16}$/;
	if (findPwdAuth.value == $("#newPassword").val() && $("#newPassword").val() == $("#newPasswordCheck").val()) {
		alert("현재 비밀번호와 동일한 비밀번호로 변경할 수 없습니다.")
		$("#newPassword").focus();
	} else if (!regExp3.test($("#newPassword").val())) { // 위 정규표현식에 해당하지 않을경우
		alert("영대소문자,숫자,특수기호 포함 8글자이상 입력하세요.");
		$("#newPassword").focus();
	} else if ($("#newPassword").val() == $("#newPasswordCheck").val()) { // 표현식에 대응하며, 입력부분과 재입력부분이 동일할 경우
		
		$.ajax({
			url: "/livre/member/findPassword.jsp",
			data: { "password": $("#newPassword").val(),
					"email": hiddenEmail.value},
			success: function(result) {
				if(result!=null){  // 비밀번호가 정상적으로 변경됬을 경우 (dao에서 update문)
					alert("비밀번호가 성공적으로 변경되었습니다.");
					location.href = url;
				}
			},
			error: function() {
				console.log("서블릿으로이동실패");
			}
		})


	} else {
		alert("두개의 비밀번호가 일치하지 않습니다.");
		$("#newPassword").focus();
	}
})*/