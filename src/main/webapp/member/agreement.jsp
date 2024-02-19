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

<link rel="stylesheet" type="text/css" href="/livre/css/agreementStyle.css">
<link rel="stylesheet" href="/livre/css/index.css" />
<link rel="stylesheet" href="/livre/css/header.css" />
<script>
function updateMarketingValue() {
    var marketingAgreeCheckbox = document.getElementById('marketingAgreeCheckbox');
    var valueInput = document.getElementById('marketingAgreeInput');

    valueInput.value = marketingAgreeCheckbox.checked ? 'Y' : 'N';
}
 function checkIndividual() {
    var allCheckbox = document.getElementById('allCheckbox');
    var useAgreeCheckbox = document.getElementById('useAgreeCheckbox');
    var infoAgreeCheckbox = document.getElementById('infoAgreeCheckbox');
    var marketingAgreeCheckbox = document.getElementById('marketingAgreeCheckbox');
    var term_FL_input = document.getElementById('term_FL_input');

    // 모든 필수 약관이 동의되어 있는 상태에서 하나라도 해제될 경우
    if (!useAgreeCheckbox.checked || !infoAgreeCheckbox.checked || !marketingAgreeCheckbox.checked) {
        allCheckbox.checked = false; // 모두 동의 체크박스도 해제
    } else {
        // 모든 필수 약관이 동의되어 있는 경우
        allCheckbox.checked = true; // 모두 동의 체크박스도 체크
    }

    // 변경된 내용에 따라 폼 제출 함수 호출
    submitForm();
}


// 다음 페이지로 체크 확인 함수
function moveToNextPage() {
    var useAgreeChecked = document.getElementById('useAgreeCheckbox').checked;
    var infoAgreeChecked = document.getElementById('infoAgreeCheckbox').checked;
    var marketingAgreeChecked = document.getElementById('marketingAgreeCheckbox').checked;

    if (!useAgreeChecked || !infoAgreeChecked) {
        alert('이용 약관 및 개인정보 수집 및 이용 동의에 모두 동의해주세요.');
        return false; // 폼 제출 방지
    }

    return true; // 폼 제출 허용
}

// 전체 동의 체크박스 클릭 시 모든 필수 약관에 체크를 동기화하는 함수
// 전체 동의 체크박스 클릭 시 모든 필수 약관에 체크를 동기화하는 함수

    // 마케팅 수신 동의 체크박스 상태에 따라 값 변경
    function updateMarketingValue() {
        var marketingAgreeCheckbox = document.getElementById('marketingAgreeCheckbox');
        var valueInput = document.getElementById('marketingAgreeInput');

        valueInput.value = marketingAgreeCheckbox.checked ? 'Y' : 'N';
    }

    // 전체 동의 체크박스 클릭 시 모든 필수 약관에 체크를 동기화하는 함수
    function checkAll() {
        var allCheckbox = document.getElementById('allCheckbox');
        var useAgreeCheckbox = document.getElementById('useAgreeCheckbox');
        var infoAgreeCheckbox = document.getElementById('infoAgreeCheckbox');
        var marketingAgreeCheckbox = document.getElementById('marketingAgreeCheckbox');
        var marketingAgreeCheckbox = document.getElementById('marketingAgreeCheckbox');
        var valueInput = document.getElementById('marketingAgreeInput');

        // 전체 동의 체크박스가 체크되었는지 확인
        if (allCheckbox.checked) {
            // 전체 동의 체크박스가 체크된 경우 모든 필수 약관에 체크를 동기화
            useAgreeCheckbox.checked = true;
            infoAgreeCheckbox.checked = true;
            marketingAgreeCheckbox.checked = true;
        } else {
            // 전체 동의 체크박스가 체크 해제된 경우 모든 필수 약관에 체크를 해제
            useAgreeCheckbox.checked = false;
            infoAgreeCheckbox.checked = false;
            marketingAgreeCheckbox.checked = false;
        }

        // 모든 필수 동의 체크박스의 상태가 변경된 후에 마케팅 수신 동의 값 업데이트
        updateMarketingValue();
    }

