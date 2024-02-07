package com.livre.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.livre.common.SuperClass;
import com.livre.controller.book.MyReviewController;
import com.livre.model.bean.Member;
import com.livre.model.dao.MemberDao;

public class MemberLoginController extends SuperClass{
	private final String PREFIX = "member/";
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("로그인 페이지로 이동합니다.");
		super.doGet(request, response);		
		super.goToPage(PREFIX + "login.jsp");
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		String memberEmail = request.getParameter("memberEmail") ;
		String memberPw = request.getParameter("memberPw") ;
		System.out.println(memberEmail + "/" + memberPw);
		
		MemberDao dao = new MemberDao();
		Member bean = dao.getDataByEmailAndPassword(memberEmail, memberPw);
		
		if(bean == null) { // 로그인 실패
			String message = "로그인에 실패하였습니다.";
			super.setAlertMessage(message) ;
			super.goToPage(PREFIX + "login.jsp");
			
		}else { // 로그인 성공
			// session 영역(scope)에 나의 로그인 정보를 저장(바인딩)합니다.
			// loginfo 속성을 사용하여 현재 로그인 상태를 확인할 수 있습니다. 
			super.session.setAttribute("loginfo", bean) ;
			
			// 로그인 성공 이후 홈으로 이동합니다. // 수정
			// new 수정Controller().doGet(request, response) ;
			// 로그인 성공 이후 MyReviewController로 리다이렉트합니다.
		    response.sendRedirect(request.getContextPath() + "/Livre?command=my-review");
		}
	}
}
