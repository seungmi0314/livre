<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="/livre/js/agreementScript.js"></script>
<link rel="stylesheet" type="text/css" href="/livre/css/agreementStyle.css">
<link rel="stylesheet" href="/livre/css/index.css" />
<link rel="stylesheet" href="/livre/css/header.css" />
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


		<!-- 상단 문구 -->
		<div id="agreeMention">
			약관을 읽고 동의해주세요 <br /> 이건 중요한 일이니까요. <br />
		</div>

		<!-- 약관동의 테이블 -->
		<form>
			<div id="mainDiv">
				<div id="titleDiv">
					<tr>
						<span id="agreeTitle">약관 동의</span>
						<hr>
						<span id="agreeTitleMention">회원가입 약관에 모두 동의합니다.</span>
						<input type="checkbox" id="allCheckbox" onclick="checkAll()">
						<hr>
					</tr>
				</div>


				<div id="useAgreeDiv">
					<span id="useAgree">이용 약관 동의</span>&nbsp;<span id="agreeEssential">(필수)</span>
					<input type="checkbox" id="useAgreeCheckbox">
				</div>
				<div id="innerDiv01">
					<span id="usingExplain"> 이 약관은 ○○회사가 운영하는 ○○ 사이트(이하 "사이트"라
						한다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 사이트와 이용자의 권리와 의무 및
						책임사항을 규정함을 목적으로 합니다. </span>
				</div>
				<br />


				</tr>
				<tr>
					<div id="infoAgreeDiv">
						<span id="privateAgree">개인정보 수집 및 이용 동의</span>&nbsp;<span
							id="infoEssential">(필수)</span> <input type="checkbox"
							id="infoAgreeCheckbox">
					</div>
					<div id="innerDiv02">
						<span id="infoAgreeExplain"> 이 약관은 ○○회사가 운영하는 ○○ 사이트(이하
							"사이트"라 한다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 사이트와 이용자의 권리와
							의무 및 책임사항을 규정함을 목적으로 합니다. </span>
					</div>
					<br />
				</tr>
				<tr>
					<div id="marketingAgreeDiv">
						<span id="marketingAgree">마케팅 수신 동의</span>&nbsp;<span
							id="marketingChoice">(선택)</span> <input type="checkbox"
							id="marketingAgreeCheckbox">
					</div>
					<div id="innerDiv03">
						<span id="marketingExplain"> 이 약관은 ○○회사가 운영하는 ○○ 사이트(이하
							"사이트"라 한다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 사이트와 이용자의 권리와
							의무 및 책임사항을 규정함을 목적으로 합니다. </span>
					</div>
				</tr>
				<div id="buttonDiv">

					<button type="button" id="nextButton" onclick="moveToNextPage()">다음</button>
				</div>
			</div>
		</form>
	</section>

</body>
</html>