//개별 동의 체크박스가 변경될 때 모두 동의 체크박스 상태를 확인하고 변경하는 함수
function checkIndividual() {
    var allCheckbox = document.getElementById('allCheckbox');
    var useAgreeCheckbox = document.getElementById('useAgreeCheckbox');
    var infoAgreeCheckbox = document.getElementById('infoAgreeCheckbox');
    var marketingAgreeCheckbox = document.getElementById('marketingAgreeCheckbox');

    // 모든 필수 약관이 동의되어 있는 상태에서 하나라도 해제될 경우
    if (!useAgreeCheckbox.checked || !infoAgreeCheckbox.checked || !marketingAgreeCheckbox.checked) {
        allCheckbox.checked = false; // 모두 동의 체크박스도 해제
    } else {
        // 모든 필수 약관이 동의되어 있는 경우
        allCheckbox.checked = true; // 모두 동의 체크박스도 체크
    }

    // 변경된 내용에 따라 폼 제출 함수 호출
    submitForm();
}



 
</script>

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
    </main>

    <section>
        <!-- 상단 문구 -->
        <div id="agreeMention">
            약관을 읽고 동의해주세요 <br /> 이건 중요한 일이니까요. <br />
        </div>

        <!-- 약관동의 테이블 -->
        <form name="agreementForm" method="post" action="<%=withFormTag%>" onsubmit="return moveToNextPage();">
            <input type="hidden" id="term_FL_input" name="command" value="joinMemberShip">
            <input type="hidden" id="marketingAgreeInput" name="term_FL" value="N"> <!-- 초기값 'N' 설정 -->
        
            <div id="mainDiv">
                <div id="titleDiv">
                    <span id="agreeTitle">약관 동의</span>
                    <hr>
                    <span id="agreeTitleMention">회원가입 약관에 모두 동의합니다.</span>
                    <input type="checkbox" id="allCheckbox" onclick="checkAll()" name="term_FL">
                    <hr>
                </div>

                <div id="useAgreeDiv">
                    <span id="useAgree">이용 약관 동의</span>&nbsp;<span id="agreeEssential">(필수)</span>
                    <input type="checkbox" id="useAgreeCheckbox" onclick="checkIndividual()" name="useAgree" value="useAgree">
                </div>
                <div id="innerDiv01">
                    <span id="usingExplain"> 이 약관은 ○○회사가 운영하는 ○○ 사이트(이하 "사이트"라
                        한다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 사이트와 이용자의 권리와 의무 및
                        책임사항을 규정함을 목적으로 합니다. </span>
                </div>
                <br />

                <div id="infoAgreeDiv">
                    <span id="privateAgree">개인정보 수집 및 이용 동의</span>&nbsp;<span
                        id="infoEssential">(필수)</span> <input type="checkbox"
                        id="infoAgreeCheckbox" onclick="checkIndividual()" name="" value="Individual">
                </div>
                <div id="innerDiv02">
                    <span id="infoAgreeExplain"> 이 약관은 ○○회사가 운영하는 ○○ 사이트(이하
                        "사이트"라 한다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 사이트와 이용자의 권리와
                        의무 및 책임사항을 규정함을 목적으로 합니다. </span>
                </div>
                <br />
                <div id="marketingAgreeDiv">
                    <span id="marketingAgree">마케팅 수신 동의</span>&nbsp;<span
                        id="marketingChoice">(선택)</span> <input type="checkbox" id="marketingAgreeCheckbox" onchange="updateMarketingValue()" name="marketingAgree" value="N">

                </div>
                <div id="innerDiv03">
                    <span id="marketingExplain"> 이 약관은 ○○회사가 운영하는 ○○ 사이트(이하
                        "사이트"라 한다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 사이트와 이용자의 권리와
                        의무 및 책임사항을 규정함을 목적으로 합니다. </span>
                </div>
                <div id="buttonDiv">
                    <button id="nextButton" type="submit">다음</button>
                </div>
            </div>
            
        </form>
    </section>
</body>
</html>
