package com.livre.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.livre.common.SuperClass;
import com.livre.model.dao.MemberDao;

public class MemberDeleteController extends SuperClass{
	@Override 	// 특정 회원이 탈퇴할 때 사용하는 컨트롤러입니다.
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		int id = Integer.parseInt((String) request.getParameter("memberNo")) ;
		MemberDao dao = new MemberDao() ;
		int cnt = -1 ;
		cnt = dao.deleteData(id) ;
		
		// 세션 공간에 들어 있는 모든 정보를 무효화시킵니다.
		super.session.invalidate();
		
		//new MemberInsertController().doGet(request, response);
		super.goToPage("index.jsp");
	}
}
