package com.livre.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.livre.common.SuperClass;
import com.livre.model.dao.MemberDao;

public class UpdatePasswordController extends SuperClass {
	private final String PREFIX = "member/";
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		// 여기에서 비밀번호 업데이트 화면으로 이동하는 로직을 추가할 수 있다
		// 예를 들면, 비밀번호 변경 폼을 보여주는 JSP 페이지로 포워딩할 수 있다.
		// request.getRequestDispatcher("/updatePasswordForm.jsp").forward(request,
		// response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {

		super.doPost(request, response);

		// 사용자로부터 입력받은 새로운 비밀번호
		String newPassword = request.getParameter("newPassword");
		
		// 입력할 입증코드
		String findPwdAuth = request.getParameter("findPwdAuth");

		// 세션에서 인증코드 가져옴
		String authkey = (String) request.getSession().getAttribute("authkey");

		// 사용자 이메일 (세션에서 가져옴)
		String memberEmail = (String) request.getSession().getAttribute("memberEmail");
		

		if (authkey.equals(findPwdAuth)) {
			// 인증코드가 일치할 때의 동작
			System.out.println("인증코드가 일치합니다. authkey: " + authkey + ", findPwdAuth: " + findPwdAuth);
			 setAlertMessage("인증되었습니다");
			super.goToPage(PREFIX + "updatePassword.jsp");
			
		} else {
			// 인증코드가 일치하지 않을 때의 동작
			System.out.println("인증코드가 일치하지 않습니다. authkey: " + authkey + ", findPwdAuth: " + findPwdAuth);
			 setAlertMessage("다시 시도해주세요");
			super.goToPage(PREFIX + "findPassword.jsp");
			
		}
		
//		// 비밀번호 업데이트를 처리하는 서비스 메서드 호출
//		MemberDao dao = new MemberDao();
//
//		// 인증코드 확인
//		if (dao.checkAuthKey(memberEmail, authkey)) {
//
//			// 인증코드가 맞으면 비밀번호 업데이트
//			int result = dao.updatePassword(memberEmail, newPassword, authkey);
//
//			if (result == 1) {
//				setAlertMessage("비밀번호 업데이트 성공");
//				// 비밀번호 업데이트 성공 시 다른 페이지로 리다이렉트 또는 포워딩 등을 수행할 수 있습니다.
//				// 예를 들면, 로그인 화면으로 이동하거나 메인 페이지로 이동하는 등의 동작을 수행할 수 있습니다.
////				request.getRequestDispatcher("/member/updatePassword.jsp").forward(request, response);
//			} else {
//				setAlertMessage("비밀번호 업데이트 실패");
//				// 비밀번호 업데이트 실패 시 이전 페이지로 리다이렉트 또는 포워딩 등을 수행할 수 있습니다.
//				// 예를 들면, 이전의 비밀번호 변경 폼으로 이동하거나 에러 메시지를 표시하는 등의 동작을 수행할 수 있습니다.
////				request.getRequestDispatcher("/updatePasswordForm.jsp").forward(request, response);
//			}
//		} else {
//			// 인증코드가 맞지 않으면 처리
//			setAlertMessage("인증코드가 올바르지 않습니다.");
//			// 인증코드가 맞지 않을 때의 동작을 수행할 수 있습니다.
//			// 예를 들면, 에러 메시지를 표시하거나 다시 입력을 받는 폼으로 리다이렉트할 수 있습니다.
//			// request.getRequestDispatcher("/updatePasswordForm.jsp").forward(request,
//			// response);
//		}
	}
}
