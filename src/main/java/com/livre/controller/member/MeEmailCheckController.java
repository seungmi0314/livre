package com.livre.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.livre.common.SuperClass;
import com.livre.model.bean.Member;
import com.livre.model.dao.MemberDao;

public class MeEmailCheckController extends SuperClass{

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		String email = request.getParameter("memberEmail");
		MemberDao dao = new MemberDao();
		Member bean = dao.getDataEmail(email);
		
		
		String message = "";// 사용자에게 보여줄 메세지
		
		if(bean == null) { // 존재하지 않는 회원
			request.setAttribute("isRegister", true); // 가입 가능
			message = email + "은(는) <font color='blue'><b>사용 가능</b></font>한 이메일입니다." ;
			
		}else { // 존재하는 회원
			request.setAttribute("isRegister", false);
			
			message = email + "은(는) 이미 <font color='red'><b>사용중</b></font>인 이메일입니다." ;
	}
		request.setAttribute("message", message);
		super.goToPage("member/emailCheck.jsp"); 
	}
}
