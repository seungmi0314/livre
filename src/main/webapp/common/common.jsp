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
	<c:if test="${sessionScope.logInfo.memberEmail =='admin'}">
		<c:set var="whologin" value="2" />
	</c:if>
	<c:if test="${sessionScope.logInfo.memberEmail !='admin'}">
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


<!-- header.css -->
<link rel="stylesheet" href="/livre/css/header.css" />
<style>
a {
	text-decoration: none;
	color: black;
}
</style>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<main>
		<header>
			<!-- 헤더 입니다 -->
			<a href="index.jsp"><div class="header">
                <img src="/livre/assets/logo.svg" class="h-logo">
                <p class="h-logo-name" style="margin: 0;">livre</p>
            </div></a>
			<div class="header-right">

				<c:if test="${whologin eq 0}">
					<a href="<%=notWithFormTag%>login">로그인</a>
					<a href="<%=notWithFormTag%>meInsert">회원가입</a>
				</c:if>
				<c:if test="${whologin ne 0}">
					<div class="header_profile">
						<c:choose>
							<c:when test="${not empty logInfo.memberImg}">
								<img src="/livre/assets/${logInfo.memberImg }">
							</c:when>
							<c:otherwise>
								<img src="/livre/assets/profile_mypage.png">
							</c:otherwise>
						</c:choose>
					</div>
					<a href="<%=notWithFormTag%>my-page&memberNo=${sessionScope.logInfo.memberNo}">${sessionScope.logInfo.memberNick} 님</a>
					<a href="<%=notWithFormTag%>logout">로그아웃</a>
				</c:if>
			</div>
		</header>



	</main>
	<%-- 사용자에게 주의/경고/오류 등을 알려 주기 위한 Alert Box --%>
	<c:if test="${not empty sessionScope.alertMessage}">
		<div class="alert alert-danger alert-dismissible">
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>경고 메시지 : </strong>${sessionScope.alertMessage}
		</div>
	</c:if>

	<%-- 보여준 Alert Box의 내용을 session 영역에서 제거합니다. --%>
	<%-- session.removeAttribute("alertMessage"); --%>
	<c:remove var="alertMessage" scope="session" />
</body>
</html>