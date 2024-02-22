package com.livre.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.livre.model.bean.Genres;
import com.livre.model.bean.LikeReview;
import com.livre.model.bean.Member;
import com.livre.model.bean.MyReview;

public class MemberDao extends SuperDao {
	com.livre.utility.MyUtility MyUtility;

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
			// bean.setTerm_FL(rs.getString("termsFL"));
			// bean.setEnrollDate(rs.getString("enrollDate"));
			// bean.setSns_FL(rs.getString("snsFL"));
			bean.setMemberImg(rs.getString("memberImg"));
			bean.setAddress(rs.getString("address"));
			bean.setGender(rs.getString("gender"));
			bean.setGenreList(rs.getString("genreList"));
			bean.setRankNo(rs.getInt("rankNo"));

			return bean;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	private Genres resultSetGenresBean(ResultSet rs) {
		try {
			Genres bean = new Genres();
			bean.setGenreno(rs.getInt("genreno"));
			bean.setGenre(rs.getString("genre"));
			return bean;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// 내가 좋아하는 목록 Bean
	private LikeReview resultSet3Bean(ResultSet rs) {
		try {
			LikeReview bean = new LikeReview();
			bean.setLikeReviewNo(rs.getInt("likereviewno"));
			bean.setMemberNo(rs.getInt("memberno"));
			bean.setReviewNo(rs.getInt("reviewno"));
			bean.setReviewtitle(rs.getString("reviewtitle"));
			bean.setReviewtext(rs.getString("reviewtext"));
			bean.setBookimg(rs.getString("bookimg"));

			return bean;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	private MyReview resultSet4Bean(ResultSet rs) {
		try {
			MyReview bean = new MyReview();
			bean.setReviewNo(rs.getInt("reviewNo"));
			bean.setMemberNo(rs.getInt("memberNo"));
			bean.setBookNo(rs.getInt("bookNo"));
			bean.setBookTitle(rs.getString("bookTitle"));
			bean.setGenreNo(rs.getString("genreNo"));
			bean.setReviewTitle(rs.getString("reviewTitle"));
			bean.setReviewText(rs.getString("reviewText"));
			bean.setAuthor(rs.getString("author"));
			bean.setPublisher(rs.getString("publisher"));
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
			sql = "INSERT INTO members(memberNo, memberEmail, memberPw, term_FL, genreList, memberNick, gender) VALUES(members_seq.NEXTVAL, ?, ?, ?, ?, ?, ?)";
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

	public int updatePassword(String memberEmail, String newPassword) {
		String sql = "update members set memberPw = ? where memberEmail = ?";
		int updateResult = 0; // 업데이트된 행의 수를 저장할 변수
		PreparedStatement pstmt = null; // PreparedStatement 초기화

		try (Connection conn = super.getConnection()) {
			pstmt = conn.prepareStatement(sql); // SQL 쿼리 준비
			pstmt.setString(1, newPassword); // 첫 번째 파라미터에 새 비밀번호 설정
			pstmt.setString(2, memberEmail); // 두 번째 파라미터에 이메일 설정

			updateResult = pstmt.executeUpdate(); // 쿼리 실행 후 결과 저장

			if (updateResult > 0) {
				System.out.println("비밀번호가 성공적으로 업데이트되었습니다.");
			} else {
				System.out.println("해당 이메일을 가진 사용자를 찾을 수 없습니다.");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close(); // PreparedStatement 자원 해제
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return updateResult; // 업데이트된 행의 수 반환
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

	public List<Genres> getGenresList() {
		String sql = "select * from genres";

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<Genres> dataList = new ArrayList<Genres>();

		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Genres bean = this.resultSetGenresBean(rs);
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
		String sql = " update members set memberNick=?, address=?, genreList=?";
		sql += " where memberNo = ?";

		PreparedStatement pstmt = null;
		int cnt = -9999999;

		try {
			super.conn = super.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, bean.getMemberNick());
			// pstmt.setString(4, bean.getTerm_FL());
			// pstmt.setString(5, bean.getEnrollDate());
			// pstmt.setString(6, bean.getSns_FL());
			pstmt.setString(2, bean.getAddress());
			// pstmt.setString(6, bean.getGender());
			pstmt.setString(3, bean.getGenreList());
			// pstmt.setInt(4, bean.getRankNo());
			//pstmt.setString(4, bean.getMemberImg());
			pstmt.setInt(4, bean.getMemberNo());

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

//	Kakao 로그인 처리를 위한 메서드
//	
//	@param kakaoEmail Kakao 로그인 시 전달된 이메일
//	@return Kakao 이메일을 가진 회원 정보

	public Member getMemberByKakaoEmail(String kakaoEmail) {
		String sql = "SELECT * FROM members WHERE memberEmail = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member bean = null;

		try {
			super.conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, kakaoEmail);

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

//	Kakao 로그인 시 회원으로 등록하는 메서드
//	
//	@param kakaoEmail Kakao 로그인 시 전달된 이메일
//	@return 등록된 회원 정보

	public Member registerKakaoMember(String kakaoEmail) {
		// 필요한 경우 회원 등록에 필요한 추가 정보를 받아서 처리할 수 있습니다.
		String sql = "INSERT INTO members (memberNo, memberEmail, term_FL) VALUES (members_seq.NEXTVAL, ?, 'Y')";
		PreparedStatement pstmt = null;
		Member registeredMember = null;

		try {
			super.conn = super.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, kakaoEmail);

			int rowCount = pstmt.executeUpdate();

			if (rowCount > 0) {
				// 등록된 회원 정보를 가져옵니다.
				registeredMember = getMemberByKakaoEmail(kakaoEmail);
			}

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

		return registeredMember;
	}

	public Member getDataEmail(String memberEmail) {
		String sql = "select * from members ";
		sql += " where memberEmail = ?";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member bean = null;

		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberEmail);
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
		System.out.println("memberEmail로 조회 결과 :");
		System.out.println(bean);

		return bean;
	}

	public int updateImg(Member bean) {

		String sql = " update members set memberImg=?";
		sql += " where memberNo = ?";

		PreparedStatement pstmt = null;
		int cnt = -9999999;

		try {
			super.conn = super.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, bean.getMemberImg());
			pstmt.setInt(2, bean.getMemberNo());

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

	public int deleteData(int id) {
		int cnt = -1;
		String sql = "";
		Member bean = this.getDataBean(id);
		PreparedStatement pstmt = null;
		conn = super.getConnection();

		try {
			conn.setAutoCommit(false);

			// LIKEREVIEWS 삭제
			sql = " delete from LIKEREVIEWS where MEMBERNO = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bean.getMemberNo());
			cnt = pstmt.executeUpdate();
			if (pstmt != null) {
				pstmt.close();
			}

			// 리뷰 삭제
			sql = " DELETE FROM REVIEWS where MEMBERNO = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bean.getMemberNo());
			cnt = pstmt.executeUpdate();
			if (pstmt != null) {
				pstmt.close();
			}
						
			// 회원정보 삭제
			sql = " delete from members where MEMBERNO = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bean.getMemberNo());
			cnt = pstmt.executeUpdate();
			if (pstmt != null) {
				pstmt.close();
			}
			
			

			conn.commit();

		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			try {
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
	}

	public Member getDataBean(String memberEmail) {
		String sql = " select * from members ";
		sql += " where memberEmail = ?";
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Member bean = null;
		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberEmail);
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

	public List<LikeReview> getDataLikeReviewBean(int memberNo) {
		String sql = "";
		sql += " select a.likereviewno";
		sql += " 		  , a.memberno";
		sql += " 		  , a.reviewno";
		sql += " 		  , c.reviewtitle";
		sql += " 		  , c.reviewtext";
		sql += " 		  , d.bookimg";
		sql += " 		  from likereviews a inner join members b";
		sql += " 		                 on a.memberno = b.memberno ";
		sql += " 		                 inner join reviews c";
		sql += " 		                 on a.reviewno = c.reviewno";
		sql += " 		                 inner join books d";
		sql += " 		                 on c.bookno = d.bookno";
		sql += " 		 where a.memberno = ?";
		sql += " 		 and rownum <= 3";

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<LikeReview> dataList = new ArrayList<LikeReview>();

		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				LikeReview bean = this.resultSet3Bean(rs);
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
	
	
	
	public List<MyReview> getDataLikeReviewAllBean(int memberNo) {
		String sql = "";
		sql += " select c.*, d.*";
		sql += " 		  from likereviews a inner join members b";
		sql += " 		                 on a.memberno = b.memberno ";
		sql += " 		                 inner join reviews c";
		sql += " 		                 on a.reviewno = c.reviewno";
		sql += " 		                 inner join books d";
		sql += " 		                 on c.bookno = d.bookno";
		sql += " 		 where a.memberno = ?";

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<MyReview> dataList = new ArrayList<MyReview>();

		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MyReview bean = this.resultSet4Bean(rs);
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

}
