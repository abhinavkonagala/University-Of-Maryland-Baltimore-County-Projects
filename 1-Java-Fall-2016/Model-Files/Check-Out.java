package finalProject.models;

import java.util.Date;

public class CheckOut {
	
	String email;
	int bookID;
	Date checkOutDate;
	Date returnDate;
	
	public CheckOut(String email, int bookID, Date checkOutDate, Date returnDate) {
		super();
		this.email = email;
		this.bookID = bookID;
		this.checkOutDate = checkOutDate;
		this.returnDate = returnDate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getBookID() {
		return bookID;
	}
	public void setBookID(int bookID) {
		this.bookID = bookID;
	}
	public Date getCheckOutDate() {
		return checkOutDate;
	}
	public void setCheckOutDate(Date checkOutDate) {
		this.checkOutDate = checkOutDate;
	}
	public Date getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}

}
