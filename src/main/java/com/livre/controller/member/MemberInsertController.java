package com.livre.controller.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.livre.common.SuperClass;
import com.livre.model.bean.Member;
import com.livre.model.dao.MemberDao;

public class MemberInsertController extends SuperClass {
	private final String PREFIX = "member/";
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		System.out.println("회원가입 페이지로 이동합니다.");
		
		super.goToPage(PREFIX+"joinMemberShip.jsp");
	
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		MemberDao dao = new MemberDao();
		Member bean = new Member();
		
		bean.setMemberAddress(request.getParameter("memberAddress"));
		bean.setEnrollDate(request.getParameter("enrollDate"));
		bean.setGenreNo(Integer.parseInt(request.getParameter("genreNo")));
		bean.setMemberEmail(request.getParameter("memberEmail"));
		bean.setMemberNick(request.getParameter("memberNick"));
		bean.setMemberNo(Integer.parseInt(request.getParameter("MemberNo")));
		bean.setMemberPw(request.getParameter("memberPw"));
		bean.setRankNo(Integer.parseInt(request.getParameter("rankNo")));
		bean.setReivewNo(Integer.parseInt(request.getParameter("reviewNo")));
		bean.setSnsFL(request.getParameter("snsFL"));
		bean.setTermsFL(request.getParameter("termsFL"));
		
		/*
		 //적립 포인트는 데이터 베이스 기본값으로 대체하면 문제 없음.
		
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
		 
		
		
		//엑시큐트 업데이트의 반환타입이 int 라서 int로 적은것이다.
		//int cnt = dao.insertData(bean);
		
		if(cnt==1){//인서트 성공
			//로그인 컨트롤러의 doPost() 메소드를 호출하면 가입과 동시에 로그인하는 효과를 봅니다.
			//new MemberLoginController().doPost(request, response);
			
		}else{//인서트 실패
			new MemberInsertController().doGet(request, response);
		}
		*/
		
		
	}

}

