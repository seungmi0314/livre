<%@page import="com.livre.model.dao.MyReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../common/common2.jsp"%>




<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="/livre/css/my-review.css?after" />


<link rel="icon" href="/livre/css/favicon.png">

<title>내가 좋아요 한 목록</title>

<style type="text/css">
.favorite-list-title {
    margin-top: 200px;
    text-align: center;
    font-size: 20px;
    font-style: italic;
    font-weight: bold;
}
</style>

</head>

<body>



	<section>
		
		<div class="favorite-list-title">나의 북마크</div>
		<!-- 내가 작성한 독후감 목록들 (최신순 조회가 기본값) -->
		<div class="my-review-list" style="margin-top: 50px;">


			<!-- 독후감 하나당 카드 하나 -->

			<%-- 박스 누르면 상세 페이지로 이동 --%>
			<c:forEach var="bean" items="${requestScope.dataList}"
				varStatus="status">

				<div class="my-review" value="${bean.reviewNo}">
					<div id="del" class="del"
						onclick="return delReview('${bean.reviewNo}','${requestScope.paging.flowParameter}');">
						<i class="fa-solid fa-x"></i>
					</div>

					<%-- <c:set var="readhitUpdate" value="${not (sessionScope.loginfo.memberEmail == bean.memberEmail)}"/>  --%>
					<a
						href="<%=notWithFormTag%>reviewDetail&reviewNo=${bean.reviewNo}${requestScope.paging.flowParameter}">
						<p class="book-name">${bean.reviewTitle}</p>
							<div class="star-author">

								<div class="star-box">
									<img src="/livre/assets/fill-star.svg"> <img
										src="/livre/assets/fill-star.svg"> <img
										src="/livre/assets/stroke-star.svg"> <img
										src="/livre/assets/stroke-star.svg"> <img
										src="/livre/assets/stroke-star.svg">
								</div>
								<div class="author">${bean.author}</div>
							</div>

						<div class="content">${bean.reviewText}</div>

						<p class="publisher">${bean.publisher}</p>

					</a>
				</div>
			</c:forEach>

		</div>

	</section>


</body>
<script src="/livre/js/myReview.js"></script>
<script src="https://kit.fontawesome.com/a54a73652a.js"
	crossorigin="anonymous"></script>
</html>