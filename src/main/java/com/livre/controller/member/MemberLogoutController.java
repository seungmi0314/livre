package com.livre.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.livre.common.SuperClass;

public class MemberLogoutController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		// 로그인시 바인딩하였던 로그인 정보를 깨끗이 지웁니다.
		if(super.logInfo != null) {
			super.session.invalidate(); // 세션 데이터들을 무효화
			super.goToPage("/Livre?command=login"); // 로그인 페이지로 다시 이동
		}else { // 미로그인 상태
			super.youNeededLogin();
			return;
		}
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doPost(request, response);
	}

}
