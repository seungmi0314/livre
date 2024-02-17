<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../common/common2.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="/livre/css/reviewInfo.css" />
	<link rel="icon" href="/livre/assets/favicon.png">
	<title>Insert title here</title>
	<script src="https://kit.fontawesome.com/a54a73652a.js" crossorigin="anonymous"></script>
	<script type="text/javascript">
		var isToggled = false;
		if(${sessionScope.logInfo.memberNo == data.memberNo}){
			isToggled = true;
			$('.likeReview').attr('src', '/livre/assets/bookmarked.svg');
		}
		function toggleLike() {
			
			if(${whologin == 0}){
				alert('로그인이 필요한 서비스입니다.');
				var result = confirm("로그인 페이지로 이동하시겠습니까?");
				if (result){
					window.location.href = 'member/login.jsp';
				} else{
					return;
				}
			}
			
			isToggled = !isToggled
			if(isToggled){
				$('.likeReview').attr('src', '/livre/assets/bookmarked.svg');
			}else{
				$('.likeReview').attr('src', '/livre/assets/unBookmarked.svg');
			}
			
		    $.ajax({
		      url: '<%=notWithFormTag%>reviewInfo',
		      type: 'post',
		      data: {
		      	  reviewNo : ${requestScope.bean.reviewNo},
		      	  isToggled : isToggled
		      },
		      datatype: 'json',
		    
		      success: function(result, status){
				  console.log('success');
				  console.log(result);
				  console.log('상태 메시지 : ' + status);
			  },
			  error:function(result, status){
				  console.log('error');
				  console.log(result);
				  console.log('상태 메시지 : ' + status);
			  }
		  }); // ajax section END
		    
		} // function toggleLike() section END
	</script>
</head>

<body>
	<section>
		<div class="write-box">
			<div class="left">
				<form action="<%=withFormTag%>" method="post" class="review">
					<input type="hidden" name="command" value="reviewUpdate">
					<div class="review-write">
						<input class="review-title write"
							placeholder="${requestScope.bean.reviewTitle}" readonly>
						
						
						<c:forEach var="data" items="${dataList}">
						    <c:if test="${sessionScope.logInfo.memberNo != bean.memberNo}">
						    	<img src="/livre/assets/unBookmarked.svg" class="likeReview" onclick="toggleLike()">
						    </c:if>
						</c:forEach>
						
						<textarea class="review-content write" readonly>${requestScope.bean.reviewText}</textarea>

						<p class="remember-text">기억하고싶은 구절</p>
						<textarea class="remember write" readonly>${requestScope.bean.phrase}</textarea>
					</div>
			</div>

			<div class="review-info">
				<input type="text" id="search" class="book-title write"
					placeholder="${requestScope.bean.bookTitle}" autocomplete="off"
					readonly>
				<div class="book-info">
					<p>
						지은이 <span>${requestScope.bean.author}</span>
					</p>
					<p>
						출판사 <span>${requestScope.bean.publisher}</span>
					</p>
				</div>
				<div class="star">
					<img src="/livre/assets/fill-star.svg"> <img
						src="/livre/assets/fill-star.svg"> <img
						src="/livre/assets/stroke-star.svg"> <img
						src="/livre/assets/stroke-star.svg"> <img
						src="/livre/assets/stroke-star.svg">
				</div>
				<div class="read-date">
					<input class="start-date write" readonly
						placeholder="${requestScope.bean.startDate}"> ~ <input
						class="end-date write" readonly
						placeholder="${requestScope.bean.endDate}">
				</div>

				<div class="genre-box">
            		<p>${requestScope.bean.genre}</p>
            	</div>
			</div>
		</div>
		</form>
	</section>
</body>
</html>