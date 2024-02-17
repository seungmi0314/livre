package com.livre.model.bean;

public class Member {
	private int memberNo;
	private String memberEmail;
	private String memberPw;
	private String memberNick;
	private String term_FL;
	private String enrollDate;
	private String sns_FL;
	private String memberImg;
	private String address;
	private String gender;
	private String genreList;
	

	private int rankNo;
	
	public Member() {
	}

	public Member(int memberNo, String memberEmail, String memberPw, String memberNick, String term_FL,
			String enrollDate, String sns_FL, String memberImg, String address, String gender, String genreList,
			int rankNo) {
		super();
		this.memberNo = memberNo;
		this.memberEmail = memberEmail;
		this.memberPw = memberPw;
		this.memberNick = memberNick;
		this.term_FL = term_FL;
		this.enrollDate = enrollDate;
		this.sns_FL = sns_FL;
		this.memberImg = memberImg;
		this.address = address;
		this.gender = gender;
		this.genreList = genreList;
		this.rankNo = rankNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberNick() {
		return memberNick;
	}

	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}

	public String getTerm_FL() {
		return term_FL;
	}

	public void setTerm_FL(String term_FL) {
		this.term_FL = term_FL;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getSns_FL() {
		return sns_FL;
	}

	public void setSns_FL(String sns_FL) {
		this.sns_FL = sns_FL;
	}

	public String getMemberImg() {
		return memberImg;
	}

	public void setMemberImg(String memberImg) {
		this.memberImg = memberImg;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getGenreList() {
		return genreList;
	}

	public void setGenreList(String genreNo) {
		this.genreList = genreNo;
	}

	public int getRankNo() {
		return rankNo;
	}

	public void setRankNo(int rankNo) {
		this.rankNo = rankNo;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberEmail=" + memberEmail + ", memberPw=" + memberPw
				+ ", memberNick=" + memberNick + ", term_FL=" + term_FL + ", enrollDate=" + enrollDate + ", sns_FL="
				+ sns_FL + ", memberImg=" + memberImg + ", Address=" + address + ", Gender=" + gender + ", genreNo="
				+ genreList + ", rankNo=" + rankNo + "]";
	}


}
