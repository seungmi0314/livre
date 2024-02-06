package com.livre.controller.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.livre.common.SuperClass;
import com.livre.model.bean.MyReview;
import com.livre.model.dao.MyBookDao;


public class MyReviewController extends SuperClass{
	private final String PREFIX = "book/";

	// 내 독후감 목록 기본 페이지
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		
		
		MyBookDao dao = new MyBookDao();	
		List<MyReview> dataList = dao.getDataList();
		System.out.println(dataList.size());
		request.setAttribute("dataList", dataList);
		
		
		
		super.goToPage(PREFIX + "my-review.jsp");
	}

}
