<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./common/common.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
 
    
    
    <link rel="stylesheet" href="/livre/css/index.css" />
    <link rel="stylesheet" href="/livre/css/header.css" />
    <!-- <link rel="stylesheet" href="./../css/menu.css" /> -->
    <link rel="icon" href="/livre/assets/favicon.png">
    <title>랜딩 페이지</title>
  
</head>

<body>
    

    <main>
       
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
                <img src="/livre/assets/logo.svg" class="logo">
                <p class="logo-name">livre</p>
            </div>
            <p class="ment">함께 읽으면 더 멋진 책이 될지도 몰라요!</p>

            <!-- 메인페이지로 이동 -->
            <a href="/livre/Livre?command=my-review"class="btn-start">
                책 펼치기
            </a>
        </div>
        
    </section>

   
</body>
</html>