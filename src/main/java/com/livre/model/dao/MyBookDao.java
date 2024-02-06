package com.livre.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.livre.model.bean.Book;
import com.livre.model.bean.Review;



public class MyBookDao extends SuperDao{
	public MyBookDao() {
		super();
	}
	
	private Review resultSet2Bean(ResultSet rs) {
		try {
			Review bean = new Review();
			Book bean2 = new Book();
			
			//bean.setReviewNo(rs.getInt("reviewNo"));
			bean.setMemberNo(rs.getInt("memberNo"));
			//bean.setBookNo(rs.getInt("bookNo"));
			//bean.setGenreNo(rs.getInt("genreNo"));
			bean.setReviewTitle(rs.getString("reviewTitle"));
			bean.setReviewText(rs.getString("reviewText"));
			bean2.setAuthor(rs.getString("author"));
			bean2.setPublisher(rs.getString("publisher"));
			//bean.setRaiting(rs.getInt("raiting"));
			//bean.setCreateDate(String.valueOf(rs.getString("createDate")));	// 날짜
			//bean.setPhrase(rs.getString("phrase"));
			//bean.setStartDate(String.valueOf(rs.getString("startDate")));	// 날짜
			//bean.setEndDate(String.valueOf(rs.getString("endDate")));	// 날짜
			//bean.setReadHit(rs.getInt("readHit"));
		
			
			return bean;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public List<Review> getDataList(){
		
		// 나중에 별점도 추가해야 함
		String sql = "select memberno, reviewtitle, author, publisher, reviewtext";
		sql += " from reviews r";
		sql += " full join books b";
		sql += " on r.bookno = b.bookno";
		sql += " where memberno = 1";	// 추후 로그인멤버로 변경
		
		PreparedStatement pstmt = null; // 문장 객체
		ResultSet rs  = null;
		
		List<Review> dataList = new ArrayList<Review>();
		
		super.conn = super.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			// 요소를 읽어서 컬렉션에 담기
			while(rs.next()) {
				Review bean = this.resultSet2Bean(rs);
				System.out.println("a");
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
	

}
