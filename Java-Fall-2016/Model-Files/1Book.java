package finalProject.models;

import java.util.ArrayList;
import java.util.Date;
import java.util.Scanner;

public class Book {
	
	int bookID;
	String title;
	String author;
	String genre;
	int pageCount;
	String isbn;
	String summary;
	boolean isAvailable;
	
	static ArrayList <String> BookList = new ArrayList <String> ();
	
	public Book(int bookID, String title, String author, String genre, int pageCount, String isbn,
			String summary, boolean isAvailable) {
		super();
		this.bookID = bookID;
		this.title = title;
		this.author = author;
		this.genre = genre;
		this.pageCount = pageCount;
		this.isbn = isbn;
		this.summary = summary;
		this.isAvailable = isAvailable;
	}
	public int getBookID() {
		return bookID;
	}
	public void setBookID(int bookID) {
		this.bookID = bookID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public boolean isAvailable() {
		return isAvailable;
	}
	public void setAvailable(boolean isAvailable) {
		this.isAvailable = isAvailable;
	}
	
	public static void addBook(){
		System.out.print("Enter book id: ");
		Scanner input = new Scanner(System.in);
		int bookID1 = input.nextInt();
		
		System.out.print("Enter book title: ");
		Scanner input1 = new Scanner(System.in);
		String title1 = input.next();
			
		Scanner input2 = new Scanner(System.in);
		System.out.print("Enter book author: ");
		String author1 = input.next(); 
		
		System.out.print("Enter book genre: ");
		Scanner input3 = new Scanner(System.in);
		String genre1 = input.next();
		
		System.out.print("Enter book pageCount: ");
		Scanner input4 = new Scanner(System.in);
		int pageCount1 = input.nextInt();
		
		
		System.out.print("Enter book isbn: ");
		Scanner input6 = new Scanner(System.in);
		String isbn1 = input.next();
		
		System.out.print("Enter book summary: ");
		Scanner input7 = new Scanner(System.in);
		String summary1 = input.next();
		
		System.out.print("Enter true if book is available: ");
		Scanner input8 = new Scanner(System.in);
		boolean isAvailable = input.next() != null;
		
		Book book = new Book(bookID1, title1, author1, genre1, pageCount1, isbn1, summary1, isAvailable);			
		BookList.add(title1);

		System.out.println("-----You have successfully added a new book!-----");
		
	}
	
	

}
