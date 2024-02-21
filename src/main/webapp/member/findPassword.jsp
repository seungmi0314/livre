<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 찾기</title>

<link rel="stylesheet" type="text/css"
	href="/livre/css/findPassword.css">
<link rel="stylesheet" href="/livre/css/index.css" />
<link rel="stylesheet" href="/livre/css/header.css" />

<!-- ctrl shift f 자동정렬 하면 오류남... -->
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

<meta charset="UTF-8">
</head>
<body>
	<main></main>

	<section>
		<form name="findPasswordForm" id="findPasswordForm" method="post"
			action="<%=withFormTag%>">
			<input type="hidden" name="command" value="findPassword">
			<div class="container mt-3">
				<span id="banner"><b>비밀번호 찾기</b></span><br /> <br /> <br /> <br />

				<!-- 비밀번호 찾기 -->
				<div class="mb-3 mt-3">
					<!-- 이메일 입력 필드 -->
					<input id="memberEmail" type="text" class="form-control"
						name="memberEmail" placeholder="이메일 입력" required>
					<hr width="450px">
					<div class="valid-feedback"></div>
					<!-- 에러 메시지 -->
					<div class="invalid-feedback" id="validEmail">* livre에 가입된
						이메일 계정으로 시도해 주세요.</div>
				</div>

				</br> </br>
				<!-- 비밀번호 찾기 버튼 -->
				<button id="submitButton" type="submit" class="btn btn-primary"
					onclick="return checkEmail();">임시 비밀번호 전송</button>
				</br> </br>
			</div>
		</form>
	</section>
	<script type="text/javascript">
		document.addEventListener('DOMContentLoaded', function() {
			var emailInput = document.getElementById('memberEmail');
			var validEmailDiv = document.getElementById('validEmail');

			emailInput.addEventListener('input', function() {
				// 입력 필드에 텍스트가 있을 경우, 에러 메시지를 숨깁니다.
				if (emailInput.value.length > 0) {
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