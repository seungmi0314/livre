package com.livre.model.bean;

public class Member {
	private int memberNo;
	private String memberEmail;
	private String memberPw;
	private String memberNick;
	private String termsFL;
	private String enrollDate;
	private String snsFL;
	private String memberImg;
	private String memberAddress;
	
	private int genreNo;
	private int reivewNo;
	private int rankNo;
	
	
	// 기본 생성자
	public Member() {
		
	}


	// 매개변수 생성자
	public Member(int memberNo, String memberEmail, String memberPw, String memberNick, String termsFL,
			String enrollDate, String snsFL, String memberImg, String memberAddress, int genreNo, int reivewNo,
			int rankNo) {
		super();
		this.memberNo = memberNo;	// 회원 번호
		this.memberEmail = memberEmail;	// 이메일
		this.memberPw = memberPw;	// 비밀번호
		this.memberNick = memberNick;	// 닉네임
		this.termsFL = termsFL;	// 약관 동의 여부
		this.enrollDate = enrollDate;	// 가입 일자
		this.snsFL = snsFL;	// 간편 가입 여부
		this.memberImg = memberImg;	// 프로필 이미지
		this.memberAddress = memberAddress;	// 주소
		
		this.genreNo = genreNo;	// 장르 번호
		this.reivewNo = reivewNo;	// 리뷰 번호
		this.rankNo = rankNo;	// 등급 번호
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


	public String getTermsFL() {
		return termsFL;
	}


	public void setTermsFL(String termsFL) {
		this.termsFL = termsFL;
	}


	public String getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}


	public String getSnsFL() {
		return snsFL;
	}


	public void setSnsFL(String snsFL) {
		this.snsFL = snsFL;
	}


	public String getMemberImg() {
		return memberImg;
	}


	public void setMemberImg(String memberImg) {
		this.memberImg = memberImg;
	}


	public String getMemberAddress() {
		return memberAddress;
	}


	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}


	public int getGenreNo() {
		return genreNo;
	}


	public void setGenreNo(int genreNo) {
		this.genreNo = genreNo;
	}


	public int getReivewNo() {
		return reivewNo;
	}


	public void setReivewNo(int reivewNo) {
		this.reivewNo = reivewNo;
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
				+ ", memberNick=" + memberNick + ", termsFL=" + termsFL + ", enrollDate=" + enrollDate + ", snsFL="
				+ snsFL + ", memberImg=" + memberImg + ", memberAddress=" + memberAddress + ", genreNo=" + genreNo
				+ ", reivewNo=" + reivewNo + ", rankNo=" + rankNo + "]";
	}
	
	
	
	
}


