<%@page import="com.livre.model.bean.MyReview"%>
<%@page import="com.livre.model.dao.MyReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/common2.jsp"%>

<%
	MyReviewDao dao = new MyReviewDao();
	MyReview bean = new MyReview();
	
	//int reviewNo = Integer.parseInt(request.getParameter("reviewNo")) ;
	//int bookNo = Integer.parseInt(request.getParameter("bookNo"));
	//String bookTitle = request.getParameter("bookTitle");
	//int genreNo = Integer.parseInt(request.getParameter("genreNo"));
	String reviewTitle = request.getParameter("reviewTitle");
	String reviewText = request.getParameter("reviewText");
	//String author = request.getParameter("author");
	//String publisher = request.getParameter("publisher");
	//int raiting =Integer.parseInt(request.getParameter("rating"));
	String createDate = request.getParameter("createDate");
	String phrase = request.getParameter("phrase");
	String startDate = request.getParameter("startDate");
	String endDate = request.getParameter("endDate");
	
	//bean.setReviewNo(reviewNo) ;
	//bean.setBookNo(bookNo);
	//bean.setBookTitle(bookTitle);
//	bean.setGenreNo(genreNo);
	bean.setReviewTitle(reviewTitle);		
	bean.setReviewText(reviewText);		
	//bean.setAuthor(author);		
	//bean.setPublisher(publisher);		
	//bean.setRaiting(raiting);		
	bean.setCreateDate(createDate);		
	bean.setPhrase(phrase);		
	bean.setStartDate(startDate);		
	bean.setEndDate(endDate);	
	
	out.print(bean + "<br/>"); 
	
	int cnt = -1 ;
	cnt = dao.updateData(bean);
	
	out.print("cnt : " + cnt + "<br/>");
	
	String message = "";
	if(cnt == 1){
		message = "수정 성공";
	}else{
		message = "수정 실패";
	}
	
	out.print(message + "<br/>");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>