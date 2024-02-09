package com.livre.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.livre.model.bean.Member;

public class MemberDao extends SuperDao{

	public Member getDataByEmailAndPassword(String memberEmail, String memberPw) {
		// 이메일과 비밀번호를 이용하여 해당 회원이 존재하는지 확인합니다.
		String sql = "select * from members " ;
		sql += "where memberEmail = ? and memberPw = ?" ;
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		Member bean = null ;
		
		super.conn = super.getConnection() ;
		try {
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setString(1, memberEmail);
			pstmt.setString(2, memberPw);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean = this.resultSet2Bean(rs) ;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return bean ;
	}
	
	private Member resultSet2Bean(ResultSet rs) {
		try {
			Member bean = new Member() ;			
			bean.setMemberNo(rs.getInt("memberNo"));
			bean.setMemberEmail(rs.getString("memberEmail"));
			bean.setMemberPw(rs.getString("memberPw"));
			bean.setMemberNick(rs.getString("memberNick"));
//			bean.setTermsFL(rs.getString("termsFL"));
//			bean.setEnrollDate(rs.getString("enrollDate"));
//			bean.setSnsFL(rs.getString("snsFL"));
//			bean.setMemberImg(rs.getString("memberImg"));
//			bean.setMemberAddress(rs.getString("memberAddress"));
//			bean.setMemberGender(rs.getString("memberGender"));
//			bean.setGenreNo(rs.getInt("genreNo"));
//			bean.setReivewNo(rs.getInt("reviewNo"));
//			bean.setRankNo(rs.getInt("rankNo"));
			return bean ;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null ;
		}
	}

	public int insertData(Member bean) {
		System.out.println(bean);
		String sql=" insert into members(memberNo, genreNo, rankNo, memberEmail, memberPw, memberNick, termsFL, enrollDate, snsFL, memberImg, memberAddress, memberGender ) ";
		sql += " values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = null;
		int cnt = -999999;
		
		try {
			super.conn = super.getConnection();
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bean.getMemberNo());
			pstmt.setInt(2, bean.getGenreNo());
			pstmt.setInt(3, bean.getRankNo());
			pstmt.setString(4, bean.getMemberEmail());
			pstmt.setString(5, bean.getMemberPw());
			pstmt.setString(6, bean.getMemberNick());
			pstmt.setString(7, bean.getTermsFL());
			pstmt.setString(8, bean.getEnrollDate());
			pstmt.setString(9, bean.getSnsFL());
			pstmt.setString(10, bean.getMemberImg());
			pstmt.setString(11, bean.getMemberAddress());
			pstmt.setString(12, bean.getMemberGender());
			
			cnt = pstmt.executeUpdate();
			conn.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}finally {
			try {
				if(pstmt != null) {pstmt.close();}
				super.closeConnection();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
	}
		
	public MemberDao() {
		super();
	}	
	
	
	
	
}


















