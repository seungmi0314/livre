function checkEmail() {
	    var emailInput = document.getElementById("memberEmail").value;
	    var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

	    if (!emailPattern.test(emailInput)) {
	        // 이메일 형식이 올바르지 않을 때의 처리
	        document.getElementById("validEmail").style.display = "block";
	        return false;
	    } else {
	        // 이메일 형식이 올바를 때의 처리
	        document.getElementById("validEmail").style.display = "none";
	        return true;
	    }
	}