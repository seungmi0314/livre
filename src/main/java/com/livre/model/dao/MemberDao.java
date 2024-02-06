package com.livre.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.livre.model.bean.Member;

public class MemberDao extends SuperDao{

	public Member getDataByEmailAndPassword(String memberEmail, String memberPw) {
		// 이메일과 비밀번호를 이용하여 해당 회원이 존재하는지 확인합니다.
		String sql = "select * from members" ;
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
			bean.setMemberEmail(rs.getString("memberEmail"));
			bean.setMemberPw(String.valueOf(rs.getDate("memberPw")));
			 		
			return bean ;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null ;
		}
	}
}
