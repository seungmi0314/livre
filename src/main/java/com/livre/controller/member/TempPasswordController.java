package com.livre.controller.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.livre.common.SuperClass;
import com.livre.model.bean.Member;
import com.livre.model.dao.MemberDao;

public class TempPasswordController extends SuperClass {
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

		// 비밀번호 변경 페이지로 직접 이동
		super.goToPage(PREFIX + "tempPassword.jsp");
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		super.doPost(request, response);

		// 사용자로부터 입력받은 새로운 비밀번호
		String newPassword = request.getParameter("newPassword");

		// 입력할 입증코드
		String findPwdAuth = request.getParameter("findPwdAuth");

		// 세션에서 인증코드 가져옴
		String authkey = (String) request.getSession().getAttribute("authkey");

		// 사용자 이메일 (세션에서 가져옴)
		String memberEmail = (String) request.getSession().getAttribute("memberEmail");
		String memberPw = (String) request.getSession().getAttribute("memberPw");

		MemberDao dao = new MemberDao();

		if (authkey.equals(findPwdAuth)) {
		    // 인증코드가 일치할 때의 동작
		    out.println("<script>alert('임시 비밀번호로 로그인 되었습니다.\\n보안을 위해 마이페이지에서 비밀번호를 변경하세요.'); location.href='" + request.getContextPath() + "/member.my-page.jsp';</script>");
		    out.flush();
		} else {
		    // 인증코드가 일치하지 않을 때의 동작
		    out.println("<script>alert('발송된 임시 비밀번호와 일치하지 않습니다.\\n다시 시도해 주세요.'); location.href='" + request.getContextPath() + "/"+ PREFIX + "findPassword.jsp';</script>");
		    out.flush();
		}

	}
}
