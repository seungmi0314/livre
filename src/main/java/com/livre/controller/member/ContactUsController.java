package com.livre.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.livre.common.SuperClass;
import com.livre.model.bean.Member;
import com.livre.model.dao.MemberDao;

public class ContactUsController extends SuperClass {
	private final String PREFIX = "member/";

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		String memberEmail = request.getParameter("memberEmail");
		System.out.println(memberEmail);
		MemberDao dao = new MemberDao();
		Member bean = dao.getDataBean(memberEmail);
		System.out.println("doget");
		System.out.println(bean);
		super.session.setAttribute("logInfo", bean);

		// 비밀번호 찾기 페이지로 직접 이동
		super.goToPage(PREFIX + "contactus.jsp");
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doPost(request, response);
	}
}
