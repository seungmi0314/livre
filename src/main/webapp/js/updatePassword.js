// updatePassword.js

function checkAuthentication() {
    var findPwdAuth = document.getElementById('findPwdAuth').value;
    var authkey = '<%= (String)request.getSession().getAttribute("authkey") %>';

    if (authkey === findPwdAuth) {
        alert("인증되었습니다.");
        location.href = '<%= request.getContextPath() + "/member/updatePassword.jsp" %>';
    } else {
        alert("다시 시도하세요.");
    }
}

// updatePassword.js 파일 끝
