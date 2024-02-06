<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>

<%-- jstl tag library section --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- whologin 변수는 현재 로그인의 상태를 알려주는 변수 입니다. --%>
<%-- 미로그인(0), 일반 사용자(1), 관리자(2) --%>
<c:set var="whologin" value="0" />

<%-- 아이디가 'admin' 이면 '관리자' 입니다.--%>
<%-- logInfo 속성을 사용하여 현재 로그인 상태를 확인할 수 있습니다. --%>
<c:if test="${not empty sessionScope.logInfo}">
	<c:if test="${sessionScope.logInfo.id =='admin'}">
		<c:set var="whologin" value="2" />
	</c:if>
	<c:if test="${sessionScope.logInfo.id !='admin'}">
		<c:set var="whologin" value="1" />
	</c:if>
</c:if>

<%
 	String appName = request.getContextPath();
	String mappingName = "/Livre"; // in FrontController.java file
		
	String withFormTag = appName + mappingName;
	String notWithFormTag = withFormTag + "?command=";
	// out.print("컨텍스트 이름 : " + appName + "<br/>");
 %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Livre</title>
	<!-- 파비콘  -->
	<link rel="icon" href="/livre/assets/favicon.png">
	<!-- jQuery section -->
	<!-- Bootstrap 은 JQuery 를 기반으로 구동이 되므로 반드시 JQuery 선언이 먼저 되어야 합니다. -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	
	<!-- bootstrap section -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
		rel="stylesheet">
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	
</body>
</html>