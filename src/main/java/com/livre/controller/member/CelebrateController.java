package com.livre.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.livre.common.SuperClass;
import com.livre.model.bean.Member;
import com.livre.model.dao.MemberDao;

public class CelebrateController extends SuperClass {
    private final String PREFIX = "member/";
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        super.doPost(request, response);
        
        System.out.println("가입성공 축하 페이지로 이동합니다.");
        
        MemberDao dao = new MemberDao();
        Member bean = new Member();
        
        bean.setMemberEmail(request.getParameter("memberEmail"));
        bean.setMemberPw(request.getParameter("memberPw"));
        bean.setTerm_FL(request.getParameter("term_FL"));
        bean.setGender(request.getParameter("gender"));
        bean.setMemberNick(request.getParameter("memberNick"));
        
		String genreNo="";
		String[] genreNos = request.getParameterValues("genreList");
		if(genreNos == null){
			genreNo = null;//디비에 null값으로 채우기
		}else{
			for(int i=0; i<genreNos.length; i++){
				genreNo += genreNos[i];
			}
		}
		bean.setGenreList(genreNo); 
        
      
        
        int cnt = dao.insertData(bean);
        
        if(cnt == 1) { // 인서트 성공
            super.goToPage(PREFIX + "celebrate.jsp");
        } else { // 인서트 실패
            new MemberInsertController().doGet(request, response);
        }
    }
}
