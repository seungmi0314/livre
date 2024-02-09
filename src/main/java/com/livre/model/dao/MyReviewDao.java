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
			bean.setGenreNo(rs.getInt("genreNo"));
			//bean.setGenre(rs.getString("genre"));
			bean.setReviewTitle(rs.getString("reviewTitle"));
			bean.setReviewText(rs.getString("reviewText"));
			bean.setAuthor(rs.getString("author"));
			bean.setPublisher(rs.getString("publisher"));
			bean.setRaiting(rs.getInt("raiting"));
			bean.setCreateDate(String.valueOf(rs.getString("createDate")));	// 날짜
			bean.setPhrase(rs.getString("phrase"));
			bean.setStartDate(String.valueOf(rs.getString("startDate")));	// 날짜
			bean.setEndDate(String.valueOf(rs.getString("endDate")));	// 날짜
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
		sql += " where memberno = 1"; // 추후 로그인멤버로 변경
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
		String sql ="select memberno, reviewno, reviewtitle, author, publisher, reviewtext";
		sql += " from reviews r";
		sql += " full join books b";
		sql += " on r.bookno = b.bookno";
		sql += " where memberno = 1";
		
		
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
			System.out.println("1");
		} catch (Exception e) {
			System.out.println("2");
			e.printStackTrace();
			try {
				System.out.println("3");
				conn.rollback();
				System.out.println("4");
			} catch (SQLException e1) {
				System.out.println("5");
				e1.printStackTrace();
				System.out.println("6");
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


	
	/* 독후감 상세 보기 */
	public MyReview getDataBean(int reviewNo) {
		// 해당 게시물 번호를 이용하여 1건의 정보를 반환합니다.
				String sql = "select *" ;
				sql += " from reviews r" ;
				sql += " join books b" ;
				sql += " on r.bookno = b.bookno" ;
				sql += " join genres g" ;
				sql += " on b.genreno = g.genreno" ;
				sql += " where reviewno = ?" ;
				
				PreparedStatement pstmt = null ; 
				ResultSet rs = null ;		
				MyReview bean = null ;
				
				super.conn = super.getConnection() ;
				try {
					pstmt = conn.prepareStatement(sql);	
					pstmt.setInt(1, reviewNo); 
					rs = pstmt.executeQuery() ;
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