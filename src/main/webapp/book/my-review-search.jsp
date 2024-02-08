<%@page import="com.livre.model.dao.MyReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/common.jsp"%>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="/livre/css/my-review.css?after" />
    
    
    <link rel="icon" href="/livre/css/favicon.png">
    
    <title>내 독후감</title>
    <script src="https://kit.fontawesome.com/a54a73652a.js" crossorigin="anonymous"></script>
  	
</head>

<body>
    

    <section>
     
     <!-- index.jsp를 복사 후 section 내부를 삭제하고 코드를 작성 해 주세요 + (index.css도 삭제) -->
     
     <!-- 독후감 검색창 -->
               <div class="search-box-p">
            <form action="<%=withFormTag%>" method="get" class="searchbox-btn">
            <input type="hidden" name="command" value="reviewSearched">
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
                
                <div class="my-review" value="${review.no}">
	      		  <div id="del" class="del" onclick="return deleteReview('${bean.reviewNo}', '${requestScope.paging.flowParameter}');"><i class="fa-solid fa-x"></i></div>
            <a href="<%=notWithFormTag%>reviewDetail&reviewNo=${review.no}">
                <!-- X 표시 -->
                    <p class="book-name">${bean.reviewTitle}</p>
                    <div class="star-author">
                    
                    	<!-- 별 모양 사용자가 입력한 평점에 따라 동적으로 변경되어야 함 -->
                        <div class="star">
                            <img src="/livre/assets/fill-star.svg">
                            <img src="/livre/assets/fill-star.svg">
                            <img src="/livre/assets/stroke-star.svg">
                            <img src="/livre/assets/stroke-star.svg">
                            <img src="/livre/assets/stroke-star.svg">
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
</html>