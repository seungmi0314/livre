package com.livre.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.livre.common.SuperClass;

public class CreateNicknameController extends SuperClass{
	private final String PREFIX = "member/";
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		System.out.println("닉네임 입력 페이지로 이동합니다.");
		
		super.goToPage(PREFIX+"createNickname.jsp");
	}
}
