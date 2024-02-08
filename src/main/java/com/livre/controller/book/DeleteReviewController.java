package com.livre.controller.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.livre.common.SuperClass;
import com.livre.model.dao.MyReviewDao;

public class DeleteReviewController extends SuperClass{

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo")) ;
		MyReviewDao dao = new MyReviewDao() ;
		int cnt = -1;
		cnt = dao.deleteData(reviewNo);		

		new MyReviewController().doGet(request, response); 
	}
	
}
