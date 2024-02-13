package com.livre.controller.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.livre.common.SuperClass;
import com.livre.model.bean.MyReview;
import com.livre.model.dao.MyReviewDao;



public class MyReviewUpdateController extends SuperClass {
private final String PREFIX = "book/";
	
@Override
public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
	super.doGet(request, response);
	
	// 넘어 오는 게시물 번호를 우선 챙깁니다.
	int reviewNo = Integer.parseInt(request.getParameter("reviewNo")) ;
	MyReviewDao dao = new MyReviewDao();
	MyReview bean = dao.getDataBean(reviewNo);
	
	// 이전에 작성했던 게시물 내용을 폼 양식에서 볼수 있도록 바인딩합니다. 
	request.setAttribute("bean", bean);
	
	super.goToPage(PREFIX + "review-detail.jsp"); 
}

@Override
public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
	super.doPost(request, response);
	
	MyReviewDao dao = new MyReviewDao();
	MyReview bean = new MyReview();
	
	/* 다음 컬럼들에 대하여 주의하도록 합니다.
	 * 글번호(no)는 반드시 파라미터를 챙겨야 합니다.
	 * regdate 컬럼은 현재 시각으로 변경하도록 합니다. */
	
	//int reviewNo = Integer.parseInt(request.getParameter("reviewNo")) ;
	//int bookNo = Integer.parseInt(request.getParameter("bookNo"));
	//String bookTitle = request.getParameter("bookTitle");
	//int genreNo = Integer.parseInt(request.getParameter("genreNo"));
	String reviewTitle = request.getParameter("reviewTitle");
	String reviewText = request.getParameter("reviewText");
	//String author = request.getParameter("author");
	//String publisher = request.getParameter("publisher");
	//int raiting =Integer.parseInt(request.getParameter("raiting"));
	String createDate = request.getParameter("createDate");
	String phrase = request.getParameter("phrase");
	String startDate = request.getParameter("startDate");
	String endDate = request.getParameter("endDate");
	
	//bean.setReviewNo(reviewNo) ;
	//bean.setBookNo(bookNo);
	//bean.setBookTitle(bookTitle);
	//bean.setGenreNo(genreNo);
	bean.setReviewTitle(reviewTitle);		
	bean.setReviewText(reviewText);		
	//bean.setAuthor(author);		
	//bean.setPublisher(publisher);		
	//bean.setRaiting(raiting);		
	bean.setCreateDate(createDate);		
	bean.setPhrase(phrase);		
	bean.setStartDate(startDate);		
	bean.setEndDate(endDate);		
	
	int cnt = -1 ;
	cnt = dao.updateData(bean);

	if(cnt == 1){ // 수정 성공
		new MyReviewDetailController().doGet(request, response) ;
		
	}else{ // 수정 실패
		new MyReviewUpdateController().doGet(request, response);
	}	
}
}
