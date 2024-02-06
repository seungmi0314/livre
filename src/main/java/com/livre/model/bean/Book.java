package com.livre.model.bean;

public class Book {
	private int bookNo;	// 책 번호
	private String bookTitle;	// 책 제목
	private String author;	// 작가
	private String publisher;	// 출판사
	private String bookImg;	// 책 이미지
	private String bookContent; // 책 내용
	private int genreNo;	// 장르 번호
	
	// 기본 생성자
	public Book() {}

	// 매개 변수 생성자
	public Book(int bookNo, String bookTitle, String author, String publisher, String bookImg, int genreNo, String bookContent) {
		super();
		this.bookNo = bookNo;
		this.bookTitle = bookTitle;
		this.author = author;
		this.publisher = publisher;
		this.bookImg = bookImg;
		this.genreNo = genreNo;
		this.bookContent = bookContent;
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
				+ ", bookImg=" + bookImg + ", bookContent=" + bookContent + ", genreNo=" + genreNo + "]";
	}
	
	
	
	
}
