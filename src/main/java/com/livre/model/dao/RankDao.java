package com.livre.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.livre.model.bean.Rank;

public class RankDao extends SuperDao{
	
	public Rank getDataBean(int rankNo) {
		String sql = "select * from rank ";
		sql += " where rankNo = ?";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Rank bean = null;

		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rankNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean = this.resultSet2Bean(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				super.closeConnection();

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		System.out.println("rankNo로 조회 결과 :");
		System.out.println(bean);

		return bean;
	}

	private Rank resultSet2Bean(ResultSet rs) {
		try {
			Rank bean = new Rank();
			bean.setRankNo(rs.getInt("rankNo"));
			bean.setRankName(rs.getString("rankName"));

			return bean;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
