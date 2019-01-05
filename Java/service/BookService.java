package finalProject.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import finalProject.models.Book;

public class BookService {
	
	int bookID;
	String title;
	String author;
	String genre;
	int pageCount;
	String isbn;
	String summary;
	boolean isAvailable;
	String filePath;
	
	static ArrayList <String> BookList = new ArrayList <String> ();
	
	public BookService(int bookID, String title, String author, String genre, int pageCount, String isbn,
			String summary, boolean isAvailable, String filePath) {
		super();
		this.bookID = bookID;
		this.title = title;
		this.author = author;
		this.genre = genre;
		this.pageCount = pageCount;
		this.isbn = isbn;
		this.summary = summary;
		this.isAvailable = isAvailable;
		this.filePath = filePath;
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
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
	public BookService(){

	}

	public BookService(String filePath) {
		super();
		this.filePath = filePath;
	}
	
	public void promptAddBook(){
		
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("Enter Book ID: ");
		Scanner input = new Scanner(System.in);
		int bookID1 = input.nextInt();
		
		System.out.print("Enter Book Title: ");
		Scanner input1 = new Scanner(System.in);
		String title1 = input.next();
			
		Scanner input2 = new Scanner(System.in);
		System.out.print("Enter Book Author: ");
		String author1 = input.next(); 
		
		System.out.print("Enter Book Genre: ");
		Scanner input3 = new Scanner(System.in);
		String genre1 = input.next();
		
		System.out.print("Enter Book pageCount: ");
		Scanner input4 = new Scanner(System.in);
		int pageCount1 = input.nextInt();
		
		System.out.print("Enter Book ISBN: ");
		Scanner input6 = new Scanner(System.in);
		String isbn1 = input.next();
		
		System.out.print("Enter Book Summary: ");
		Scanner input7 = new Scanner(System.in);
		String summary1 = input.next();
		
		System.out.print("Enter true if book is available: ");
		Scanner input8 = new Scanner(System.in);
		boolean isAvailable = input.next() != null;
		
		Book book = new Book(bookID1, title1, author1, genre1, pageCount1, isbn1, summary1, isAvailable);			
		BookList.add(title1);

		System.out.println("-----You have successfully added a new book!-----");
	}
	
	//write something like, the book already exists.
	
	public String addBook(){

		String error = null;
		List<String> lines;
		try {
			lines = Files.readAllLines(Paths.get(filePath));
			lines.add(this.bookID + "," + this.title + "," + this.author + "," + this.genre + "," + this.pageCount + "," + this.isbn + "," + this.summary + "," + this.isAvailable);
			Files.write(Paths.get(filePath), lines);
		} catch (IOException e) {
			error = "Adding a new Book failed!" + e.getMessage();
			e.printStackTrace();
		}
		
		return error;
		
	}
	

}
