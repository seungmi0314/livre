function checkAuthentication() {
	var findPwdAuth = document.getElementById("findPwdAuth").value;
	var authkey = '<%= (String)request.getSession().getAttribute("authkey") %>';

	console.log("authkey: " + authkey);
	console.log("findPwdAuth: " + findPwdAuth);

	if (authkey.toLowerCase() === findPwdAuth.toLowerCase()) {
		alert("임시 비밀번호로 로그인 하신 후 비밀번호를 변경해주세요");
	} else {
		alert("다시 시도하세요.");
	}
}