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
		Integer memberNo = (Integer) request.getSession().getAttribute("memberNo");
		String memberPw = (String) request.getSession().getAttribute("memberPw");

		MemberDao dao = new MemberDao();

		if (authkey.equals(findPwdAuth)) {
		    // 비밀번호 변경 성공 시, 사용자 정보를 다시 조회하여 세션에 저장
		    Member updatedMemberInfo = dao.getDataBean(memberNo);
		    request.getSession().setAttribute("logInfo", updatedMemberInfo);
		    
		    // 사용자에게 알림 메시지를 보여주고, 마이 페이지로 리다이렉션
		    out.println("<script>");
		    out.println("alert('임시 비밀번호로 로그인 되었습니다.\\n보안을 위해 마이페이지에서 비밀번호를 변경하세요.');");
		    out.println("location.href='" + request.getContextPath() + "/member/my-page.jsp?memberNo=" + updatedMemberInfo.getMemberNo() + "';");
		    out.println("</script>"); //super.goToPage(PREFIX + "findPassword.jsp");
		    out.flush();
		} else {
		    // 인증코드 불일치 시의 처리
		    out.println("<script>");
		    out.println("alert('발송된 임시 비밀번호와 일치하지 않습니다.\\n다시 시도해 주세요.');");
		    out.println("location.href='" + request.getContextPath() + "/" + PREFIX + "findPassword.jsp';");
		    out.println("</script>");
		    out.flush();
		}

	}
}