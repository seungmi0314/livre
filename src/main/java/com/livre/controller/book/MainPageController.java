package com.livre.controller.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.livre.common.SuperClass;
import com.livre.model.bean.Member;
import com.livre.model.bean.MyReview;
import com.livre.model.bean.Rank;
import com.livre.model.dao.BookDao;
import com.livre.model.dao.MemberDao;

public class MainPageController extends SuperClass{
	private String PREFIX = "book/";
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		//객체선언 init 
		MemberDao dao = new MemberDao();
		BookDao bookDao = new BookDao();
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		int genreNo = 1;
		if(request.getParameter("genreNo") != null) {
			genreNo = Integer.parseInt((String) request.getParameter("genreNo"));
		}
		
		//회원정보 가져오기
		Member bean = dao.getDataBean(memberNo);
		
		//livre ‘s ranking 정보 가져오기
		List<Rank> rankList = bookDao.getDataRankBean();
		

		//Genre ranking 정보 가져오기
		List<Rank> genreRankList = bookDao.getDataGenreRankBean(genreNo);
		
		
		List<MyReview> myReviewList = bookDao.getDataGenreMyReviewBean(memberNo);
		
		
		request.setAttribute("bean", bean);
		request.setAttribute("rankList", rankList);
		request.setAttribute("genreRankList", genreRankList);
		request.setAttribute("myReviewList", myReviewList);
		super.goToPage(PREFIX + "main-page.jsp");
	}
}
