<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./../css/celebrateStyle.css">
<link rel="stylesheet" href="./../css/index.css" />
<link rel="stylesheet" href="./../css/header.css" />
<title>Insert title here</title>
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
				<a href="#">로그인</a> <a href="#">회원가입</a>
			</div>
		</header>
	</main>
	<section>
	<img id="ta-da" src="./../assets/124de3d1b5e12f1d8fcec1685e634361.gif">
		<div id="celebrateMention">
			<span>
				축하합니다! 
				<br/> 
				<span id="livrelogo"><img id="livreIcon" src="./../assets/logo.svg" width="30px" height="30px">livre</span>&nbsp;에서 함께 생각을 나눠봐요!
			</span>	
		</div>
		</tr>
		<div id="buttonDiv">

			<button type="button" id="nextButton" onclick="moveToNextPage()">홈으로</button>
		</div>
		</p>
		</div>
	</section>

</body>
<script>
    // 다음 페이지로 이동하는 함수
    function moveToNextPage() {
        // 메인 페이지의 절대 경로 설정
        var mainPageURL = "/Mylivre/index.jsp"; // 수정 필요

        // 메인 페이지로 이동
        window.location.href = mainPageURL;
    }
</script>
</html>