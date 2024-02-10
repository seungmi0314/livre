<%@page import="com.livre.model.bean.Member"%>
<%@page import="com.livre.model.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>

<%
	MemberDao dao = new MemberDao();
	Member bean = new Member();
	
	bean.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
	bean.setMemberEmail(request.getParameter("memberEmail"));
	bean.setMemberPw(request.getParameter("memberPw"));
	bean.setMemberNick(request.getParameter("memberNick"));
	bean.setTermsFL(request.getParameter("termsFL"));
	bean.setEnrollDate(request.getParameter("enrollDate"));
	bean.setSnsFL(request.getParameter("snsFL"));
	bean.setMemberImg(request.getParameter("memberImg"));
	bean.setMemberAddress(request.getParameter("memberAddress"));
	bean.setMemberGender(request.getParameter("memberGender"));
	bean.setGenreNo(Integer.parseInt(request.getParameter("genreNo")));
	bean.setReivewNo(Integer.parseInt(request.getParameter("reivewNo")));
	bean.setRankNo(Integer.parseInt(request.getParameter("rankNo")));
	
	/*
	//for checkbox control
	String hobby="";
	String[] hobbies = request.getParameterValues("hobby");
	if(hobbies == null){
		hobby = null;//디비에 null값으로 채우기
	}else{
		for(int i=0; i<hobbies.length; i++){
			hobby += hobbies[i] + "/";
		}
	}
	bean.setHobby(hobby); 
	*/
	out.print(bean+"<br/>");
	
	//엑시큐트 업데이트의 반환타입이 int 라서 int로 적은것이다.
	int cnt = dao.insertData(bean);
	
	String message="";
	if(cnt==1){
		message = "인서트 성공";
	}else{
		message = "인서트 실패";
	}
	out.print(message+"<br/>");
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