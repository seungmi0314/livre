package com.livre.controller.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.livre.common.SuperClass;
import com.livre.model.bean.LikeReview;
import com.livre.model.bean.MyReview;
import com.livre.model.dao.MemberDao;

public class MyFavoriteReviewController  extends SuperClass{
	private final String PREFIX = "member/";

	// 내 독후감 목록 기본 페이지
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		int memberNo = 0;
		if(request.getParameter("memberNo") == null) {
			memberNo= (int) request.getAttribute("memberNo");
		}else {
			memberNo = Integer.parseInt(request.getParameter("memberNo"));
		}
		
		MemberDao dao = new MemberDao();	
		List<MyReview> likeReviewList = dao.getDataLikeReviewAllBean(memberNo);
		System.out.println(likeReviewList.size());
		request.setAttribute("dataList", likeReviewList);
		
		
		
		super.goToPage(PREFIX + "my-favorite-review.jsp");
	}

}
