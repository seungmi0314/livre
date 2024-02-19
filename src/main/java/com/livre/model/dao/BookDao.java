package com.livre.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.livre.model.bean.Book;
import com.livre.utility.Paging;

public class BookDao extends SuperDao {
	
	//해당 책 번호를 이용하여 1건의 정보를 반환합니다.
	public Book getDataBean(int bookNo) {
		String sql = "select * from books";
		sql += " where bookno = ?";
		PreparedStatement pstmt = null; // 문장 객체
		ResultSet rs = null;
		Book bean = null;
		
		super.conn = super.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bookNo);
			rs = pstmt.executeQuery();
			
			// 요소를 읽어서 bean에 담습니다.
			if(rs.next()) {
				bean = this.resultSet2Bean(rs);
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
				
		return bean;
			
	}

	private Book resultSet2Bean(ResultSet rs) {
		try {
			Book bean = new Book();
			
			bean.setAuthor(rs.getString("author"));
			bean.setBookImg(rs.getString("bookImg"));
			bean.setBookNo(rs.getInt("bookNo"));
			bean.setBookTitle(rs.getString("bookTitle"));
			bean.setGenreNo(rs.getInt("genreNo"));
			bean.setPublisher(rs.getString("publisher"));
			bean.setBookContent(rs.getString("bookContent"));
			
			return bean;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	private Book resultSet2Bean2(ResultSet rs) {
		try {
			Book bean = new Book();
			
			bean.setMemberEmail(rs.getString("memberEmail"));
			bean.setReviewNo(rs.getInt("reviewNo"));
			//bean.setMemberNo(rs.getInt("memberNo"));
			bean.setMemberImg(rs.getString("memberImg"));
			bean.setMemberNick(rs.getString("memberNick"));
			bean.setReviewTitle(rs.getString("reviewTitle"));
			bean.setReviewText(rs.getString("reviewText"));
			bean.setCreateDate(String.valueOf(rs.getDate("createDate")));
			bean.setReadHit(rs.getInt("readHit"));
			return bean;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

	public BookDao() {
		super();
	}
	
	public List<Book> getDataList(){
		
		String sql = "select * from books";
		PreparedStatement pstmt = null; // 문장 객체
		ResultSet rs = null;
		
		List<Book> dataList = new ArrayList<Book>();
		
		super.conn = super.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			// 요소들을 읽어서 컬렉션에 담습니다.
			while(rs.next()) {
				Book bean = this.resultSet2Bean(rs);
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
	
	public List<Book> getReviewList(int bookNo, String whichBtn){
		
		String sql = "select m.memberno, m.memberemail, r.reviewno, m.memberimg, m.membernick, r.reviewtitle, r.reviewtext, r.createdate, r.readhit";
		sql += " from members m";
		sql += " join reviews r on r.memberno = m.memberno";
		sql += " join books b on r.bookno = b.bookno";
		sql += " left join (select reviewno, count(*) as rCount";
		sql += " from likereviews group by reviewno) l on r.reviewno = l.reviewno";
		sql += " where b.bookno = ?";
		String sql1 = "";
		
		if("L".equals(whichBtn) || whichBtn == null || whichBtn.isEmpty()) {
			sql1 = " order by r.reviewno desc";
			
		} else {
			sql1 = " order by l.rCount desc";
		}
		
		String sql2 = sql + sql1;
		PreparedStatement pstmt = null; // 문장 객체
		ResultSet rs = null;
		
		List<Book> dataList = new ArrayList<Book>();
		
		super.conn = super.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql2);
			System.out.println("sql2 구문 : ");
			System.out.println(sql2);
			pstmt.setInt(1, bookNo);
			rs = pstmt.executeQuery();
			
			// 요소들을 읽어서 컬렉션에 담습니다.
			while(rs.next()) {
				Book bean = this.resultSet2Bean2(rs);
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
	
	public List<Book> getDataList(Paging paging){
		// 페이징 처리를 이용하여 데이터를 조회합니다.
		String sql = "select *";
		sql += " from (select rank() over(order by bookno) as ranking, b.*";
		sql += " from books b";
		
		// 필드 검색을 위해 mode 변수로 분기 처리 하도록 합니다.
		String mode = paging.getMode();
		String keyword = paging.getKeyword();
		if (keyword != null && !keyword.equals("null") && !keyword.equals("") || mode.equals("")) {
		    sql += " where (booktitle like '%" + keyword + "%' or author like '%" + keyword + "%')";
		}

		if (!"all".equals(mode)) {
		    if (sql.contains("where")) {
		        sql += " and";
		    } else {
		        sql += " where";
		    }
		    sql += " genreno = " + mode;
		}
		
		sql += " )";
		//sql += " where ranking between ? and ? ";
		
		System.out.println("sql 구문 :\n" + sql);
		
		
		PreparedStatement pstmt = null; // 문장 객체
		ResultSet rs = null;
		
		List<Book> dataList = new ArrayList<Book>();
		
		super.conn = super.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			//pstmt.setInt(1, paging.getBeginRow());
			//pstmt.setInt(2, paging.getEndRow());
			rs = pstmt.executeQuery();
			
			// 요소들을 읽어서 컬렉션에 담습니다.
			while(rs.next()) {
				Book bean = this.resultSet2Bean(rs);
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
	
	/*public void updateReadhit(int no) {
		String sql = "update boards set readhit = readhit + 1 where no = ?";
		PreparedStatement pstmt = null;
		int cnt = -1;
		
		try {
			super.conn = super.getConnection();
			// 자동 커밋 기능을 비활성 합니다.
			// 실행이 성공적으로 완료되면 커밋 하도록 commit() 메소드를 명시합니다.
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			cnt = pstmt.executeUpdate();
			conn.commit();
			
		}catch (Exception e) {
			e.printStackTrace();
			
			try {
				conn.rollback();
			} catch (SQLException e1) {
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
	}*/
}
