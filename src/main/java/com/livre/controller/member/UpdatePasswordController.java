package com.livre.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.livre.common.SuperClass;
import com.livre.model.bean.Member;
import com.livre.model.dao.MemberDao;

public class UpdatePasswordController extends SuperClass {
	private final String PREFIX = "member/";

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);

		// 세션에서 Member 객체 가져오기
		Member logInfo = (Member) request.getSession().getAttribute("logInfo");
		if (logInfo == null) {
			response.sendRedirect("login.jsp?error=nologin"); // 로그인 정보가 없을 경우 로그인 페이지로 리다이렉트
			return;
		}

		// 이메일 가져오기
		String memberEmail = this.logInfo.getMemberEmail();
		// 폼에서 입력받은 새로운 비밀번호
		String newPassword = request.getParameter("newPassword");

		// 비밀번호 암호화 처리 (예: SHA256)
		// String encryptedPassword = SHA256Encryption.encrypt(newPassword);

		// 데이터베이스 업데이트
		MemberDao dao = new MemberDao();
		int updateResult = dao.updatePassword(memberEmail, newPassword);

		if (updateResult > 0) {
			// 비밀번호 변경 성공 후 로직 (마이페이지로)
			response.sendRedirect(request.getContextPath() + "/Livre?command=myPage");
		} else {
			// 비밀번호 변경 실패
			setAlertMessage("비밀번호 변경에 실패했습니다.");
			super.goToPage(PREFIX + "updatePassword.jsp");
		}
	}
}
