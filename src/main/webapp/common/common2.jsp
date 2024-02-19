<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>

<%-- jstl tag library section --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="pageHL" value="" />
<%-- whologin 변수는 현재 로그인의 상태를 알려주는 변수 입니다. --%>
<%-- 미로그인(0), 일반 사용자(1), 관리자(2) --%>
<c:set var="whologin" value="0" />

<%-- 이메일이 'admin' 이면 '관리자' 입니다.--%>
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
<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
    rel="stylesheet">

<!-- header.css -->
<link rel="stylesheet" href="/livre/css/header.css" />
<link rel="stylesheet" href="/livre/css/menu.css" />

<!-- JavaScript to add 'active' class to clicked menu item -->
<script>

$(document).ready(function(){
    // 페이지 로드 시 localStorage에서 저장된 메뉴 정보 가져오기
    var selectedMenu = localStorage.getItem('selectedMenu');

    // 초기에는 저장된 정보가 없으므로 selectedMenu가 null이 될 수 있습니다.
    if (selectedMenu) {
        // 저장된 정보가 있을 경우 해당 메뉴 항목에 active 클래스 추가
        $('.menu-item:contains(' + selectedMenu + ')').addClass('active');
    }

    // 메뉴 클릭 시 실행될 함수
    $('.menu-item').on('click', function(){
        // 다른 메뉴 항목에서 active 클래스 제거
        $('.menu-item').removeClass('active');
        
        // 클릭된 메뉴 항목에 active 클래스 추가
        $(this).addClass('active');

        // localStorage에 선택한 메뉴 정보 저장
        localStorage.setItem('selectedMenu', $(this).text().trim());
    });
});
</script>


</head>
<body>
    <main>
        <header>
            <!-- 헤더 입니다 -->
            <div class="header">
                <img src="/livre/assets/logo.svg" class="h-logo">
                <p class="h-logo-name" style="margin: 0;">livre</p>
            </div>
            <div class="header-right">

                <c:if test="${whologin eq 0}">
                    <a href="/livre/Livre?command=login">로그인</a><a href="/livre/Livre?command=joinMemberShip">회원가입</a>
                </c:if>
                <c:if test="${whologin ne 0}">
                    <!-- 프로필 사진 추가 -->
                    <a href="#">${sessionScope.logInfo.memberNick} 님</a>
                    <a href="<%=notWithFormTag%>logout">로그아웃</a>
                </c:if>
            </div>
        </header>
        
		<div class="menu-bar">
    
             <ul class="menu">
				<li class="menu-item"><a href="<%=notWithFormTag%>main-page">홈</a></li>
				<li class="menu-item"><a href="<%=notWithFormTag%>bookList">독후감 검색</a></li>
				<li class="menu-item"><a href="<%=notWithFormTag%>my-review">내 독후감</a></li>
				<li class="menu-item"><a href="<%=notWithFormTag%>my-page&memberNo=${sessionScope.logInfo.memberNo}"">마이 페이지</a></li>
				<li class="menu-item"><a href="<%=notWithFormTag%>">이용약관</a></li>
				<li class="menu-item"><a href="<%=notWithFormTag%>">contact us</a></li>
			</ul>
        </div>

       
    </main>
    
</body>
</html>
