package com.livre.controller.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.livre.common.SuperClass;
import com.livre.model.bean.MyReview;
import com.livre.model.dao.MyReviewDao;
import com.livre.model.dao.MyReviewDao2;



public class MyReviewDetailController extends SuperClass{
	private final String PREFIX = "book/";

	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		MyReviewDao2 dao = new MyReviewDao2() ;
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo")) ;
		MyReview bean = dao.getDataBean(reviewNo) ;		
		
		if(bean == null) {
			super.setAlertMessage("잘못된 게시물 정보입니다.");
			super.goToPage(PREFIX + "login.jsp");
		} else {
			request.setAttribute("bean", bean); 	
			super.goToPage(PREFIX + "review-detail.jsp");	
		}
	
	}
}
