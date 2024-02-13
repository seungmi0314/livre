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
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
	
	MyReviewDao dao = new MyReviewDao();
	MyReview bean = new MyReview(); 
	
	/* 다음 컬럼들은 고려하지 않아도 됩니다.
	 * no(시퀀스로 처리함)
	 * 기본 값으로 처리함 : readhit, regdate, groupno, orderno, depth
	 * remark : 게시물 삭제시 '비고' 항목을 작성하기 위한 컬럼
	 *  */
	String reviewTitle = request.getParameter("reviewTitle");
	String reviewText = request.getParameter("reviewText");
	//String password = request.getParameter("raiting");
	String phrase = request.getParameter("phrase");
	String startDate = request.getParameter("startdate");
	String endDate = request.getParameter("enddate");
	
	bean.setReviewTitle(reviewTitle);
	bean.setReviewText(reviewText);
	bean.setPhrase(phrase);
	bean.setStartDate(startDate);		
	bean.setEndDate(endDate);		
	
	int cnt = -1 ;
	cnt = dao.insertData(bean); 
	if(cnt == 1){ // 인서트 성공
		new MyReviewController().doGet(request, response) ;
		
	}else{ // 인서트 실패
		new MyReviewController().doGet(request, response);
	}	
}
}
