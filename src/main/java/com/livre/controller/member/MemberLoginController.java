package com.livre.controller.member;

import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.livre.common.SuperClass;
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
		
		// memberEmail, memberPw, remember-check 정보 받아오기
		String memberEmail = request.getParameter("memberEmail") ; // email 넘어옴
		
		 // 카카오 로그인으로 받은 이메일이 있다면 사용 (사용자가 직접 입력한 이메일은 무시하게 된다.)
	    if (request.getParameter("account_email") != null) {
	        memberEmail = request.getParameter("account_email");
	    }
		
		String memberPw = request.getParameter("memberPw") ;       // pw 넘어옴
		String checkbox = request.getParameter("checkbox");	       //checkbox 체크여부 넘어옴
		
		System.out.println("이메일 : " + memberEmail + "/ 비밀번호 : " + memberPw);
		System.out.println("아이디 저장 여부:" + checkbox);
		
		MemberDao dao = new MemberDao();
		Member bean = dao.getDataByEmailAndPassword(memberEmail, memberPw);
		
		PrintWriter out = response.getWriter();
		
		if (checkbox != null) { // 체크박스 체크여부에 따라 쿠키 저장 확인
			Cookie cookie = new Cookie("checkbox", memberEmail); // 일단 쿠키 생성
			response.addCookie(cookie);
			System.out.println("아이디 저장 쿠키 생성완료");

		} else { // 체크박스 체크 해제되었을 때
            Cookie noCookie = new Cookie("checkbox", "");
            noCookie.setMaxAge(0); // 쿠키 유효시간 0으로 해서 브라우저에서 삭제하게 한다.
            response.addCookie(noCookie);
            System.out.println("아이디 저장 쿠키 생성 선택 안함");
		}
		
		if(bean == null) { // 로그인 실패
			System.out.println("로그인에 실패하였습니다.");
			String message = "로그인에 실패하였습니다.";
			super.setAlertMessage(message) ;
			super.goToPage(PREFIX + "login.jsp");
			
		}else { // 로그인 성공
			// session 영역(scope)에 나의 로그인 정보를 저장(바인딩)합니다.
			// loginfo 속성을 사용하여 현재 로그인 상태를 확인할 수 있습니다. 
			super.session.setAttribute("logInfo", bean) ;
			
			// 로그인 성공 이후 홈으로 이동합니다. // 수정
			// new 수정Controller().doGet(request, response) ;
			// 로그인 성공 이후 MyReviewController로 리다이렉트합니다.
		    response.sendRedirect(request.getContextPath() + "/Livre?command=my-review");
		
		    // 회원정보 session 세팅
		 	super.session.setAttribute("logInfo", bean);
		 			
		 	// 특정 시간동안 요청이 없으면 세션 만료 (1시간)
		 	super.session.setMaxInactiveInterval(3600);
		
		}
		
	}
}