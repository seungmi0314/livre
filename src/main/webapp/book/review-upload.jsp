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
    <title>랜딩 페이지</title>
    
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
     
		<div class="left">
            <div class="button-box">
                <button class="edit"><i class="fa-solid fa-pen-to-square"></i> 수정하기</button>
                <button class="del"><i class="fa-regular fa-trash-can"></i> 삭제하기</button>
            </div>

            <div class="review-write">

            </div>

        </div>
        
        <div class="review-info">

        </div>

       <!-- <button type="submit">등록하기</button> -->
    </form>
        
        
    </section>

   
</body>
</html>