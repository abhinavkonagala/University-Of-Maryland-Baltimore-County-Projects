package finalProject.models;

import java.util.List;

public class User {

	String name;
	String email;
	String password;
	List<Book> checkedOutBooks;
	List<CheckOut> checkOutHistory;
	
		
	public User(String name, String email, String password, List<Book> checkedOutBooks,
			List<CheckOut> checkOutHistory) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.checkedOutBooks = checkedOutBooks;
		this.checkOutHistory = checkOutHistory;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public List<Book> getCheckedOutBooks() {
		return checkedOutBooks;
	}
	public void setCheckedOutBooks(List<Book> checkedOutBooks) {
		this.checkedOutBooks = checkedOutBooks;
	}
	public List<CheckOut> getCheckOutHistory() {
		return checkOutHistory;
	}
	public void setCheckOutHistory(List<CheckOut> checkOutHistory) {
		this.checkOutHistory = checkOutHistory;
	}
	

}
