<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%-- JSTL tag library section --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Livre</title>
<!-- 파비콘  -->
<link rel="icon" href="../assets/favicon.png">
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/menu.css">
<link rel="stylesheet" href="../css/searchingBook.css">
<%-- JQuery section --%>
<%-- Bootstrap 은 JQuery 를 기반으로 구동이 되므로 반드시 JQuery 선언이 먼저 되어야 합니다. --%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>


<%-- Bootstrap section --%>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<main>
		<header>
			<!-- 헤더 입니다 -->
			<div class="header">
				<img src="./../assets/logo.svg" class="h-logo">
				<p class="h-logo-name">livre</p>
			</div>

			<div class="header-right">
				<a href="#">로그인</a> <a href="#">회원가입</a>
			</div>
		</header>

		<div class="menu-bar">
			<ul class="menu">
				<li class="menu-item"><a>홈</a></li>
				<li class="menu-item active"><a>독후감 검색</a></li>
				<li class="menu-item"><a>내 독후감</a></li>
				<li class="menu-item"><a>마이 페이지</a></li>
				<li class="menu-item"><a>이용약관</a></li>
				<li class="menu-item"><a>contact us</a></li>
			</ul>
		</div>
	</main>

	<section>

		<!-- 검색창 -->
		<form action="../book/searchedBooks.jsp">
			<div class="d-flex bd-highlight search-box-p">
				<div class="p-2 flex-fill bd-highlight searchbox-btn">
					<input class="search-box" type="text" placeholder="검색어를 입력해 주세요.">
				</div>
				<div class="p-2 flex-shrink-1 bd-highlight">
					<button class="search-btn" type="submit">
						<img src="../assets/search.svg" class="search-btn-default">
						<img src="../assets/red-search.svg" class="search-btn-red">
					</button>
				</div>
			</div>
		</form>
		
		
		<!-- 장르별 선택 -->
		<div class="select-genre-div">
            <select class="select-genre">
            	<optgroup label="장르별로 보기">
            		<option selected disabled>장르를 선택해 주세요.</option>
	            	<option>경영/경제</option>
	            	<option>건강/취미</option>
	            	<option>어린이</option>
	            	<option>역사</option>
	            	<option>여행</option>
	            	<option>과학</option>
	            	<option>만화</option>
	            	<option>사회</option>
	            	<option>소설/시/희곡</option>
	            	<option>예술/대중문화</option>
	            	<option>요리/살림</option>
	            	<option>인문학</option>
	            	<option>가정/원예/인테리어</option>
	            	<option>자기개발</option>
	            	<option>종교/역학</option>
	            	<option>청소년</option>
	            	<option>스포츠</option>
            	</optgroup>
            </select>
        </div>
		
		<!-- 랜덤으로 나와있는 책 (반복문으로) -->
		<div class="result-all">
		
			<c:forEach var="aa" begin="1" end="100" step="1">
				<div class="result-card">
					<a href="../book/bookDetail.jsp">
					<span>
						<img class="book-img" src="../assets/bookimage.svg">
					</span>
					</a>
					<p class="book-title">책 제목책 제목책 제목</p>
					<p>작가이름 | 출판사</p>
				</div>
			</c:forEach>
			
		</div>
		
		 
	</section>



</body>
</html>