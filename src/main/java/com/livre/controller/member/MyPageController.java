package com.livre.controller.member;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.livre.common.SuperClass;
import com.livre.model.bean.Genres;
import com.livre.model.bean.LikeReview;
import com.livre.model.bean.Member;
import com.livre.model.bean.MyReview;
import com.livre.model.dao.MemberDao;
import com.livre.model.dao.MyReviewDao;

public class MyPageController extends SuperClass {
	private final String PREFIX = "member/";

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
		int memberNo = 0;
		if(request.getParameter("memberNo") == null) {
			memberNo= (int) request.getAttribute("memberNo");
		}else {
			memberNo = Integer.parseInt(request.getParameter("memberNo"));
		}
		System.out.println("------------"+memberNo);
		
		MemberDao dao = new MemberDao();
		MyReviewDao reviewDao = new MyReviewDao();
		
		//회원정보 가져오기
		Member bean = dao.getDataBean(memberNo);
		
		//장르 리스트 가져오기
		List<Genres> genresList = dao.getGenresList();
		
		//리뷰 리스트 가져오기
		List<MyReview> myReviewList = reviewDao.getDataList();
		MyReview myReview = new MyReview();
		if(myReviewList.size() > 0) {
			Random random = new Random();
			int resturnValue = random.nextInt(myReviewList.size());
			myReview = myReviewList.get(resturnValue);
		}
		
		//내가좋아한 목록 가져오기
		List<LikeReview> likeReviewList = dao.getDataLikeReviewBean(bean.getMemberNo());
		
		request.setAttribute("bean", bean);
		request.setAttribute("genresList", genresList);
		request.setAttribute("myReview", myReview);
		request.setAttribute("likeReviewList", likeReviewList);
		super.goToPage(PREFIX + "my-page.jsp");
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doPost(request, response);
		
		MemberDao dao = new MemberDao(); 
		Member bean = new Member();
		  
		bean.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
		bean.setMemberNick(request.getParameter("memberNick"));
		//bean.setTerm_FL(request.getParameter("term_FL"));
		//bean.setEnrollDate(request.getParameter("enrollDate"));
		//bean.setSns_FL(request.getParameter("snsFL"));
		//bean.setMemberImg(request.getParameter("memberImg"));
		bean.setAddress(request.getParameter("address"));
		//bean.setGender(request.getParameter("gender"));
		bean.setGenreList(request.getParameter("genreList"));
		//bean.setRankNo(Integer.parseInt(request.getParameter("rankNo")));
		 
		 
		int cnt = dao.updateData(bean) ;
		 
		 new MyPageController().doGet(request, response); 
		 if(cnt == 1){ // 수정 성공
			 System.out.println("수정 성공"); }
		 else{ // 수정 실패 
			 System.out.println("수정 실패"); }
		 }
		 
		
}
