package com.livre.controller.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.livre.common.SuperClass;
import com.livre.model.bean.LikeReview;
import com.livre.model.bean.MyReview;
import com.livre.model.dao.MyReviewDao2;

public class ReviewInfoController extends SuperClass {
	private final String PREFIX = "book/";

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		MyReviewDao2 dao = new MyReviewDao2();
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		MyReview bean = dao.getDataBean(reviewNo);		
		LikeReview bean2 = dao.getLikeReviewBean(reviewNo);
		
		if(bean == null) {
			super.setAlertMessage("잘못된 게시물 정보입니다.");
			super.goToPage(PREFIX + "bookDetail.jsp");
			
		}else{
			// 현재 로그인한 사람이 작성한 글이 아니면 조회수를 1증가 시킵니다.
			String readhitUpdate = request.getParameter("readhitUpdate");
			
			// 조회수 +1 정보가 없으면, 기본값은 "false"로 지정합니다.
			// 즉, 조회수를 +1 시키지 않겠습니다.
			if(readhitUpdate == null) {readhitUpdate = "false";}
			
			if(readhitUpdate.equals("true")) {
				dao.updateReadhit(reviewNo);
			}
			
			request.setAttribute("bean", bean);
			request.setAttribute("bean2", bean2);
			System.out.println("bean2 : " + bean2);
			super.goToPage(PREFIX + "reviewInfo.jsp");
		}
		
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		if(super.logInfo == null) {
			return;
		}
		
		MyReviewDao2 dao = new MyReviewDao2();
		// LikeReview bean = new LikeReview();
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		int memberNo = super.logInfo.getMemberNo();
		System.out.println("isToggled : ["+ request.getParameter("isToggled") +"]");
		boolean isToggled = Boolean.parseBoolean(request.getParameter("isToggled"));
		dao.insertLikeReview(memberNo, reviewNo, isToggled);
	}
}
