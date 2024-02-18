<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
			rel="stylesheet">
			<link rel="stylesheet" type="text/css" href="/livre/css/emailChekStyle.css">
	<script type="text/javascript">
		function meClose(isRegister){
			opener.logInForm.isRegister.value = isRegister ;
			self.close();
		}
	</script>
</head>
<body>
	<div class="container" id="textDiv">
		<p align="center">
			${message}
			<br/>
			${plus_message}
		</p>
		<hr>
		<div class="row" align="center">
			<button class="btn btn-primary" type="button" 
				onclick="meClose('${isRegister}');" id="closeButton">
				닫&nbsp;&nbsp;기
			</button>
		</div>
	</div>
</body>
</html>