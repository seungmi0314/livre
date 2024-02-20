package com.livre.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.livre.common.SuperClass;
import com.livre.model.bean.Member;
import com.livre.model.dao.MemberDao;
import com.oreilly.servlet.MultipartRequest;

public class ImgUpdateController extends SuperClass{
	private final String PREFIX = "member/";
	
	@Override
	public void doGet(
			HttpServletRequest request
			, HttpServletResponse response
		) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
		
		//MultipartRequest multipartRequest = new MultipartRequest(request, "C:\\");
		//String aa = (String) request.getAttribute("memberNo");
		//int memberNo = 0;
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		MemberDao dao = new MemberDao();
		Member bean = dao.getDataBean(memberNo);

		request.setAttribute("bean", bean);
		System.out.println("이미지 업데이트 Get메소드 구동");
		super.goToPage(PREFIX + "ChangeProfileImg.jsp");
		
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doPost(request, response);
		
		MultipartRequest mr = (MultipartRequest)request.getAttribute("mr");
		
		System.out.println("mr = " + mr);
		
		Member bean = new Member() ;
		
		// 상품 등록과는 다르게 상품 번호를 파라미터로 챙겨야 합니다. 
		bean.setMemberNo(Integer.parseInt(mr.getParameter("memberNo")));
		bean.setMemberImg(mr.getFilesystemName("memberImg"));	
		
		MemberDao dao = new MemberDao() ;
		int cnt = -1 ; 
		
		cnt = dao.updateImg(bean);
		
		if(cnt == 1) {
			request.setAttribute("memberNo", bean.getMemberNo());
			new MyPageController().doGet(request, response); 
			
		}else {
			System.out.println("이미지 업로드 실패");
			new ImgUpdateController().doGet(request, response);
		}	
		System.out.println("Post메소드 구동");
	}

}
