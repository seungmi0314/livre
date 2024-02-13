package com.livre.model.bean;

public class Book {
	private int bookNo;	// 책 번호
	private String bookTitle;	// 책 제목
	private String author;	// 작가
	private String publisher;	// 출판사
	private String bookImg;	// 책 이미지
	private String bookContent; // 책 내용
	private int genreNo;	// 장르 번호
	
	private int reviewNo; // 리뷰 번호
	private int memberNo;	// 회원 번호
	private String memberImg; // 유저 프로필 이미지
	private String memberNick; // 유저 닉네임
	private String reviewTitle; // 독후감 제목
	private String reviewText; // 독후감 내용
	private String createDate;	// 작성일자
	private int readHit;	// 조회수
	
	// 기본 생성자
	public Book() {}

	// 매개 변수 생성자
	public Book(int bookNo, String bookTitle, String author, String publisher, String bookImg, String bookContent,
			int genreNo, int reviewNo, int memberNo, String memberImg, String memberNick, String reviewTitle, String reviewText,
			String createDate, int readHit) {
		super();
		this.bookNo = bookNo;
		this.bookTitle = bookTitle;
		this.author = author;
		this.publisher = publisher;
		this.bookImg = bookImg;
		this.bookContent = bookContent;
		this.genreNo = genreNo;
		this.reviewNo = reviewNo;
		this.memberNo = memberNo;
		this.memberImg = memberImg;
		this.memberNick = memberNick;
		this.reviewTitle = reviewTitle;
		this.reviewText = reviewText;
		this.createDate = createDate;
		this.readHit = readHit;
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

	public String getMemberImg() {
		return memberImg;
	}

	public void setMemberImg(String memberImg) {
		this.memberImg = memberImg;
	}

	public String getMemberNick() {
		return memberNick;
	}

	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
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

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public int getReadHit() {
		return readHit;
	}

	public void setReadHit(int readHit) {
		this.readHit = readHit;
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
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

	public int getGenreNo() {
		return genreNo;
	}

	public void setGenreNo(int genreNo) {
		this.genreNo = genreNo;
	}

	public String getBookContent() {
		return bookContent;
	}
	
	public void setBookContent(String bookContent) {
		this.bookContent = bookContent;
	}

	@Override
	public String toString() {
		return "Book [bookNo=" + bookNo + ", bookTitle=" + bookTitle + ", author=" + author + ", publisher=" + publisher
				+ ", bookImg=" + bookImg + ", bookContent=" + bookContent + ", genreNo=" + genreNo + ", reviewNo=" + reviewNo
				+ ", memberNo=" + memberNo + ", memberImg=" + memberImg + ", memberNick=" + memberNick + ", reviewTitle=" + reviewTitle
				+ ", reviewText=" + reviewText + ", createDate=" + createDate + ", readHit=" + readHit + "]";
	}
	
	
	
	
}
