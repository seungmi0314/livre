
<%@page import="com.livre.model.dao.MyBookDao"%>
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
    
    <link rel="stylesheet" href="/livre/css/my-review.css" />
    <link rel="stylesheet" href="/livre/css/header.css" />
    <link rel="stylesheet" href="/livre/css/menu.css" />
    <link rel="icon" href="/livre/css/favicon.png">
    
    <title>내 독후감</title>
    <script src="https://kit.fontawesome.com/a54a73652a.js" crossorigin="anonymous"></script>
  <!-- 	<script src="./../js/myReview.js"></script> -->
</head>

<body>
    

    <main>
      
    <!--  
    
    메뉴 바 사용하는 사람들만 주석 풀어서 사용 해 주세요
    사용하지 않는 페이지는 삭제하고 쓰기 (+css)
     --> 
    <div class="menu-bar">
    
              <ul class="menu">
                <li class="menu-item"><a href="/livre/Livre?command=my-review">홈</a></li>
                <li class="menu-item active"><a  href="/livre/Livre?command=searchingBook">독후감 검색</a></li>
                <li class="menu-item"><a href="/livre/Livre?command=my-review">내 독후감</a></li>
                <li class="menu-item"><a href="/livre/Livre?command=my-review">마이 페이지</a></li>
                <li class="menu-item"><a href="/livre/Livre?command=my-review">이용약관</a></li>
                <li class="menu-item"><a href="/livre/Livre?command=contactus">contact us</a></li>
              </ul>
        </div>
       
    </main>

    <section>
     
     <!-- index.jsp를 복사 후 section 내부를 삭제하고 코드를 작성 해 주세요 + (index.css도 삭제) -->
     
     <!-- 독후감 검색창 -->
               <div class="search-box-p">
            <div class="searchbox-btn">
            <input class="search-box" placeholder="내 독후감 검색">
            <button type="button" class="search-btn">
                <img src="/livre/assets/red-search.svg">
            </button>
        </div>
        </div>
       
       <!-- 추가하기, 삭제하기 버튼 -->
        <div class="plus-del">
            <button class="plus"><i class="fa-solid fa-plus"></i> 추가하기</button>
            <button class="del"><i class="fa-regular fa-trash-can"></i> 삭제하기</button>
        </div>


		<!-- 내가 작성한 독후감 목록들 (최신순 조회가 기본값) -->
        <div class="my-review-list">
        
        
        <!-- 독후감 하나당 카드 하나 -->
        
        <%-- 박스 누르면 상세 페이지로 이동 --%>
               <c:forEach var="bean" items="${requestScope.dataList}" varStatus="status">
            <a href="<%=notWithFormTag%>reviewDetail&reviewNo=${review.no}">
                <div class="my-review">
	      		  
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
				
                </div>
            </a>
                   </c:forEach>
           
        </div>
        
    </section>

   
</body>
</html>