package com.livre.controller.member;

import com.livre.common.SuperClass;
import com.livre.model.bean.Member;
import com.livre.model.dao.MemberDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/livre/member/kakaoLogin")
public class KakaoLoginController extends SuperClass {
	private final String PREFIX = "member/";

	private final MemberDao memberDao = new MemberDao();

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 페이지로 이동
		System.out.println("로그인 페이지로 이동합니다.");
		super.goToPage(PREFIX + "login.jsp");
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// memberEmail 파라미터 받아오기
		String memberEmail = request.getParameter("memberEmail");

		// Kakao 로그인 처리 로직 구현
		Member registeredMember = memberDao.registerKakaoMember(memberEmail);

		// 성공 시 로그인 처리 및 리다이렉트
		if (registeredMember != null) {
			// 로그인 성공 시 세션에 회원 정보 저장
			// 여기서는 간단히 생략하고, 실제 프로젝트에서는 로그인 처리를 구현하세요.
			request.getSession().setAttribute("logInfo", registeredMember);
			response.sendRedirect(request.getContextPath() + "/Livre?command=my-review");
		} else {
			// 실패 시 로그인 페이지로 이동
			System.out.println("로그인에 실패하였습니다.");
			String message = "로그인에 실패하였습니다.";
			setAlertMessage(message);
			super.goToPage(PREFIX + "login.jsp");
		}
	}
}
