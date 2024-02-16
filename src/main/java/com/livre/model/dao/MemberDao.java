package com.livre.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.livre.model.bean.Member;
import com.livre.model.bean.MyReview;

public class MemberDao extends SuperDao {

	public Member getDataByEmailAndPassword(String memberEmail, String memberPw) {
		// 이메일과 비밀번호를 이용하여 해당 회원이 존재하는지 확인합니다.
		String sql = "select * from members ";
		sql += "where memberEmail = ? and memberPw = ?";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member bean = null;

		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberEmail);
			pstmt.setString(2, memberPw);
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
		return bean;
	}

	private Member resultSet2Bean(ResultSet rs) {
		try {
			Member bean = new Member();
			bean.setMemberNo(rs.getInt("memberNo"));
			bean.setMemberEmail(rs.getString("memberEmail"));
			bean.setMemberPw(rs.getString("memberPw"));
			bean.setMemberNick(rs.getString("memberNick"));

			/*
			 * bean.setTermsFL(rs.getString("termsFL"));
			 * bean.setEnrollDate(rs.getString("enrollDate"));
			 * bean.setSnsFL(rs.getString("snsFL"));
			 * bean.setMemberImg(rs.getString("memberImg"));
			 * bean.setMemberAddress(rs.getString("memberAddress"));
			 * bean.setMemberGender(rs.getString("memberGender"));
			 * bean.setGenreList(rs.getInt("genreList")); bean.setRankNo(rs.getInt("rankNo"));
			 */

			return bean;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public int insertData(Member bean) {
		// members_seq.NEXTVAL
		System.out.println(bean);
		/*
		 * String
		 * sql=" insert into members( enrollDate, memberNo, genreList, rankNo, memberEmail, memberPw, memberNick, term_FL, sns_FL, memberImg, Address, Gender) "
		 * ; sql +=
		 * " values(default, 2, 1, 1, ?, ? , null, null, default, null, null, null)";
		 */
		/*
		 * String sql=" insert into members(memberNo, memberEmail, memberPw, term_FL) ";
		 * sql += " values(members_seq.NEXTVAL, ?,?,?)";
		 */
		PreparedStatement pstmt = null;
		int cnt = -999999;

		String sql = "";
		if (bean.getMemberNick() == null && bean.getGender() == null && bean.getGenreList() == "") {
			// 건너뛰기 버튼을 눌렀을 때 필요한 정보만 받아서 DB에 저장
			sql = "INSERT INTO members(memberNo, memberEmail, memberPw, term_FL) VALUES(members_seq.NEXTVAL, ?, ?, ?)";
		} else {
			// 다음을 눌렀을 때 추가 정보까지 받아서 DB에 저장
			sql = "INSERT INTO members(memberNo, memberEmail, memberPw, term_FL, genreList, gender, memberNick) VALUES(members_seq.NEXTVAL, ?, ?, ?, ?, ?, ?)";
		}

		try {
			super.conn = super.getConnection();
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, bean.getMemberEmail());
			pstmt.setString(2, bean.getMemberPw());
			pstmt.setString(3, bean.getTerm_FL());
			pstmt.setString(4, bean.getGenreList());
			pstmt.setString(5, bean.getMemberNick());
			pstmt.setString(6, bean.getGender());

			cnt = pstmt.executeUpdate();
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
	}

	public Member getMemberByEmail(String memberEmail) {

		// 이메일을 이용하여 해당 회원이 존재하는지 확인합니다.
		String sql = " select * from members where memberEmail = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member bean = null;

		try {
			super.conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberEmail);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				bean = resultSet2Bean(rs);
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

		return bean;

	}

	public void updatePassword(String memberEmail, String newPassword) {
		String sql = " update members set memberPw = ? where memberEmail = ?";
		PreparedStatement pstmt = null;
		try {
			super.conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPassword);
			pstmt.setString(2, memberEmail);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	public Member getDataBean(int memberNo) {
		String sql = "select * from members ";
		sql += " where memberNo = ?";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member bean = null;

		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
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
		System.out.println("memberNo로 조회 결과 :");
		System.out.println(bean);

		return bean;
	}

	public List<Member> getDataList() {
		String sql = "select * from members";

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<Member> dataList = new ArrayList<Member>();

		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Member bean = this.resultSet2Bean(rs);
				dataList.add(bean);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {// 200p 5번
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

		return dataList;
	}

	public int updateData(Member bean) {
		String sql = " update members set memberEmail=?, memberPw=?, memberNick=?, memberImg=?, address=?, genreList=?, rankNo=? ";
		sql += " where memberNo = ?";

		PreparedStatement pstmt = null;
		int cnt = -9999999;

		try {
			super.conn = super.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, bean.getMemberEmail());
			pstmt.setString(2, bean.getMemberPw());
			pstmt.setString(3, bean.getMemberNick());
			// pstmt.setString(4, bean.getTerm_FL());
			// pstmt.setString(5, bean.getEnrollDate());
			// pstmt.setString(6, bean.getSns_FL());
			pstmt.setString(4, bean.getMemberImg());
			pstmt.setString(5, bean.getAddress());
			// pstmt.setString(6, bean.getGender());
			pstmt.setString(6, bean.getGenreList());
			pstmt.setInt(7, bean.getRankNo());
			pstmt.setInt(8, bean.getMemberNo());

			cnt = pstmt.executeUpdate();
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
				if (pstmt != null) {
					pstmt.close();
				}
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
	}

	public int updateMemberPwWithAuthkey(String memberEmail, String authkey) {
		String sql = "UPDATE members SET memberPw = ? WHERE memberEmail = ?";

		PreparedStatement pstmt = null;
		int updateResult = 0;

		try {
			super.conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);

			// authkey를 새로운 비밀번호로 사용하여 업데이트
			pstmt.setString(1, authkey);
			pstmt.setString(2, memberEmail);

			updateResult = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return updateResult;
	}
}
