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
				<img class="book-image" src="/livre/dummy/${requestScope.bean.bookImg}">
				<div class="book-info">
					<p class="book-info-p book-title">${requestScope.bean.bookTitle}</p>
					<p></p>
					<p class="author-publisher">${requestScope.bean.author} | ${requestScope.bean.publisher}</p>
					<p>${requestScope.bean.bookContent}</p>
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
			<c:forEach var="bean" items="${dataList}">
			<a class="review-a" href="#">
				<div class="reviewCard">
					<img class="user-image" src="/livre/assets/${bean.memberImg}">
					<div class="user-simple-review">
						<p class="user-nickname">${bean.memberNick}</p>
						<p class="review-title">${bean.reviewTitle}</p>
						<p>
						    <c:choose>
						        <c:when test="${fn:length(bean.reviewText) > 150}">
						            ${fn:substring(bean.reviewText, 0, 120)} <span class="moreView">...더보기</span>
						        </c:when>
						        <c:otherwise>
						            ${bean.reviewText}
						        </c:otherwise>
						    </c:choose>
						</p>
					</div>
					<div class="cd-rh">
						<p>작성일자 : ${bean.createDate}</p>
						<p>조회수 : ${bean.readHit}</p>
					</div>
				</div>
			</a>
			</c:forEach>
			
		</div>
		
	</section>



</body>
</html>