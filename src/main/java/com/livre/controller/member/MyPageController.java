package com.livre.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.livre.common.SuperClass;
import com.livre.model.bean.Member;
import com.livre.model.dao.MemberDao;

public class MyPageController extends SuperClass {
	private final String PREFIX = "member/";

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);

		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		MemberDao dao = new MemberDao();
		Member bean = dao.getDataBean(memberNo);

		request.setAttribute("bean", bean);
		super.goToPage(PREFIX + "my-page.jsp");
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doPost(request, response);
		
		MemberDao dao = new MemberDao(); 
		Member bean = new Member();
		  
		bean.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
		bean.setMemberNick(request.getParameter("memberNick"));
		//bean.setTerm_FL(request.getParameter("term_FL"));
		//bean.setEnrollDate(request.getParameter("enrollDate"));
		//bean.setSns_FL(request.getParameter("snsFL"));
		//bean.setMemberImg(request.getParameter("memberImg"));
		bean.setAddress(request.getParameter("address"));
		//bean.setGender(request.getParameter("gender"));
		bean.setGenreList(request.getParameter("genreList"));
		//bean.setRankNo(Integer.parseInt(request.getParameter("rankNo")));
		 
		 
		int cnt = dao.updateData(bean) ;
		 
		 new MyPageController().doGet(request, response); 
		 if(cnt == 1){ // 수정 성공
			 System.out.println("수정 성공"); }
		 else{ // 수정 실패 
			 System.out.println("수정 실패"); }
		 }
		 
		
}
