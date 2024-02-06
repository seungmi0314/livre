package com.livre.model.bean;

public class MyReview {
	private int reviewNo;	// 리뷰 번호
	private int memberNo;	// 회원 번호
	private int bookNo;	//  책 번호
	private int genreNo;	// 장르 번호
	private String reviewTitle;	// 독후감 제목
	private String reviewText;	// 독후감 내용
	private int raiting;	// 별점
	private String createDate;	// 작성일자
	private String phrase;	// 글귀
	private String startDate;	// 시작일자
	private String endDate;	// 끝 일자
	private int readHit;	// 조회수
	
	
	private String bookTitle;	// 책 제목
	private String author;	// 작가
	private String publisher;	// 출판사
	private String bookImg;	// 책 이미지
	private String bookContent; // 책 내용
	
	
	public MyReview() {}


	public MyReview(int reviewNo, int memberNo, int bookNo, int genreNo, String reviewTitle, String reviewText,
			int raiting, String createDate, String phrase, String startDate, String endDate, int readHit,
			String bookTitle, String author, String publisher, String bookImg, String bookContent) {
		super();
		this.reviewNo = reviewNo;
		this.memberNo = memberNo;
		this.bookNo = bookNo;
		this.genreNo = genreNo;
		this.reviewTitle = reviewTitle;
		this.reviewText = reviewText;
		this.raiting = raiting;
		this.createDate = createDate;
		this.phrase = phrase;
		this.startDate = startDate;
		this.endDate = endDate;
		this.readHit = readHit;
		this.bookTitle = bookTitle;
		this.author = author;
		this.publisher = publisher;
		this.bookImg = bookImg;
		this.bookContent = bookContent;
	}


	public int getReviewNo() {
		return reviewNo;
	}


	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public int getBookNo() {
		return bookNo;
	}


	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}


	public int getGenreNo() {
		return genreNo;
	}


	public void setGenreNo(int genreNo) {
		this.genreNo = genreNo;
	}


	public String getReviewTitle() {
		return reviewTitle;
	}


	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}


	public String getReviewText() {
		return reviewText;
	}


	public void setReviewText(String reviewText) {
		this.reviewText = reviewText;
	}


	public int getRaiting() {
		return raiting;
	}


	public void setRaiting(int raiting) {
		this.raiting = raiting;
	}


	public String getCreateDate() {
		return createDate;
	}


	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}


	public String getPhrase() {
		return phrase;
	}


	public void setPhrase(String phrase) {
		this.phrase = phrase;
	}


	public String getStartDate() {
		return startDate;
	}


	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}


	public String getEndDate() {
		return endDate;
	}


	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}


	public int getReadHit() {
		return readHit;
	}


	public void setReadHit(int readHit) {
		this.readHit = readHit;
	}


	public String getBookTitle() {
		return bookTitle;
	}


	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}


	public String getAuthor() {
		return author;
	}


	public void setAuthor(String author) {
		this.author = author;
	}


	public String getPublisher() {
		return publisher;
	}


	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}


	public String getBookImg() {
		return bookImg;
	}


	public void setBookImg(String bookImg) {
		this.bookImg = bookImg;
	}


	public String getBookContent() {
		return bookContent;
	}


	public void setBookContent(String bookContent) {
		this.bookContent = bookContent;
	}


	@Override
	public String toString() {
		return "MyReview [reviewNo=" + reviewNo + ", memberNo=" + memberNo + ", bookNo=" + bookNo + ", genreNo="
				+ genreNo + ", reviewTitle=" + reviewTitle + ", reviewText=" + reviewText + ", raiting=" + raiting
				+ ", createDate=" + createDate + ", phrase=" + phrase + ", startDate=" + startDate + ", endDate="
				+ endDate + ", readHit=" + readHit + ", bookTitle=" + bookTitle + ", author=" + author + ", publisher="
				+ publisher + ", bookImg=" + bookImg + ", bookContent=" + bookContent + "]";
	}
	
	
}
