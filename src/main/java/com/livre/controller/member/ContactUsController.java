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

		// 세션에서 로그인 정보를 가져옴
		Member logInfo = (Member) super.session.getAttribute("logInfo");

		if (logInfo != null) {
			// 로그인 정보가 있을 경우, 로그를 출력하거나 추가 처리를 할 수 있음
			System.out.println("Logged in user: " + logInfo.getMemberEmail());
		} else {
			// 로그인 정보가 없을 경우, 로그인 페이지나 메인 페이지로 리다이렉트할 수 있음
			response.sendRedirect("login.jsp");
			return; 
		}

		// contactus 페이지로 이동
		super.goToPage(PREFIX + "contactus.jsp");
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doPost(request, response);
	}
}
