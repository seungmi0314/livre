<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ include file="../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>livre</title>
	<link rel="stylesheet" href="/livre/css/header.css">
	<link rel="stylesheet" href="/livre/css/menu.css">
	<link rel="stylesheet" href="/livre/css/searchingBook.css">
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
				<li class="menu-item"><a href="#">홈</a></li>
				<li class="menu-item active"><a href="#">독후감 검색</a></li>
				<li class="menu-item"><a href="#">내 독후감</a></li>
				<li class="menu-item"><a href="#">마이 페이지</a></li>
				<li class="menu-item"><a href="#">이용약관</a></li>
				<li class="menu-item"><a href="#">contact us</a></li>
			</ul>
		</div>
	</main>

	<section>
	
		<!-- 검색창 -->
		<form action="<%=withFormTag%>" method="get">
		<input type="hidden" name="command" value="searchedBooks">
			<div class="d-flex bd-highlight search-box-p">
				<div class="p-2 flex-fill bd-highlight searchbox-btn">
					<input class="search-box" type="text" id="keyword" name="keyword" placeholder="검색어를 입력해 주세요.">
				</div>
				<div class="p-2 flex-shrink-1 bd-highlight">
					<button class="search-btn" type="submit">
						<img src="/livre/assets/search.svg" class="search-btn-default">
						<img src="/livre/assets/red-search.svg" class="search-btn-red">
					</button>
				</div>
			</div>
		
			<!-- 장르별 선택 -->
			<div class="select-genre-div">
	            <select class="select-genre" id="mode" name="mode">
	           		<option value="all">전체 검색</option>
	            	<optgroup label="장르 검색">
		            	<option value="1">경영/경제</option>
		            	<option value="2">건강/취미</option>
		            	<option value="3">어린이</option>
		            	<option value="4">역사</option>
		            	<option value="5">여행</option>
		            	<option value="6">과학</option>
		            	<option value="7">만화</option>
		            	<option value="8">정치/사회</option>
		            	<option value="9">소설/시/희곡</option>
		            	<option value="10">예술/대중문화</option>
		            	<option value="11">요리/살림</option>
		            	<option value="12">인문학</option>
		            	<option value="13">자기계발</option>
		            	<option value="14">종교/역학</option>
		            	<option value="15">청소년</option>
		            	<option value="16">컴퓨터/모바일</option>
		            	<option value="17">가정/원예/인테리어</option>
		            	<option value="18">스포츠</option>
	            	</optgroup>
	            </select>
	        </div>
		
		</form>
		<!-- 랜덤으로 나와있는 책 (반복문으로) -->
		<div class="result-all">
		
			<c:forEach var="aa" begin="1" end="100" step="1">
				<div class="result-card">
					<a href="/livre/book/bookDetail.jsp">
					<span>
						<img class="book-img" src="/livre/assets/bookimage.svg">
					</span>
					</a>
					<p class="book-title">책 제목책 제목책 제목</p>
					<p>작가이름 | 출판사</p>
				</div>
			</c:forEach>
			
		</div>
		
		 
	</section>



</body>
</html>