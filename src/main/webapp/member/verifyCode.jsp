<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>인증코드 확인</title>
    <link rel="stylesheet" href="/livre/css/verifyCode.css">
</head>
<body>
    <main>
        <header>
            <!-- 헤더 입니다 -->
            <div class="header">
                <img src="/livre/assets/logo.svg" class="h-logo">
                <p class="h-logo-name">livre</p>
            </div>
        </header>
    </main>

    <section>
        <form name="verifyCodeForm" method="post" action="<%=withFormTag%>">
            <input type="hidden" name="command" value="verifyCode">

            <div class="container mt-3">
                <span id="banner"><b>인증코드 확인</b></span><br /><br /><br /><br />

                <!-- 인증코드 입력 -->
                <div class="mb-3 mt-3">
                    <label for="verificationCode" class="form-label">인증코드</label>
                    <input id="verificationCode" type="text" class="form-control" name="verificationCode" placeholder="인증코드" required>
                </div>

                <!-- 인증코드 확인 버튼 -->
                <button id="verifyCodeButton" type="submit" class="btn btn-primary">인증코드 확인</button>
                <br /><br />
            </div>
        </form>
    </section>
</body>
</html>
