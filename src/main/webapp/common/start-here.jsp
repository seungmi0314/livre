<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
 
    
    
    <link rel="stylesheet" href="./../css/header.css" />
    <link rel="stylesheet" href="./../css/menu.css" />
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
            <a href="<%=notWithFormTag%>login">로그인</a>
            <a href="<%=notWithFormTag%>joinMemberShip">회원가입</a>
        </div>
        </header>



		<div class="menu-bar">
			<ul class="menu">
				<li class="menu-item"><a href="<%=notWithFormTag%>">홈</a></li>
				<li class="menu-item active"><a href="<%=notWithFormTag%>searchingBook">독후감 검색</a></li>
				<li class="menu-item"><a href="<%=notWithFormTag%>">내 독후감</a></li>
				<li class="menu-item"><a href="<%=notWithFormTag%>">마이 페이지</a></li>
				<li class="menu-item"><a href="<%=notWithFormTag%>">이용약관</a></li>
				<li class="menu-item"><a href="<%=notWithFormTag%>">contact us</a></li>
			</ul>
		</div>
	</main>

    <section>

        
    </section>

   
</body>
</html>