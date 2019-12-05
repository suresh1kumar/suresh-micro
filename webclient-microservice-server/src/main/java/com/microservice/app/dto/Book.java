package com.microservice.app.dto;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="Book")
@Table(name="BOOK")

public class Book {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "BOOK_TITLE")
	private String bookTitle;
	@Column(name = "AUTHOR_NAME")
	private String authorName;
	@Column(name = "BOOK_DESCRIPTION")
	private String bookDescription;
	@Column(name = "BOOK_PRICE")
	private int bookPrice;
	@Column(name = "ISBN")
	private int isbn;
	
	@Column(name = "CREATE_DATE")
	private Date createDate = new Date();

	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	

	public Book(int id, String bookTitle, String authorName, String bookDescription, int bookPrice, int isbn,
			Date createDate) {
		super();
		this.id = id;
		this.bookTitle = bookTitle;
		this.authorName = authorName;
		this.bookDescription = bookDescription;
		this.bookPrice = bookPrice;
		this.isbn = isbn;
		this.createDate = createDate;
	}




	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public String getBookDescription() {
		return bookDescription;
	}

	public void setBookDescription(String bookDescription) {
		this.bookDescription = bookDescription;
	}

	public int getBookPrice() {
		return bookPrice;
	}

	public void setBookPrice(int bookPrice) {
		this.bookPrice = bookPrice;
	}

	public int getIsbn() {
		return isbn;
	}

	public void setIsbn(int isbn) {
		this.isbn = isbn;
	}

	@Override
	public String toString() {
		return "Book [id=" + id + ", bookTitle=" + bookTitle + ", authorName=" + authorName + ", bookDescription="
				+ bookDescription + ", bookPrice=" + bookPrice + ", isbn=" + isbn + ", createDate=" + createDate + "]";
	}

}
