function checkEmail() {
	var emailInput = document.getElementById("memberEmail").value;
	var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

	if (!emailPattern.test(emailInput)) {
		document.getElementById("validEmail").style.display = "block";
		alert('올바른 이메일을 작성해주세요.');
	} else {
		document.getElementById("validEmail").style.display = "none";
		alert('임시 비밀번호를 전송했습니다.');
		
		// 여기에 서버로 폼을 제출하는 코드를 추가할 수 있습니다.
		// document.forms["findPasswordForm"].submit();
		return true;
	}
}