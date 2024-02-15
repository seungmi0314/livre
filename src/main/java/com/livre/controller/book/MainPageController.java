package com.livre.controller.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.livre.common.SuperClass;
import com.livre.model.bean.MyReview;
import com.livre.model.dao.MyReviewDao;

public class MainPageController extends SuperClass{
	private String PREFIX = "book/";
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		MyReviewDao dao = new MyReviewDao();
		MyReview bean = dao.getRank(reviewNo) ; 
		
		request.setAttribute("bean", bean);
		
		super.goToPage(PREFIX + "main-page.jsp");
	}
}
