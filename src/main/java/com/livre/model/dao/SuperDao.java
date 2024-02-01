package com.livre.model.dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// 모든 Dao들이 사용할 공통 변수나 메소드를 정의합니다
public class SuperDao {
	// 접속 객체 conn은 하위 다오들이 접근할 수 있도록 합니다
	protected Connection conn = null;
	
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
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
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
