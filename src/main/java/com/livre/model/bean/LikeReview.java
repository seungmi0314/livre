package com.livre.model.bean;

public class LikeReview {
	private int likeReviewNo; // 북마크 번호
	private int memberNo; // 회원 번호
	private int reviewNo; // 리뷰 번호
	
	private String reviewtitle;
	private String reviewtext;
	private String bookimg;
	
	public String getReviewtitle() {
		return reviewtitle;
	}
	public void setReviewtitle(String reviewtitle) {
		this.reviewtitle = reviewtitle;
	}
	public String getReviewtext() {
		return reviewtext;
	}
	public void setReviewtext(String reviewtext) {
		this.reviewtext = reviewtext;
	}
	public String getBookimg() {
		return bookimg;
	}
	public void setBookimg(String bookimg) {
		this.bookimg = bookimg;
	}
	public int getLikeReviewNo() {
		return likeReviewNo;
	}
	public void setLikeReviewNo(int likeReviewNo) {
		this.likeReviewNo = likeReviewNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	
	public LikeReview() {}
	
	public LikeReview(int likeReviewNo, int memberNo, int reviewNo) {
		super();
		this.likeReviewNo = likeReviewNo;
		this.memberNo = memberNo;
		this.reviewNo = reviewNo;
	}
	
	@Override
	public String toString() {
		return "LikeReview [likeReviewNo=" + likeReviewNo + ", memberNo=" + memberNo + ", reviewNo=" + reviewNo + "]";
	}
	
}
