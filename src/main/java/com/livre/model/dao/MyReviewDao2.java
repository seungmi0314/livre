package com.livre.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.livre.model.bean.LikeReview;
import com.livre.model.bean.MyReview;
import com.livre.utility.Paging;




//// 독후감 상세보기를 위한 DAO
public class MyReviewDao2 extends SuperDao{
	public MyReviewDao2() {
		super();
	}
	
	// 북마크 관련...
	public LikeReview getLikeReviewBean(int reviewNo) {
		PreparedStatement pstmt = null ; 
		ResultSet rs = null ;		
		LikeReview bean2 = null ;
		
		String sql = "select l.likereviewno, m.memberno, r.reviewno";
		sql += " from likereviews l";
		sql += " join reviews r on r.reviewno = l.reviewno";
		sql += " join members m on m.memberno = l.memberno";
		sql += " where l.reviewno = ?";
		
		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);	
			pstmt.setInt(1, reviewNo); 
			rs = pstmt.executeQuery() ;
			if(rs.next()) {
				bean2 = this.resultSet2Bean2(rs);
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
		return bean2;
	}
	
	// 북마크 관련..
	private LikeReview resultSet2Bean2(ResultSet rs) {
		try {
			LikeReview bean2 = new LikeReview();
			
			bean2.setLikeReviewNo(rs.getInt("likeReviewNo"));
			bean2.setMemberNo(rs.getInt("memberNo"));
			bean2.setReviewNo(rs.getInt("reviewNo"));
			
			return bean2;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// 북마크 토글 AJAX...
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

	private MyReview resultSet2Bean(ResultSet rs) {
		try {
			MyReview bean = new MyReview();
			
			bean.setReviewNo(rs.getInt("reviewNo"));
			bean.setMemberNo(rs.getInt("memberNo"));
			bean.setBookNo(rs.getInt("bookNo"));
			bean.setBookTitle(rs.getString("bookTitle"));
			bean.setGenreNo(rs.getInt("genreNo"));
			bean.setGenre(rs.getString("genre"));
			bean.setReviewTitle(rs.getString("reviewTitle"));
			bean.setReviewText(rs.getString("reviewText"));
			bean.setAuthor(rs.getString("author"));
			bean.setPublisher(rs.getString("publisher"));
			bean.setRaiting(rs.getInt("raiting"));
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

/*	public int updateData(MyReview bean) {
		System.out.print("게시물 수정 페이지 : ");
		System.out.println(bean);
		
		
		String sql = " update reviews set" ;
		sql += "  reviewtitle = ?, reviewtext = ?, raiting = ?, phrase = ?, createdate = default, startdate = ?, enddate = ?" ;
		sql += " where reviewno = 50" ;
		
		
		PreparedStatement pstmt = null ;
		int cnt = -9999999 ;
		
		try {
			super.conn = super.getConnection() ;  
			conn.setAutoCommit(false);			
			pstmt = conn.prepareStatement(sql) ;
			
			pstmt.setString(1, bean.getReviewTitle());
			pstmt.setString(2, bean.getReviewText());
			pstmt.setInt(3, bean.getRaiting());
			pstmt.setString(4, bean.getPhrase());
			//pstmt.setInt(5, bean.getBookNo());
			pstmt.setString(6, bean.getStartDate());
			pstmt.setString(7, bean.getEndDate());
			
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
	}*/

	/*public int insertData(MyReview bean) {
		// no 컬럼은 시퀀스가 알아서 처리합니다. 			
				String sql = " insert into reviews (reviewno, memberno, reviewtitle, reviewtext, phrase, startdate, enddate, genreno)" ;
				sql += " values (1020, 1, ?, ?, ?, ?, ?, ?)";
				// reviews_seq.NEXTVAL (테이블 재생성 후 시퀀스로 변경)	
				
				PreparedStatement pstmt = null ;
				int cnt = -9999999 ;
				
				try {
					super.conn = super.getConnection() ;
					// 자동 커밋 기능을 비활성화 시킵니다.
					// 실행이 성공적으로 완료된 이후 commit() 메소드를 명시해 줍니다. 
					conn.setAutoCommit(false);			
					pstmt = conn.prepareStatement(sql) ;
					
					pstmt.setString(1, bean.getReviewTitle());
					pstmt.setString(2, bean.getReviewText());
					pstmt.setString(3, bean.getPhrase());
					pstmt.setString(4, bean.getStartDate());
					pstmt.setString(5, bean.getEndDate());
					pstmt.setInt(6, bean.getGenreNo());
					
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
	}*/
	
}
