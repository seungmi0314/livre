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
    <link rel="stylesheet" href="/livre/css/reivew-upload.css?after" />
    <link rel="icon" href="/livre/assets/favicon.png">
    <title>독후감 작성</title>
    
    <script src="https://kit.fontawesome.com/a54a73652a.js" crossorigin="anonymous"></script>

</head>

<body>
    


    <section>
     
     <!-- index.jsp를 복사 후 section 내부를 삭제하고 코드를 작성 해 주세요 + (index.css도 삭제) -->
     
		 
            <div class="write-box">
        <div class="left">
            

            
          
 <form action="<%=withFormTag%>" method="post" class="review">
 <input type="hidden" name="command" value="reviewInsert"> 
            <div class="review-write">
                <input class="review-title write" name="reviewTitle" placeholder="독후감 제목을 입력해주세요">

                <textarea class="review-content write" name="reviewText">독후감 내용을 입력해주세요</textarea>

                <p class="remember-text">기억하고싶은 구절</p>
                <textarea class="remember write" name="phrase"></textarea>
                
            </div>


            <div class="submit-btn">
                <button type="submit" id="submit" class="submit" onclick="return;">등록하기</button> 
            </div>
        </div>
        
        <div class="review-info">
            <input type="text" id="search" class="book-title write" placeholder="책 제목" autocomplete="off">
            <div class="autocomplete"></div>
            <div class="book-info">
            <p>지은이 <span>${requestScope.bean.author}</span></p>
            <p>출판사 <span>${requestScope.bean.publisher}</span></p>
        </div>
        
            
            	 <div id="star" class="star">
                            <input type="radio" name="reviewStar" value="1" id="rate1"><label
								for="rate1"><i class="fa-solid fa-star"></i></label>
							<input type="radio" name="reviewStar" value="2" id="rate2"><label
								for="rate2"><i class="fa-solid fa-star"></i></label>
							<input type="radio" name="reviewStar" value="3" id="rate3"><label
								for="rate3"><i class="fa-solid fa-star"></i></label>
							<input type="radio" name="reviewStar" value="4" id="rate4"><label
								for="rate4"><i class="fa-solid fa-star"></i></label>
							<input type="radio" name="reviewStar" value="5" id="rate5"><label
								for="rate5"><i class="fa-solid fa-star"></i></label>
                        </div>
            
            
            <div class="read-date">
                <input class="start-date write" name="startDate" placeholder="시작날짜">
                ~
                <input class="end-date write" name="endDate" placeholder="끝난날짜">
            </div>

            <div class="genre-box">
            
                <input type="checkbox" id="genre01" value="1">
                <label for="genre01">경영/경제</label>

                <input type="checkbox" id="genre02" value="2">
                <label for="genre02">건강/취미</label>

                <input type="checkbox" id="genre03" value="3">
                <label for="genre03">어린이</label>

                <input type="checkbox" id="genre04" value="4">
                <label for="genre04">역사</label>

                <input type="checkbox" id="genre05" value="5">
                <label for="genre05">여행</label>

                <input type="checkbox" id="genre06" value="6">
                <label for="genre06">과학</label>

                <input type="checkbox" id="genre07" value="7">
                <label for="genre07">만화</label>

                <input type="checkbox" id="genre08" value="8">
                <label for="genre08">사회</label>

                <input type="checkbox" id="genre09" value="9">
                <label for="genre09">소설/시/희곡</label>

                <input type="checkbox" id="genre10" value="10">
                <label for="genre10">예술/대중문화</label>

                <input type="checkbox" id="genre11" value="11">
                <label for="genre11">요리/살림</label>

                <input type="checkbox" id="genre12" value="12">
                <label for="genre12">인문학</label>

                <input type="checkbox" id="genre13" value="13">
                <label for="genre13">자기계발</label>

                <input type="checkbox" id="genre14" value="14">
                <label for="genre14">종교/역학</label>

                <input type="checkbox" id="genre15" value="15">
                <label for="genre15">청소년</label>

                <input type="checkbox" id="genre16" value="16">
                <label for="genre16">컴퓨터/모바일</label>

                <input type="checkbox" id="genre17" value="17">
                <label for="genre17">가정/원예/인테리어</label>

                <input type="checkbox" id="genre18" value="18">
                <label for="genre18">스포츠</label>

            </div>
        </div>

    </div>
   
    </form>
        
    </section>

   
</body>
<script src="/livre/js/review-upload.js"></script>

</html>