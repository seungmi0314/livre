
<%@page import="com.livre.model.bean.MyReview"%>
<%@page import="com.livre.model.dao.MyReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>

<%
	MyReviewDao dao = new MyReviewDao();
	MyReview bean = new MyReview();
	
	String reviewTitle = request.getParameter("reviewTitle");
	String reviewText = request.getParameter("reviewText");
	//String password = request.getParameter("raiting");
	String phrase = request.getParameter("phrase");
	String startDate = request.getParameter("startdate");
	String endDate = request.getParameter("enddate");
	
	
	bean.setReviewTitle(reviewTitle);
	bean.setReviewText(reviewText);
	bean.setPhrase(phrase);
	bean.setStartDate(startDate);		
	bean.setEndDate(endDate);
	
	out.print(bean + "<br/>"); 
	
	int cnt = -1 ;
	cnt = dao.insertData(bean);
	String message = "";
	if(cnt == 1){
		message = "인서트 성공";
	}else{
		message = "인서트 실패";
	}
	
	out.print(message + "<br/>");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript">
		$(document).ready(function(){
			
		});
	</script>
	<style type="text/css">
	
	</style>
</head>
<body>

</body>
</html>