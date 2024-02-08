package com.livre.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

// 모든 Dao들이 사용할 공통 변수나 메소드를 정의합니다
public class SuperDao {
	// 접속 객체 conn은 하위 다오들이 접근할 수 있도록 합니다
	protected Connection conn = null;
	
	// 모든 테이블들이 동일한 방식으로 사용하므로 final 메소드로 작성하였습니다.
	public final int getTotalRecordCount(String tableName, String mode, String keyword) {
		System.out.print("검색할 장르 번호 : " + mode);
		System.out.println(", 검색할 키워드 : " + keyword);
		
		// 제시한 tableName 이라는 테이블의 총 행의 수를 구해줍니다.
		String sql = "select count(*) as cnt from " + tableName + " ";
		
		if (keyword != null && !keyword.equals("null") && !keyword.equals("")) {
		    sql += "where (booktitle like '%" + keyword + "%' or author like '%" + keyword + "%')";
		}

		if (!"all".equals(mode)) {
		    if (sql.contains("where")) {
		        sql += " and";
		    } else {
		        sql += "where";
		    }
		    sql += " genreno = " + mode;
		}
		
		System.out.println("sql 구문 :\n" + sql);
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cnt = -1;
		
		try {
			this.conn = this.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt("cnt");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				this.closeConnection();
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return cnt;
	}
	
	
	protected void closeConnection() {
		// 작업 종료 후 커넥션 정보를 닫아 줍니다.
		try {
			if(conn != null) {conn.close();}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public SuperDao() {
		String driver ="oracle.jdbc.driver.OracleDriver";
		try {
			Class.forName(driver);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Connection getConnection() {
		// 접속 객체를 구해줍니다
		String url = "jdbc:oracle:thin:@192.168.0.47:1521:xe";
		String id="livre";
		String password = "livre";
		
		try {
			this.conn = DriverManager.getConnection(url, id, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return conn;
	}
}
