package com.livre.controller.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.livre.common.SuperClass;
import com.livre.model.bean.Member;
import com.livre.model.dao.MemberDao;

public class MainPageController extends SuperClass{
	private String PREFIX = "book/";
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		MemberDao dao = new MemberDao();
		Member bean = dao.getDataBean(memberNo);
		
		request.setAttribute("bean", bean);
		super.goToPage(PREFIX + "main-page.jsp");
		
	}
}
