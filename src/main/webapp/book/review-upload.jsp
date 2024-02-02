<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./../css/reivew-upload.css" />
    <link rel="stylesheet" href="./../css/header.css" />
    <link rel="stylesheet" href="./../css/menu.css" />
    <link rel="icon" href="./../assets/favicon.png">
    <title>독후감 작성</title>
    
    <script src="https://kit.fontawesome.com/a54a73652a.js" crossorigin="anonymous"></script>
  
</head>

<body>
    

    <main>
        <header>
        <!-- 헤더 입니다 -->
        <div class="header">
            <img src="./../assets/logo.svg" class="h-logo">
            <p class="h-logo-name">livre</p>
        </div>

        <div class="header-right">
            <a href="#">로그인</a>
            <a href="#">회원가입</a>
        </div>
        </header>

    <!--  
    
    메뉴 바 사용하는 사람들만 주석 풀어서 사용 해 주세요
    사용하지 않는 페이지는 삭제하고 쓰기 (+css)-->
    
    
    <div class="menu-bar">
              <ul class="menu">
                <li class="menu-item"><a>홈</a></li>
                <li class="menu-item active"><a>독후감 검색</a></li>
                <li class="menu-item"><a>내 독후감</a></li>
                <li class="menu-item"><a>마이 페이지</a></li>
                <li class="menu-item"><a>이용약관</a></li>
                <li class="menu-item"><a>contact us</a></li>
              </ul>
        </div>    
    </main>

    <section>
     
     <!-- index.jsp를 복사 후 section 내부를 삭제하고 코드를 작성 해 주세요 + (index.css도 삭제) -->
     
		  <form class="review">
            <div class="write-box">
        <div class="left">
            

            
            <div class="button-box">
                <button class="edit"><i class="fa-solid fa-pen-to-square"></i> 수정하기</button>
                <button class="del"><i class="fa-regular fa-trash-can"></i> 삭제하기</button>
            </div>

            <div class="review-write">
                <input class="review-title" placeholder="독후감 제목을 입력해주세요">

                <textarea class="review-content" >내용을 입력해주세요
                </textarea>

                <p class="remember-text">기억하고싶은 구절</p>
                <textarea class="remember">
                    
                </textarea>
            </div>


            <div class="submit-btn">
                <button type="submit" class="submit">등록하기</button> 
            </div>
        </div>
        
        <div class="review-info">
            <input type="text" class="book-title" placeholder="책 제목">
            
            <div class="book-info">
            <p>지은이</p>
            <p>출판사</p>
        </div>
            <div class="star">
                <img src="./../assets/fill-star.svg">
                <img src="./../assets/fill-star.svg">
                <img src="./../assets/stroke-star.svg">
                <img src="./../assets/stroke-star.svg">
                <img src="./../assets/stroke-star.svg">
            </div>
            <div class="read-date">
                <input class="start-date" placeholder="시작일자 (yy/mm/dd)">
                ~
                <input class="end-date" placeholder="끝일자 (yy/mm/dd)">
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
</html>