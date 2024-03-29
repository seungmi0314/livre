package com.livre.controller.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.livre.common.SuperClass;
import com.livre.model.bean.MyReview;
import com.livre.model.dao.MyReviewDao;
import com.livre.utility.Paging;

public class MyReviewSearchController extends SuperClass{
	private final String PREFIX = "book/";
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);

		String keyword = request.getParameter("keyword");

		MyReviewDao dao = new MyReviewDao();

		String url = super.getUrlInformation("reviewSearch");

		Paging paging = new Paging(url, keyword);

		List<MyReview> dataList = dao.getDataList(paging);


		request.setAttribute("paging", paging); // 페이징 객체도 바인딩
		request.setAttribute("dataList", dataList);
		request.setAttribute("keyword", keyword);

		super.goToPage(PREFIX + "my-review.jsp");
	}

}