package com.livre.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.livre.model.bean.Book;
import com.livre.model.bean.MyReview;
import com.livre.utility.Paging;




//// 독후감 상세보기를 위한 DAO
public class MyReviewDao2 extends SuperDao{
	public MyReviewDao2() {
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
			bean.setGenre(rs.getString("genre"));
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



}
