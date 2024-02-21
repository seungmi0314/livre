<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>임시 비밀번호 입력</title>


<link rel="stylesheet" type="text/css"
	href="/livre/css/tempPassword.css">
<link rel="stylesheet" href="/livre/css/index.css" />
<link rel="stylesheet" href="/livre/css/header.css" />
<meta charset="UTF-8">

<%
String emailSentSuccessMessage = (String) session.getAttribute("emailSentSuccessMessage");
if (emailSentSuccessMessage != null && !emailSentSuccessMessage.isEmpty()) {
	session.removeAttribute("emailSentSuccessMessage");
%>
<script type="text/javascript">
    alert('<%=emailSentSuccessMessage%>');
</script>
<%
}
%>

<%
String alertMessage = (String) request.getAttribute("alertMessage");
if (alertMessage != null) {
%>
<script type="text/javascript">
    alert('<%=alertMessage%>');
	session.removeAttribute("alertMessage");
</script>
<%
}
%>
</head>
<body>
	<main></main>

	<section>

		<form name="findPasswordForm" method="post" action="<%=withFormTag%>">

			<div class="container mt-3">
				<input type="hidden" name="command" value="tempPassword"> <span
					id="banner"><b>임시 비밀번호 입력</b></span><br /> <br /> <br /> <br />

				<!-- 임시 비밀번호 입력 -->
				<div class="mb-3 mt-3">
					<input type="text" id="findPwdAuth" name="findPwdAuth"
						placeholder="임시 비밀번호 입력" autocomplete="off" class="form-control">
					<hr width="450px">
					<div class="invalid-feedback" id="validEmail">
						* 이메일이 오지 않았나요? <br /> 스팸함을 확인하거나 다시 시도해 주세요.
					</div>

					</br> </br>
					<!-- 확인 버튼 -->
					<button type="submit" id="submitButton" class="btn btn-primary"
						onclick="return checkAuthentication();">확인</button>
					</br> </br>

				</div>
			</div>

		</form>
	</section>
<script type="text/javascript">
		document.addEventListener('DOMContentLoaded', function() {
			var authInput = document.getElementById('findPwdAuth');
			var validEmailDiv = document.getElementById('validEmail');

			authInput.addEventListener('input', function() {
				// 입력 필드에 텍스트가 있을 경우, 에러 메시지를 숨깁니다.
				if (authInput.value.length > 0) {
					validEmailDiv.style.display = 'none';
				} else {
					// 입력 필드가 비어있을 경우, 에러 메시지를 다시 표시합니다.
					validEmailDiv.style.display = 'block';
				}
			});
		});
	</script>

</body>


</html>