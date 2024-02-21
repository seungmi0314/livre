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
    <link rel="stylesheet" href="/livre/css/reivew-detail.css" />
    <link rel="icon" href="/livre/assets/favicon.png">
    <title>독후감 작성</title>
    
    <script src="https://kit.fontawesome.com/a54a73652a.js" crossorigin="anonymous"></script>
  
</head>

<body>
    


    <section>
     
     <!-- index.jsp를 복사 후 section 내부를 삭제하고 코드를 작성 해 주세요 + (index.css도 삭제) -->
     
		 
            <div class="write-box">
        <div class="left">
            

            
            <div class="button-box">
                <button class="edit" onclick="submit(); edit();"><i class="fa-solid fa-pen-to-square"></i> 수정하기</button>
            </div>
 		<form action="<%=withFormTag%>" method="post" class="review" >
 			<input type="hidden" name="command" value="reviewUpdate"> 
 			<input type="hidden" name="reviewNo" value="${bean.reviewNo}">
            <div class="review-write">
                <input class="review-title write" name="reviewTitle" placeholder="${requestScope.bean.reviewTitle}"  readonly>

                <textarea class="review-content write" name="reviewText" readonly>${requestScope.bean.reviewText}</textarea>

                <p class="remember-text">기억하고싶은 구절</p>
                <textarea class="remember write" name="phrase" readonly>${requestScope.bean.phrase}</textarea>
                
            </div>


            <div class="submit-btn">
                <button type="submit" id="submit" class="submit">등록하기</button> 
            </div>
        </div>
        
        <div class="review-info">
            <input type="text" id="search" class="book-title write" placeholder="${requestScope.bean.bookTitle}" autocomplete="off" readonly>
            <!-- <div class="autocomplete"></div> -->
            <div class="book-info">
            <p>지은이 <span>${requestScope.bean.author}</span></p>
            <p>출판사 <span>${requestScope.bean.publisher}</span></p>
        </div>
            <div class="star">
                <img src="/livre/assets/fill-star.svg">
                <img src="/livre/assets/fill-star.svg">
                <img src="/livre/assets/stroke-star.svg">
                <img src="/livre/assets/stroke-star.svg">
                <img src="/livre/assets/stroke-star.svg">
            </div>
            <div class="read-date">
                <input class="start-date write" name="startDate" readonly placeholder="${requestScope.bean.startDate}">
                ~
                <input class="end-date write" name="endDate" readonly placeholder="${requestScope.bean.endDate}">
            </div>

            <div class="genre-box">
            	<p>${requestScope.bean.genre}</p>
            </div>
        </div>

    </div>
   
    </form>
        
    </section>

   
</body>
<script src="/livre/js/review-upload.js"></script>
</html>