package com.livre.controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.livre.common.SuperClass;
import com.livre.model.bean.Rank;
import com.livre.model.dao.BookDao;

public class MyServletAjax extends SuperClass{
	
	@Override
	public void doPost(
		HttpServletRequest request
	  , HttpServletResponse response
	) throws ServletException, IOException {
		
		BookDao bookDao = new BookDao();
		
		int genreNo = Integer.parseInt((String) request.getParameter("genreNo"));

		//Genre ranking 정보 가져오기
		List<Rank> rankList = bookDao.getDataGenreRankBean(genreNo);
		if(rankList.size() > 0) {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print("[");
			for(int i=0; i<rankList.size(); i++) {
				Rank rank = rankList.get(i);
				out.print("{");
				out.print("\"bookTitle\":" + rank.getBookTitle() + ",");
				out.print("\"reviewTitle\":"+rank.getReviewTitle()+",");
				out.print("\"memberNick\":"+rank.getMemberNick()+",");
				out.print("\"readHit\":"+rank.getReadhit());
				out.print("}");
				if(i < rankList.size() - 1) {
					out.print(",");
				}
			}
			
			out.print("]");
			out.flush();
			
		}else {
		}
	}
}
