<%@page import="com.livre.model.dao.MyReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/common2.jsp"%>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="/livre/css/my-review.css?after" />
    
    
    <link rel="icon" href="/livre/css/favicon.png">
    
    <title>내 독후감</title>
   <script>
	/* 독후감 삭제 */
	function delReview(reviewNo, paramList){
	/* no : 삭제될 게시물 번호, paramList : 페이징 관련 파라미터들 */
		
		var response = window.confirm('해당 게시물을 삭제하시겠습니까?');
		
		if(response==true){
			var url = '<%=notWithFormTag%>reviewDel&reviewNo=' + reviewNo + paramList;
			/*alert(url);*/
			location.href = url ;
		
		}else{
			alert('게시물 삭제가 취소되었습니다.');
			return false ;
		}
}


   
   </script> 
  	
</head>

<body>
    
  
    
    <section>
     
     <!-- index.jsp를 복사 후 section 내부를 삭제하고 코드를 작성 해 주세요 + (index.css도 삭제) -->
     
     <!-- 독후감 검색창 -->
               <div class="search-box-p">
            <form action="<%=withFormTag%>" method="get" class="searchbox-btn">
            <input type="hidden" name="command" value="reviewSearch">
            <input class="search-box" type="text" id="keyword" name="keyword" placeholder="내 독후감 검색">
            <button type="submit" class="search-btn">
                <img src="/livre/assets/red-search.svg">
            </button>
        </form>
        </div>
       
       <!-- 추가하기, 삭제하기 버튼 -->
        <div class="plus-del">
            <a href="/livre/book/review-upload.jsp" class="plus"><i class="fa-solid fa-plus"></i> 추가하기</a>
            <button class="trash" id="trash" onclick="xBtn();"><i class="fa-regular fa-trash-can"></i> 삭제하기</button>
        </div>


		<!-- 내가 작성한 독후감 목록들 (최신순 조회가 기본값) -->
        <div class="my-review-list">
        
        
        <!-- 독후감 하나당 카드 하나 -->
        
        <%-- 박스 누르면 상세 페이지로 이동 --%>
               <c:forEach var="bean" items="${requestScope.dataList}" varStatus="status">
                
                <div class="my-review" value="${bean.reviewNo}">
	      		  <div id="del" class="del" onclick="return delReview('${bean.reviewNo}','${requestScope.paging.flowParameter}');"><i class="fa-solid fa-x"></i></div>
            
           <%-- <c:set var="readhitUpdate" value="${not (sessionScope.loginfo.memberEmail == bean.memberEmail)}"/>  --%>
            <a href="<%=notWithFormTag%>reviewDetail&reviewNo=${bean.reviewNo}&readhitUpdate=${readhitUpdate}${requestScope.paging.flowParameter}">
                <!-- X 표시 -->
                    <p class="book-name">${bean.reviewTitle}</p>
                    <div class="star-author">
                    
                    	<!-- 별 모양 사용자가 입력한 평점에 따라 동적으로 변경되어야 함 -->
                        <div id="star" class="star">
                            <input style="display: none;"type="radio" name="reviewStar" value="1" id="rate1"><label
								for="rate1"><i class="fa-solid fa-star"></i></label>
							<input style="display: none;" type="radio" name="reviewStar" value="2" id="rate2"><label
								for="rate2"><i class="fa-solid fa-star"></i></label>
							<input style="display: none;" type="radio" name="reviewStar" value="3" id="rate3"><label
								for="rate3"><i class="fa-solid fa-star"></i></label>
							<input style="display: none;" type="radio" name="reviewStar" value="4" id="rate4"><label
								for="rate4"><i class="fa-solid fa-star"></i></label>
							<input style="display: none;" type="radio" name="reviewStar" value="5" id="rate5"><label
								for="rate5"><i class="fa-solid fa-star"></i></label>
                        </div>
                        <div class="author">
                           ${bean.author}
                        </div>
                    </div>
    
                    <div class="content">
                    	${bean.reviewText}
                    </div>
    
                    <p class="publisher">${bean.publisher}</p>
				
            </a>
                </div>
                   </c:forEach>
           
        </div>
        
    </section>

   
</body>
<script src="/livre/js/myReview.js"></script>
<script src="https://kit.fontawesome.com/a54a73652a.js" crossorigin="anonymous"></script>
</html>