package com.livre.controller.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.livre.common.SuperClass;
import com.livre.model.bean.MyReview;
import com.livre.model.dao.MyReviewDao;

public class InsertReviewController extends SuperClass{
	private final String PREFIX = "book/";
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		super.goToPage(PREFIX + "review-uploade.jsp");
	}
	
	MyReviewDao dao = new MyReviewDao();
	MyReview bean = new MyReview(); 
	
}
