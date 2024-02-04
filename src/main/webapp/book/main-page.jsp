<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="./../css/main-page.css" />
<link rel="stylesheet" href="./../css/header.css" />
<link rel="stylesheet" href="./../css/menu.css" />
<link rel="icon" href="./../assets/favicon.png">
<title>메인 페이지</title>

</head>

<body>
	<main>
        <header>
        <div class="header">
            <img src="./../assets/logo.svg" class="h-logo">
            <p class="h-logo-name">livre</p>
        </div>

        <div class="header-right">
            <a href="#">로그인</a>
            <a href="#">회원가입</a>
        </div>
        </header>
    
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
		<div class="content-wrap">
			<div class="container">
				<div class="inner">
					<div class="box_slide">
						<img src="./../assets/livre_banner_mainpage.png" alt="" />
						<ul class="list_dot">
							<li class="item_dot"></li>
							<li class="item_dot"></li>
							<li class="item_dot"></li>
						</ul>
					</div>
					<div class="box_content">
						<div class="box_calendar">
							<h2 class="title">Book Calendar</h2>
							<div class="calendar">
								<img src="./../assets/calendar.png" alt="" />
							</div>
						</div>
						<div class="box_ranking">
							<h2 class="title">livre ‘s ranking</h2>
							<div class="box_liver_ranking">
								<ol class="list_ranking">
									<li class="item_ranking"><span class="number"><img
											src="./../assets/icon_1.svg" alt="" /></span> <strong
										class="ranking_title">오펜하이머</strong> <span class="name">파멸의
											작곡가 : 오펜하이머</span>
										<div class="box_author">
											<span class="author">밀리</span>
										</div></li>
									<li class="item_ranking"><span class="number"><img
											src="./../assets/icon_2.svg" alt="" /></span> <strong
										class="ranking_title">어서오세요, 휴남동 서점</strong> <span
										class="name">휴남동의 봄</span>
										<div class="box_author">
											<span class="author">Chhj923</span>
										</div></li>
									<li class="item_ranking"><span class="number"><img
											src="./../assets/icon_3.svg" alt="" /></span> <strong
										class="ranking_title">반지의 제왕</strong> <span class="name">프로도의
											삶은 ..</span>
										<div class="box_author">
											<span class="author">FBK33</span>
										</div></li>
									<li class="item_ranking"><span class="number"><img
											src="./../assets/icon_4.svg" alt="" /></span> <strong
										class="ranking_title">남산의 부장들</strong> <span class="name">자리와
											권력</span>
										<div class="box_author">
											<span class="author">Ghy13</span>
										</div></li>
								</ol>
							</div>
							<h2 class="title">Genre ranking</h2>
							<ul class="list_tab">
								<li class="item_tab">
									<button type="button" class="btn_tab">경제</button>
								</li>
								<li class="item_tab">
									<button type="button" class="btn_tab">건강</button>
								</li>
								<li class="item_tab">
									<button type="button" class="btn_tab">만화</button>
								</li>
								<li class="item_tab">
									<button type="button" class="btn_tab">여행</button>
								</li>
								<li class="item_tab">
									<button type="button" class="btn_tab">역사</button>
								</li>
								<li class="item_tab">
									<button type="button" class="btn_tab">희곡</button>
								</li>
								<li class="item_tab">
									<button type="button" class="btn_tab">기타</button>
								</li>
							</ul>
							<div class="box_liver_ranking">
								<ol class="list_ranking">
									<li class="item_ranking"><span class="number"><img
											src="./../assets/icon_1.svg" alt="" /></span> <strong
										class="ranking_title">오펜하이머</strong> <span class="name">파멸의
											작곡가 : 오펜하이머</span>
										<div class="box_author">
											<span class="author">밀리</span>
										</div></li>
									<li class="item_ranking"><span class="number"><img
											src="./../assets/icon_2.svg" alt="" /></span> <strong
										class="ranking_title">어서오세요, 휴남동 서점</strong> <span
										class="name">휴남동의 봄</span>
										<div class="box_author">
											<span class="author">Chhj923</span>
										</div></li>
									<li class="item_ranking"><span class="number"><img
											src="./../assets/icon_3.svg" alt="" /></span> <strong
										class="ranking_title">반지의 제왕</strong> <span class="name">프로도의
											삶은 ..</span>
										<div class="box_author">
											<span class="author">FBK33</span>
										</div></li>
									<li class="item_ranking"><span class="number"><img
											src="./../assets/icon_4.svg" alt="" /></span> <strong
										class="ranking_title">남산의 부장들</strong> <span class="name">자리와
											권력</span>
										<div class="box_author">
											<span class="author">Ghy13</span>
										</div></li>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


	</section>


</body>
</html>