<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Kakao Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="/livre/js/snsLogin.js"></script>
</head>
<body>

	<%
	// 이 부분에 카카오 로그인 성공 시 출력할 내용을 추가하세요.
	String access_token = request.getParameter("access_token");
	String expires_in = request.getParameter("expires_in");
	String refresh_token = request.getParameter("refresh_token");
	String refresh_token_expires_in = request.getParameter("refresh_token_expires_in");
	String scope = request.getParameter("scope");
	String token_type = request.getParameter("token_type");

	out.println("Kakao login success:");
	out.println("access_token: " + access_token);
	out.println("expires_in: " + expires_in);
	out.println("refresh_token: " + refresh_token);
	out.println("refresh_token_expires_in: " + refresh_token_expires_in);
	out.println("scope: " + scope);
	out.println("token_type: " + token_type);

	// 여기에 필요한 정보를 콘솔에 출력하는 코드추가
	System.out.println("access_token: " + access_token);
	%>

</body>
</html>