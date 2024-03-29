package com.livre.controller.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.livre.common.SuperClass;
import com.livre.model.bean.Book;
import com.livre.model.dao.BookDao;

public class BookDetailController extends SuperClass {
	private final String PREFIX = "book/";
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		BookDao dao = new BookDao();
		int bookNo = Integer.parseInt(request.getParameter("bookNo"));
		Book bean = dao.getDataBean(bookNo);
		
		if(bean == null) {
			super.setAlertMessage("잘못된 요청 입니다.");
			super.goToPage(PREFIX + "bookList.jsp");
		}
		String whichBtn = request.getParameter("whichBtn");
		List<Book> dataList = dao.getReviewList(bookNo, whichBtn);
		
		request.setAttribute("bean", bean);
		request.setAttribute("dataList", dataList);
		request.setAttribute("whichBtn", whichBtn);
		super.goToPage(PREFIX + "bookDetail.jsp");
	}
}
