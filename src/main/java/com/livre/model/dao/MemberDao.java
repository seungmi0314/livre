package com.livre.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
			bean.setGenreNo(rs.getInt("genreNo"));
			bean.setRankNo(rs.getInt("rankNo"));
			bean.setMemberEmail(rs.getString("memberEmail"));
			bean.setMemberPw(rs.getString("memberPw"));
			bean.setMemberNick(rs.getString("memberNick"));
			bean.setTerm_FL(rs.getString("term_FL"));
			bean.setEnrollDate(rs.getString("enrollDate"));
			bean.setSns_FL(rs.getString("sns_FL"));
			bean.setMemberImg(rs.getString("memberImg"));
			bean.setAddress(rs.getString("Address"));
			bean.setGender(rs.getString("Gender"));
			
			
			return bean ;
		} catch (Exception e) {
			e.printStackTrace();
			return null ;
		}
	}

	public int insertData(Member bean) {
		//members_seq.NEXTVAL
		System.out.println(bean);
		/*
		 * String
		 * sql=" insert into members( enrollDate, memberNo, genreNo, rankNo, memberEmail, memberPw, memberNick, term_FL, sns_FL, memberImg, Address, Gender) "
		 * ; sql +=
		 * " values(default, 2, 1, 1, ?, ? , null, null, default, null, null, null)";
		 */
		String sql=" insert into members(memberNo, memberEmail, memberPw,term_FL) ";
		sql += " values(members_seq.NEXTVAL, ?,?,?)";
		PreparedStatement pstmt = null;
		int cnt = -999999;
		
		try {
			super.conn = super.getConnection();
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement(sql);
			
			
			//pstmt.setString(1, bean.getEnrollDate());
			//pstmt.setInt(1, bean.getMemberNo());
			//pstmt.setInt(3, bean.getGenreNo());
			//pstmt.setInt(4, bean.getRankNo());
			pstmt.setString(1, bean.getMemberEmail());
			pstmt.setString(2, bean.getMemberPw());
			//pstmt.setString(6, bean.getMemberNick());
			pstmt.setString(3, bean.getTerm_FL());
			//pstmt.setString(8, bean.getSnsFL());
			//pstmt.setString(9, bean.getMemberImg());
			//pstmt.setString(10, bean.getMemberAddress());
			//pstmt.setString(11, bean.getMemberGender());
			
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
		
	public int updateData(Member bean) {
		System.out.println(bean);
		String sql=" update members set memberNo=?, genreNo=?, rankNo=?, memberEmail=?, memberPw=?, memberNick=?, termsFL=?, enrollDate=?, snsFL=?, memberImg=? memberAddress=?, memberGender=?";
		sql += " where memberNo = ?";
		
		PreparedStatement pstmt = null;
		int cnt = -9999999;
		
		try {
			super.conn = super.getConnection();
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setInt(1, bean.getMemberNo());
			//pstmt.setInt(2, bean.getGenreNo());
			//pstmt.setInt(3, bean.getRankNo());
			pstmt.setString(2, bean.getMemberEmail());
			pstmt.setString(3, bean.getMemberPw());
			//pstmt.setString(6, bean.getMemberNick());
			pstmt.setString(4, bean.getTerm_FL());
			//pstmt.setString(8, bean.getEnrollDate());
			//pstmt.setString(9, bean.getSns_FL());
			//pstmt.setString(10, bean.getMemberImg());
			//pstmt.setString(11, bean.getMemberAddress());
			//pstmt.setString(12, bean.getMemberGender());
			
			
			cnt = pstmt.executeUpdate();
			conn.commit();
		}catch(Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			}catch(Exception e1) {
				e1.printStackTrace();
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
	
	public List<Member> getDataList(){
		String sql ="select * from members";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<Member> dataList = new ArrayList<Member>();
		
		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Member bean = this.resultSet2Bean(rs);
				dataList.add(bean);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {//200p 5번
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				super.closeConnection();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return dataList;
	}
	
	
	

	
}







