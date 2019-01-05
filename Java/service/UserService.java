package finalProject.service;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.Scanner;

public class UserService {
	
	String name;
	String email;
	String password;
	String filePath;
	
	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public UserService(){
		
	}
	
	public UserService(String filePath) {
		super();
		this.filePath = filePath;
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
	
	public void promptUserRegister(){
		Scanner scanner = new Scanner(System.in);
		System.out.println("Enter Name ");
		this.name = scanner.nextLine();
		
		System.out.println("Enter Email ");
		this.email = scanner.nextLine();
		
		System.out.println("Enter Password ");
		this.password = scanner.nextLine();
		
	}
	
	public String validateFieldsRegister(){
		if (name == null || name.equalsIgnoreCase("")){
			return "Name cannot be blank!!";
		}
		
		if (email == null || email.equalsIgnoreCase("")){
			return "Email cannot be blank!!";
		}
		
		if (password == null || password.equalsIgnoreCase("")){
			return "Password cannot be blank!!";
		} else if(password.length() <= 7){
			return "Password must be at least 8 characters!!";
		}
		
		return null;
		
	}
	
	public void promptUserLogin(){
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("Enter Email ");
		this.email = scanner.nextLine();
		
		System.out.println("Enter Password ");
		this.password = scanner.nextLine();
		
	}
	
	public String validateFieldsLogin(){
			
		if (email == null || email.equalsIgnoreCase("")){
			return "Email cannot be blank!!";
		}
		
		if (password == null || password.equalsIgnoreCase("")){
			return "Password cannot be blank!!";
		} else if(password.length() <= 7){
			return "Password must be at least 8 characters!!";
		}
		
		return null;
		
	}
	
	public boolean checkForUser(){
		boolean isUserFound = false;
		try {
			List<String> lines = Files.readAllLines(Paths.get(filePath));
			for (String line : lines){
				String[] list = line.split(",");
				if (this.email.trim().equalsIgnoreCase(list[1].trim())){
					return true;
				}
			}

		} catch (IOException e) {
			System.err.println("Error! Incorrect Paths.txt: " + e.getMessage());
			e.printStackTrace();
		}
		return isUserFound;
		
	}
	
	public boolean login(){
		boolean isUserFound = false;		
		try {
			List<String> lines = Files.readAllLines(Paths.get(filePath));
			for (String line : lines){
				String[] list = line.split(",");
				if (this.email.trim().equalsIgnoreCase(list[1].trim())){
					if (this.password.trim().equals(list[2].trim())){
						return true;
					} else {
						return false;
					}
				}
			}

		} catch (IOException e) {
			System.err.println("Error! Incorrect Paths.txt: " + e.getMessage());
			e.printStackTrace();
		}
		return isUserFound;
		
	}
	
	
	public String insertUser(){

		String error = null;
		List<String> lines;
		try {
			lines = Files.readAllLines(Paths.get(filePath));
			lines.add(this.name + "," + this.email + "," + this.password);
			Files.write(Paths.get(filePath), lines);
		} catch (IOException e) {
			error = "Registration Failed!" + e.getMessage();
			e.printStackTrace();
		}
		
		return error;
		
	}
	
	
	
	public void promptAdminLogin(){
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("Enter Email ");
		this.email = scanner.nextLine();
		
		System.out.println("Enter Password ");
		this.password = scanner.nextLine();
		
	}
	
	public String validateFieldsAdminLogin(){
		
		if (email == null || email.equalsIgnoreCase("")){
			return "Email cannot be blank!!";
		}
		
		if (password == null || password.equalsIgnoreCase("")){
			return "Password cannot be blank!!";
		} else if(password.length() <= 7){
			return "Password must be at least 8 characters!!";
		}
		
		return null;
		
	}
	
	public boolean adminLogin(){
		boolean isUserFound = false;		
		try {
			List<String> lines = Files.readAllLines(Paths.get(filePath));
			for (String line : lines){
				String[] list = line.split(",");
				if (this.email.trim().equalsIgnoreCase(list[1].trim())){
					if (this.password.trim().equals(list[2].trim())){
						return true;
					} else {
						return false;
					}
				}
			}

		} catch (IOException e) {
			System.err.println("Error! Incorrect Paths.txt: " + e.getMessage());
			e.printStackTrace();
		}
		return isUserFound;
		
	}
	
	public String insertAdminUser(){

		String error = null;
		List<String> lines;
		try {
			lines = Files.readAllLines(Paths.get(filePath));
			lines.add(this.email + "," + this.password);
			Files.write(Paths.get(filePath), lines);
		} catch (IOException e) {
			error = "Registration Failed!" + e.getMessage();
			e.printStackTrace();
		}
		
		return error;
		
	}
	

}
