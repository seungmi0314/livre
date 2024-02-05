package com.livre.controller.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.livre.common.SuperClass;
import com.livre.model.bean.Book;
import com.livre.model.dao.BookDao;
import com.livre.utility.Paging;

public class BookSearchedController extends SuperClass {
	private final String PREFIX = "book/";
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		//페이징 처리를 위한 파라미터 목록들
		String pageNumber = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
		String mode = request.getParameter("mode");
		String keyword = request.getParameter("keyword");
		
		BookDao dao = new BookDao();
		
		int totalCount = dao.getTotalRecordCount("books", mode, keyword);
		String url = super.getUrlInformation("searchedBooks");
		boolean isGrid = false;
		
		Paging paging = new Paging(pageNumber, pageSize, totalCount, url, mode, keyword, isGrid);
		
		
		List<Book> dataList = dao.getDataList(paging);
		
		request.setAttribute("paging", paging); // 페이징 객체도 바인딩
		request.setAttribute("dataList", dataList);
		request.setAttribute("keyword", keyword);
		request.setAttribute("mode", mode);
		
		super.goToPage(PREFIX + "searchedBooks.jsp");
	}
}
