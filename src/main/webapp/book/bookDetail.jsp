<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ include file="../common/common2.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Livre</title>
	<link rel="stylesheet" href="/livre/css/bookDetail.css">
</head>
<body>
	
	<section>
	
		<!-- 책 상세보기 -->
		<div class="container">
			<!-- 배경 이미지 -->
			<img class="background-img" src="/livre/assets/thinking-out-loud2.svg">
			
			<!-- 책 정보 -->
			<div class="book-detail">
				<img class="book-image" src="/livre/assets/bookimage.svg">
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
				<img class="user-image" src="/livre/assets/user-image.svg">
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
				<img class="user-image" src="/livre/assets/user-image.svg">
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
				<img class="user-image" src="/livre/assets/user-image.svg">
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
				<img class="user-image" src="/livre/assets/user-image.svg">
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