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
        
        // 선택된 장르에 대해 처리
        String[] selectedGenres = request.getParameterValues("genreNo");
        if(selectedGenres != null) {
            StringBuilder genreNoBuilder = new StringBuilder();
            for(String genre : selectedGenres) {
                try {
                    int genreValue = Integer.parseInt(genre.trim().replaceAll("[\\[\\]]", ""));
                    if (genreNoBuilder.length() > 0) {
                        genreNoBuilder.append(",");
                    }
                    genreNoBuilder.append(genreValue);
                } catch (NumberFormatException e) {
                    // 정수로 변환할 수 없는 경우 예외 처리
                    e.printStackTrace(); // 로그 출력
                }
            }
            bean.setGenreNo(genreNoBuilder.toString());
        } else {
            bean.setGenreNo("0"); // 선택된 장르가 없는 경우
        }
        
        int cnt = dao.insertData(bean);
        
        if(cnt == 1) { // 인서트 성공
            super.goToPage(PREFIX + "celebrate.jsp");
        } else { // 인서트 실패
            new MemberInsertController().doGet(request, response);
        }
    }
}
