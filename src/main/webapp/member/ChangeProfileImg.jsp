<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>

<%-- jstl tag library section --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- whologin 변수는 현재 로그인의 상태를 알려주는 변수 입니다. --%>
<%-- 미로그인(0), 일반 사용자(1), 관리자(2) --%>
<c:set var="whologin" value="0" />

<%-- 이메일이 'admin' 이면 '관리자' 입니다.--%>
<%-- logInfo 속성을 사용하여 현재 로그인 상태를 확인할 수 있습니다. --%>
<c:if test="${not empty sessionScope.logInfo}">
	<c:if test="${sessionScope.logInfo.memberEmail =='admin'}">
		<c:set var="whologin" value="2" />
	</c:if>
	<c:if test="${sessionScope.logInfo.memberEmail !='admin'}">
		<c:set var="whologin" value="1" />
	</c:if>
</c:if>

<%
String appName = request.getContextPath();
String mappingName = "/Livre"; // in FrontController.java file

String withFormTag = appName + mappingName;
String notWithFormTag = withFormTag + "?command=";
// out.print("컨텍스트 이름 : " + appName + "<br/>");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 사진 변경</title>
<!-- 파비콘  -->
<link rel="icon" href="/livre/assets/favicon.png">
<!-- jQuery section -->
<!-- Bootstrap 은 JQuery 를 기반으로 구동이 되므로 반드시 JQuery 선언이 먼저 되어야 합니다. -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<!-- bootstrap section -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
	
<style type="text/css">
/* box model에 대한 공부가 필요합니다. */
.submitbtn {
    margin-top: 10px;
    margin-left: 600px;
}
.resetbtn {
	margin-top: 10px;
	margin-left: 5px;
}

</style>

<script type="text/javascript">
  		$(document).ready(function(){ 
  	  		
  		});
  		
  		function validCheck(){
  			
  			var memberImg = $('#memberImg').val();
  			if(memberImg == ''){
  				alert('이미지는 필수 사항입니다.');
  				return false ;
  			}
  			
  			var isCheck = false ; /* 확장자 체크에 충족하면 true가 됩니다. */
  			const imgCheck = ['.png', '.jpg'] ; /* 확장자 체크용 배열 */
  			for(var i=0 ; i < imgCheck.length ; i++){
  				if(memberImg.endsWith(imgCheck[i])){
  					isCheck = true ;
  					break ;
  				}	
  			}
  			
  			if(isCheck == false){
  				alert('이미지의 확장자는 png 또는 jpg 형식이어야 합니다.');
  				return false ;
  			}
  		}
  	</script>

</head>
<body>
	<form action="<%=withFormTag%>" method="post" enctype="multipart/form-data">
		<input type="hidden" name="command" value="ImgUpdate">
		<input type="hidden" id="test" name="test" value="${bean.memberNo}">
		<input type="text" id="memberNo" name="memberNo" value="${bean.memberNo}">
		<div class="input-group">
			<span class="input-group-text">프로필 사진</span> 
			<input class="form-control" type="file" id="memberImg" name="memberImg" value="${bean.memberImg}">
			<input type="hidden" name="deletememberImg" value="${bean.memberImg}">
		</div>
		<div id="buttonset">
			<button type="submit" onclick="return validCheck();">수정</button>
							&nbsp;&nbsp;&nbsp;
			<button type="reset">초기화</button>
		</div>
	</form>
</body>
</html>