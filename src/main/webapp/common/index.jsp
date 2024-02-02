<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
 
    
    
    <link rel="stylesheet" href="./../css/index.css" />
    <link rel="stylesheet" href="./../css/header.css" />
    <!-- <link rel="stylesheet" href="./../css/menu.css" /> -->
    <link rel="icon" href="./../assets/favicon.png">
    <title>랜딩 페이지</title>
  
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
    사용하지 않는 페이지는 삭제하고 쓰기 (+css)
    
    
    <div class="menu-bar">
              <ul class="menu">
                <li class="menu-item"><a>홈</a></li>
                <li class="menu-item active"><a>독후감 검색</a></li>
                <li class="menu-item"><a>내 독후감</a></li>
                <li class="menu-item"><a>마이 페이지</a></li>
                <li class="menu-item"><a>이용약관</a></li>
                <li class="menu-item"><a>contact us</a></li>
              </ul>
        </div>   --> 
    </main>

    <section>
     
     <!-- index.jsp를 복사 후 section 내부를 삭제하고 코드를 작성 해 주세요 + (index.css도 삭제) 
     	
     		*** css 맨 상단에 입력 해 주세요 ***
     		
     		section {
     			width: 100vw;
     			height: 100vh; 
     		}
     		
     		
     		입력 해 주세요
     -->
     
       <div class="title-box">
            <div class="title">
                <img src="./../assets/logo.svg" class="logo">
                <p class="logo-name">livre</p>
            </div>
            <p class="ment">함께 읽으면 더 멋진 책이 될지도 몰라요!</p>

            <!-- 메인페이지로 이동 -->
            <a href="#"class="btn-start">
                책 펼치기
            </a>
        </div>
        
    </section>

   
</body>
</html>