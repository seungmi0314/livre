package com.livre.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.livre.model.bean.MyReview;
import com.livre.utility.Paging;





public class MyReviewDao extends SuperDao{
	public MyReviewDao() {
		super();
	}
	
	private MyReview resultSet2Bean(ResultSet rs) {
		try {
			MyReview bean = new MyReview();
			
			bean.setReviewNo(rs.getInt("reviewNo"));
			bean.setMemberNo(rs.getInt("memberNo"));
			bean.setBookNo(rs.getInt("bookNo"));
			bean.setBookTitle(rs.getString("bookTitle"));
			bean.setGenreNo(rs.getString("genreNo"));
			//bean.setGenre(rs.getString("genre"));
			bean.setReviewTitle(rs.getString("reviewTitle"));
			bean.setReviewText(rs.getString("reviewText"));
			bean.setAuthor(rs.getString("author"));
			bean.setPublisher(rs.getString("publisher"));
			//bean.setRaiting(rs.getInt("raiting"));
			bean.setCreateDate(String.valueOf(rs.getString("createDate")));	// 날짜
			bean.setPhrase(rs.getString("phrase"));
			bean.setStartDate(rs.getString("startDate"));	
			bean.setEndDate(rs.getString("endDate"));	
			bean.setReadHit(rs.getInt("readHit"));
			
		
			
			return bean;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// 내 독후감 최신순 조회
	public List<MyReview> getDataList(){
		
		
		String sql = "select *";
		sql += " from reviews r";
		sql += " full join books b";
		sql += " on r.bookno = b.bookno";
		sql += " where memberno = 62"; // 추후 로그인멤버로 변경
		sql += " order by reviewno desc";
		
		PreparedStatement pstmt = null; // 문장 객체
		ResultSet rs  = null;
		
		List<MyReview> dataList = new ArrayList<MyReview>();
		
		super.conn = super.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
		
			
			rs = pstmt.executeQuery();
			
			// 요소를 읽어서 컬렉션에 담기
			while(rs.next()) {
				MyReview bean = this.resultSet2Bean(rs);
				
				dataList.add(bean);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
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
	
	
	/*
	 * 내 독후감 검색 DAO
	 * */
	public List<MyReview> getDataList(Paging paging){
		// 페이징 처리를 이용하여 데이터 조회
		
		// 나중에 별점도 추가해야 함
		String sql ="select *";
		sql += " from reviews r";
		sql += " full join books b";
		sql += " on r.bookno = b.bookno";
		sql += " where memberno = 62";
		
		
		String keyword = paging.getKeyword();
		if (keyword != null && !keyword.equals("null") && !keyword.equals("")) {
		    sql += " and (reviewtitle like '%" + keyword + "%')";
		}		
	
		
		
		System.out.println("sql 구문 :\n" + sql);
		
		PreparedStatement pstmt = null; // 문장 객체
		ResultSet rs = null;
		
		List<MyReview> dataList = new ArrayList<MyReview>();
		
		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
		
			rs = pstmt.executeQuery();
			
			// 요소들을 읽어서 컬렉션에 담습니다.
			while(rs.next()) {
				MyReview bean = this.resultSet2Bean(rs);
				dataList.add(bean);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				super.closeConnection();
				
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return dataList;
	}
	
	/*
	 * 내 독후감 삭제 DAO
	 * */
	public int deleteData(int reviewNo) { 				
		String sql = "delete from reviews where reviewNo = ?" ;
		
		PreparedStatement pstmt = null ;
		int cnt = -9999999 ;
		
		try {
			super.conn = super.getConnection() ;
			// 자동 커밋 기능을 비활성화 시킵니다.
			// 실행이 성공적으로 완료된 이후 commit() 메소드를 명시해 줍니다. 
			conn.setAutoCommit(false);			
			pstmt = conn.prepareStatement(sql) ;
			
			pstmt.setInt(1, reviewNo);
			System.out.println(reviewNo);
			System.out.println(sql);
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
		return cnt ;
	}


	
	

	

	public int insertData(MyReview bean) {
		// no 컬럼은 시퀀스가 알아서 처리합니다. 			
				String sql = " insert into reviews (reviewno, memberno, reviewtitle, reviewtext, phrase, startdate, enddate, genreno, bookno)" ;
				sql += " values (reviews_seq.NEXTVAL, 62, ?, ?, ?, ?, ?, ?, 59)";
				// reviews_seq.NEXTVAL (테이블 재생성 후 시퀀스로 변경)	
				
				PreparedStatement pstmt = null ;
				int cnt = -9999999 ;
				
				try {
					super.conn = super.getConnection() ;
					// 자동 커밋 기능을 비활성화 시킵니다.
					// 실행이 성공적으로 완료된 이후 commit() 메소드를 명시해 줍니다. 
					conn.setAutoCommit(false);			
					pstmt = conn.prepareStatement(sql) ;
					
					
					//pstmt.setInt(1, bean.getMemberNo());
					pstmt.setString(1, bean.getReviewTitle());
					pstmt.setString(2, bean.getReviewText());
					pstmt.setString(3, bean.getPhrase());
					pstmt.setString(4, bean.getStartDate());
					pstmt.setString(5, bean.getEndDate());
					pstmt.setString(6, bean.getGenreNo());
					
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
				
				return cnt ;
	}

	
	
	
	
	

	
}
