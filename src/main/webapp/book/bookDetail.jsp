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
	<script type="text/javascript">
		$(document).ready(function(){
			
			var bookContent = "${requestScope.bean.bookContent}";
			
			// . ? ! 뒤에 공백이 오는 경우 <br>을 추가하는 정규식
			var regex1 = /([.?!])\s/g;
			var modifiedContent = bookContent.replace(regex1, '$1<br>');
			
			// ?! 나 !!! 로 끝나는 문장에서 마지막 ! 뒤에만 <br>을 추가하는 정규식
			var regex2 = /(!+)(?=[^.?!]*$)/g;
			modifiedContent = modifiedContent.replace(regex2, '$1<br>');
			
			if(modifiedContent.length > 420){
				modifiedContent = modifiedContent.substring(0, 430) + ' ...';
			}
			
			$('.bookContent-p').html(modifiedContent);
				    
		});
			
		function goToShop(bookTitle){
			var url = 'https://search.shopping.naver.com/book/search?bookTabType=ALL&pageIndex=1&pageSize=40&query=';
			var fullUrl = url + bookTitle;
			
			window.location.href = fullUrl;
		}
	</script>
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
					<p class="bookContent-p">
						${requestScope.bean.bookContent}
					</p>
				</div>
				<div class="buyBook-btn-div">
					<button class="buyBook-btn" onclick="goToShop('${requestScope.bean.bookTitle}')">
						<span>이 책 사러가기</span>
					</button>
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
			<%-- 로그인 아이디와 작성자의 아이디가 다르면 true 로 지정합니다. --%>
			<%-- readhitUpdate 파라미터는 조회수 업데이트를 할 것인지 결정해주는 boolean 변수입니다. --%>
			<c:set var="readhitUpdate" value="${not (sessionScope.logInfo.memberEmail == bean.memberEmail)}" />
			<a class="review-a" href="<%=notWithFormTag%>reviewInfo&reviewNo=${bean.reviewNo}&readhitUpdate=${readhitUpdate}">
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