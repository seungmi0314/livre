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
<link rel="icon" href="./../assets/favicon.png">
<link rel="stylesheet" href="./../css/header.css" />
<link rel="stylesheet" href="./../css/menu.css" />
<link rel="stylesheet" href="../css/SearchBookReport.css">
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

		<!-- 독후감 검색창 -->
		<form action="https://www.naver.com">
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
		
		<!-- 검색 결과 텍스트 -->
		<div class="result-text">
            <span>"xxx"에 대한 n개의 검색 결과</span>
            <!-- 장르별 선택 -->
            <select class="select-genre">
            	<option>장르별 조회하기</option>
            	<option>aaa</option>
            	<option>ddddd</option>
            	<option>eeee</option>
            </select>
        </div>
		
		<!-- 검색 결과 책 -->
		<div class="result-all">
		
			<div class="result-card">
				<a href="#">
				<span>
					<img class="book-img" src="../assets/bookimage.svg">
				</span>
				</a>
				<p class="book-title">책 제목책 제목책 제목</p>
				<p>작가이름 | 출판사</p>
			</div>
			
			<div class="result-card">
				<a href="#">
				<span>
					<img class="book-img" src="../assets/bookimage.svg">
				</span>
				</a>
				<p class="book-title">책 제목책 제목책 제목</p>
				<p>작가이름 | 출판사</p>
			</div>
			
			<div class="result-card">
				<a href="#">
				<span>
					<img class="book-img" src="../assets/bookimage.svg">
				</span>
				</a>
				<p class="book-title">책 제목책 제목책 제목</p>
				<p>작가이름 | 출판사</p>
			</div>
			
			<div class="result-card">
				<a href="#">
				<span>
					<img class="book-img" src="../assets/bookimage.svg">
				</span>
				</a>
				<p class="book-title">책 제목책 제목책 제목</p>
				<p>작가이름 | 출판사</p>
			</div>
			
			<div class="result-card">
				<a href="#">
				<span>
					<img class="book-img" src="../assets/bookimage.svg">
				</span>
				</a>
				<p class="book-title">책 제목책 제목책 제목</p>
				<p>작가이름 | 출판사</p>
			</div>
			
			<div class="result-card">
				<a href="#">
				<span>
					<img class="book-img" src="../assets/bookimage.svg">
				</span>
				</a>
				<p class="book-title">책 제목책 제목책 제목</p>
				<p>작가이름 | 출판사</p>
			</div>
			
			<div class="result-card">
				<a href="#">
				<span>
					<img class="book-img" src="../assets/bookimage.svg">
				</span>
				</a>
				<p class="book-title">책 제목책 제목책 제목</p>
				<p>작가이름 | 출판사</p>
			</div>
			
			<div class="result-card">
				<a href="#">
				<span>
					<img class="book-img" src="../assets/bookimage.svg">
				</span>
				</a>
				<p class="book-title">책 제목책 제목책 제목</p>
				<p>작가이름 | 출판사</p>
			</div>
			
		</div>
			
		 
	</section>



</body>
</html>