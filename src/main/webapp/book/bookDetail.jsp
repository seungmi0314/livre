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
<link rel="stylesheet" href="../css/bookDetail.css">
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
		
		<!-- 책 상세보기 -->
		<div class="container">
			<!-- 배경 이미지 -->
			<img class="background-img" src="../assets/thinking-out-loud2.svg">
			
			<!-- 책 정보 -->
			<div class="book-detail">
				<img class="book-image" src="../assets/bookimage.svg">
				<div class="book-info">
					<p class="book-info-p book-title">책 제목 입니다.</p>
					<p class="book-info-p book-subTitle">부제목(?) 입니다.부제목(?) 입니다.</p>
					<p class="author-publisher">지은이 | 출판사</p>
					<p>
						<본서의 특징><br>
						■ 수험생 입장에서 정보처리기사 합격을 위한 다양한 솔루션 제공!<br>
						■ 2023년 CBT 기출 복원문제+암기 비법서 PDF+별도 족보 문제 제공비전공자를 위한 최고의 수험서!!<br>
						1. 2023년 CBT 기출 복원문제 상세 반영!<br>
						2. 빠른 학습을 위한 중요도 표시 및 학습 Point 수록<br>
						3. 데일리 문제 및 유튜브 문제 풀이 강의 영상 제공<br>
						4. 최적의 암기비법 PDF 제공<br>
						5. 합격만을 위한 수제비 학습 전략 안내
					</p>
				</div>
				<div class="buyBook-btn-div">
					<button class="buyBook-btn"><span>이 책 사러가기</span></button>
				</div>
			</div>
			
			<!-- 북마크순 최신순 분류 -->
			<div class="sorted-by">
				<a class="bookmarks" href="#">
					북마크순
				</a>
				<span> | </span>
				<a class="latest" href="#">
					최신순
				</a>
			</div>
			
			<!-- 독후감 카드 -->
			<div class="reviewCard">
				<img class="user-image" src="../assets/user-image.svg">
				<div class="user-simple-review">
					<p class="user-nickname">닉네임</p>
					<p class="review-title">독후감 제목</p>
					<p>
						독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용
						독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용
						독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용
						독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용
					</p>
				</div>
				<div class="cd-rh">
					<p>작성일자 : 2020/02/02</p>
					<p>조회수 : 33</p>
				</div>
			</div>
			
			<div class="reviewCard">
				<img class="user-image" src="../assets/user-image.svg">
				<div class="user-simple-review">
					<p class="user-nickname">닉네임</p>
					<p class="review-title">독후감 제목</p>
					<p>
						독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용
						독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용
						독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용
						독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용
					</p>
				</div>
				<div class="cd-rh">
					<p>작성일자 : 2020/02/02</p>
					<p>조회수 : 33</p>
				</div>
			</div>
			
			<div class="reviewCard">
				<img class="user-image" src="../assets/user-image.svg">
				<div class="user-simple-review">
					<p class="user-nickname">닉네임</p>
					<p class="review-title">독후감 제목</p>
					<p>
						독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용
						독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용
						독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용
						독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용
					</p>
				</div>
				<div class="cd-rh">
					<p>작성일자 : 2020/02/02</p>
					<p>조회수 : 33</p>
				</div>
			</div>
			
			<div class="reviewCard">
				<img class="user-image" src="../assets/user-image.svg">
				<div class="user-simple-review">
					<p class="user-nickname">닉네임</p>
					<p class="review-title">독후감 제목</p>
					<p>
						독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용
						독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용
						독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용
						독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용 독후감 내용
					</p>
				</div>
				<div class="cd-rh">
					<p>작성일자 : 2020/02/02</p>
					<p>조회수 : 33</p>
				</div>
			</div>
			
		</div>
		
	</section>



</body>
</html>