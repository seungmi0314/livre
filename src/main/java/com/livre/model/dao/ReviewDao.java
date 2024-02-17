package com.livre.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.livre.model.bean.LikeReview;

public class ReviewDao extends SuperDao {
		// 북마크 관련
		public List<LikeReview> getDataList(int reviewNo) {
			String sql = "select l.likereviewno, m.memberno, r.reviewno";
			sql += " from likereviews l";
			sql += " join reviews r on r.reviewno = l.reviewno";
			sql += " join members m on m.memberno = l.memberno";
			sql += " where l.reviewno = ?";
			System.out.println("sql구문 :\n" + sql);
			
			PreparedStatement pstmt = null ; 
			ResultSet rs = null ;
			List<LikeReview> dataList = new ArrayList<LikeReview>();
			
			super.conn = super.getConnection();
			
			try {
				pstmt = conn.prepareStatement(sql);	
				pstmt.setInt(1, reviewNo); 
				rs = pstmt.executeQuery() ;
				while(rs.next()) {
					LikeReview rbean = this.resultSet2Rbean(rs);
					dataList.add(rbean);
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
			return dataList;
		}

		// 북마크 관련
		private LikeReview resultSet2Rbean(ResultSet rs) {
			try {
				LikeReview rbean = new LikeReview();

				rbean.setLikeReviewNo(rs.getInt("likeReviewNo"));
				rbean.setMemberNo(rs.getInt("memberNo"));
				rbean.setReviewNo(rs.getInt("reviewNo"));

				return rbean;

			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		}

		// 북마크 토글 AJAX
		public void insertLikeReview(int memberNo, int reviewNo, boolean isToggled) {
			// 로그인 한 사람이 좋아요를 누르면 데이터를 DB에 추가합니다.
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int cnt = -1;
			String sql = "";

			if(isToggled) {
				sql = "insert into likereviews(likereviewno, memberno, reviewno)";
				sql += " values (likereviews_seq.nextval, ?, ?)";
				System.out.println("sql 문장 : " + sql);

			} else {
				sql = "delete from likereviews where memberno = ? and reviewno = ?";
				System.out.println("sql 문장 : " + sql);
			}

			try {
				super.conn = super.getConnection();
				conn.setAutoCommit(false);

				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, memberNo);
				pstmt.setInt(2, reviewNo);
				cnt = pstmt.executeUpdate();
				conn.commit();

			} catch(Exception e) {
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

				}catch(Exception e3) {
					e3.printStackTrace();

				}
			}

		}
	
	// 조회수 증가
	public void updateReadhit(int reviewNo) {
		String sql = " update reviews set readhit = readhit + 1 where reviewno = ? " ;		
		PreparedStatement pstmt = null ;
		int cnt = -9999999 ;

		try {
			super.conn = super.getConnection() ;  
			conn.setAutoCommit(false);			
			pstmt = conn.prepareStatement(sql) ;			
			pstmt.setInt(1, reviewNo);			
			cnt = pstmt.executeUpdate() ;			
			conn.commit();			
		} catch (Exception e) {
			e.printStackTrace(); 
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}			
		} finally {
			try {
				if(pstmt != null) {pstmt.close();}
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
}
