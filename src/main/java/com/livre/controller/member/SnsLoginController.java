package com.livre.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.livre.common.SuperClass;

public class SnsLoginController extends SuperClass{

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String memberEmail= request.getParameter("memberEmail");
		
		 memberEmail = memberEmail.replaceAll("\"","");
		
		 
		 
		 
		 
	}
	
	
}
