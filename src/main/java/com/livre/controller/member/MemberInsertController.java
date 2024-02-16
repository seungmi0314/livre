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
		
		System.out.println("약관동의 페이지로 이동합니다.");
		
		super.goToPage(PREFIX+"agreement.jsp");
	
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		MemberDao dao = new MemberDao();
		Member bean = new Member();
		
		//bean.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
		bean.setMemberEmail(request.getParameter("memberEmail"));
		bean.setMemberPw(request.getParameter("memberPw"));
		bean.setMemberNick(request.getParameter("memberNick"));
		bean.setTerm_FL(request.getParameter("term_FL"));
		//bean.setEnrollDate(request.getParameter("enrollDate"));
		//bean.setSnsFL(request.getParameter("snsFL"));
		//bean.setMemberImg(request.getParameter("memberImg"));
		//bean.setMemberAddress(request.getParameter("memberAddress"));
		bean.setGender(request.getParameter("gender"));
		
		//bean.setGenreNo(Integer.parseInt(request.getParameter("genreNo")));
		//bean.setRankNo(Integer.parseInt(request.getParameter("rankNo")));
		
		
		 //적립 포인트는 데이터 베이스 기본값으로 대체하면 문제 없음.
		
		/*
		//for checkbox control
		String preferGenre="";
		String[] preferGenre = request.getParameterValues("genreNo");
		if(preferGenres == null){
			genre = null;//디비에 null값으로 채우기
		}else{
			for(int i=0; i<preferGenres.length; i++){
				genre += preferGenres[i] + "/";
			}
		}
		bean.setHobby(genre);  
		 */
			
		
		//엑시큐트 업데이트의 반환타입이 int 라서 int로 적은것이다.
		int cnt = dao.insertData(bean);
		
		if(cnt==1){//인서트 성공
			//로그인 컨트롤러의 doPost() 메소드를 호출하면 가입과 동시에 로그인하는 효과를 봅니다.
			//new MemberLoginController().doPost(request, response);
			super.goToPage(PREFIX + "celebrate.jsp");
			
		}else{//인서트 실패
			new MemberInsertController().doGet(request, response);
		}
	
		
		
	}

}

