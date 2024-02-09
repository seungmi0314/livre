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
			super.goToPage(PREFIX + "searchedBooks.jsp");
		}
		
		List<Book> dataList = dao.getDataListForBookDetail(bookNo);
		
		request.setAttribute("bean", bean);
		request.setAttribute("dataList", dataList);
		super.goToPage(PREFIX + "bookDetail.jsp");
	}
}
