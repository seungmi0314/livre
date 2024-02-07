<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/livre/css/contactus.css" />
<link rel="stylesheet" href="/livre/css/header.css" />
<link rel="stylesheet" href="/livre/css/header.css" />

<title>Contact Us</title>

</head>

<body>
	<main>
		<header>
			<!-- 헤더 입니다 -->
			<div class="header">
				<img src="/livre/assets/logo.svg" class="h-logo">
				<p class="h-logo-name">livre</p>
			</div>

			<div class="header-right">
				<a href="#">로그인</a> <a href="#">회원가입</a>
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
		<div class="contact-us">

			<!-- Contact Us 영역 -->
			<div class="left">
				<p class="title">Contact Us</p>

				<div class="inner-form">
					<form action="#">

						<div class="name">
							<p>성함</p>
							<input type="text" placeholder="성함을 입력해 주세요">
						</div>

						<div class="email">
							<p>이메일 주소</p>
							<input type="email" placeholder="메일주소를 입력해 주세요">
						</div>

						<div class="ask">
							<label for="ask-category">
								<p>문의 유형</p>
							</label>

							<!--어디다가 전송?-->
							<!-- size -->
							<select class="category" name="category" id="category">
								<option value="null">선택하세요</option>
								<option value="account">계정 문의</option>
								<option value="post">게시물 관리</option>
								<option value="book-info">도서정보 관리</option>
								<option value="suggest">건의사항</option>
								<option value="ad">광고 문의</option>
								<option value="etc">기타</option>
							</select>
						</div>

						<div class="detail">
							<p>문의 내용</p>
							<input type="text" placeholder="내용을 입력해주세요">
						</div>
					</form>
				</div>

				<button type="submit">제출하기</button>
			</div>


			<!-- Info 영역 -->
			<div class="right">

				<div class="info">

					<div class="info-title">
						<p>Info</p>
					</div>

					<div class="info-detail">
						<div class="email">
							<p>
								<img src="/livre/assets/email.svg">&nbsp livre@gmail.com
							</p>
						</div>

						<div class="phone">
							<p>
								<img src="/livre/assets/phone.svg">&nbsp +82 10 1234 5678
							</p>
						</div>

						<div class="address">
							<p>
								<img src="/livre/assets/address.svg">&nbsp 서울특별시 마포구 백범로 23
							</p>
						</div>

						<div class="time">
							<p>
								<img src="/livre/assets/time.svg">&nbsp 10:00 ~ 18:00
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>