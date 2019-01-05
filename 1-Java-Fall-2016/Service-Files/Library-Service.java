package finalProject.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.Scanner;

public class LibraryService {


	public static void main(String [] args){

		boolean isUserLoggedIn = false;
		String userEmail = "";


		String usersFile = null, booksFile = null, checkOutFile = null, adminLoginFile = null;
		try {
			List<String> lines = Files.readAllLines(Paths.get("C:/javadevelopment/IS 247 Spring/src/finalProject/service/resources/paths.txt"));
			usersFile = lines.get(0);
			booksFile = lines.get(1);
			checkOutFile = lines.get(2);
			adminLoginFile = lines.get(3);

		} catch (IOException e) {
			System.err.println("Error! Incorrect Paths.txt: " + e.getMessage());
			e.printStackTrace();
		}


		Scanner scanner = new Scanner(System.in);

		boolean isExitRequested = false;
		UserService userService = new UserService(usersFile);

		while(!isExitRequested){
			
			System.out.println("Welcome to UMBC Library!");
			System.out.println("Please choose an Option: ");
			
			if(!isUserLoggedIn){
				
				System.out.println("1. Login");
				System.out.println("2. Register");
				System.out.println("3. Admin Login");
				System.out.println("4. Exit");
				
				int option = scanner.nextInt();
				switch(option){
				
				case 1:
					checkAndValidateUserLogin(userService);
					boolean loginResult = userService.login();
					while (!loginResult){
						System.out.println("Invalid user email or password. Please Enter again! ");
						checkAndValidateUserLogin(userService);
						loginResult = userService.login();
					}
					if (loginResult){
						isUserLoggedIn = true;
						userEmail = userService.getEmail();
						System.out.println("Login successful!");
					}
					break;
					
				case 2: 
					checkAndValidateUser(userService);

					if (!userService.checkForUser()){
						String insertResult = userService.insertUser();
						while (insertResult != null){
							System.out.println(insertResult);
							checkAndValidateUser(userService);
							if (!userService.checkForUser()){
								insertResult = userService.insertUser();
							} else{
								System.out.println("Error! Email already exists.");
							}
						}
						if (insertResult == null){
							isUserLoggedIn = true;
							userEmail = userService.getEmail();
							
							System.out.println("User created successfully!!");
						}
						
					} else{
						
						System.out.println("Error! Email already exists.");
					}
					break;
					
				case 3:
					
					checkAndValidateAdminLogin(userService);
					boolean adminLoginResult = userService.login();
					while (!adminLoginResult){
						System.out.println("Invalid user email or password. Please Enter again! ");
						checkAndValidateAdminLogin(userService);
						loginResult = userService.login();
					}
					if (adminLoginResult){
						isUserLoggedIn = true;
						userEmail = userService.getEmail();
						System.out.println("Admin Login successful!");
					}
					
					boolean isExitRequested1 = false;
					UserService userService1 = new UserService(usersFile);
					BookService bookService = new BookService(booksFile);
					

					while(!isExitRequested1){
						
						System.out.println("Please select an Option! ");
						System.out.println("1. Add Book");
						System.out.println("2. Remove Book");
						System.out.println("3. Add User");
						System.out.println("4. Remove User");
						System.out.println("5. User Search");
						System.out.println("6. Modify User");
						System.out.println("7. Search Book");
						System.out.println("8. Exit");
											
						int option1 = scanner.nextInt();
						switch(option1){
						
						case 1: 
							
							addingNewBook(bookService);
							
							break;
							
						case 2:
							
							break;
							
						case 3:
							
							break;
							
						case 4:
							
							break;
							
						case 5:
							
							break;
							
						case 6:
							
							break;
							
						case 7:
							
							break;
							
						case 8:
							
							isExitRequested1 = true;
							System.out.println("Exited Successfully!");
							
							break;
							
						default: 
							System.out.println("Invalid Option! Choose again.");
							
						}
						
					
					}
				

					break;
					
				case 4:

					isExitRequested1 = true;
					System.out.println("Exited Successfully!");

					break;

				default: 
					System.out.println("Invalid Option! Choose again.");
				}
			
			} else {
				
				System.out.println("1. Title Search");
				System.out.println("2. Book Detail Display");
				System.out.println("3. Check out");
				System.out.println("4. Exit");
				
				int option = scanner.nextInt();
				switch(option){
				
				case 1:
				
					break;
					
				case 2:
					
					break;
					
				case 3:
					
					break;
					
				case 4:
					
					isExitRequested = true;
					System.out.println("Exited Successfully!");
					
					break;
					
				default: 
					System.out.println("Invalid Option! Choose again.");
					
					break;					
				}
			}


		}
	}

	private static void addingNewBook(BookService bookService) {
		bookService.addBook();
		
		
	}

	private static void checkAndValidateUser(UserService userService) {
		userService.promptUserRegister();
		String validationResult = userService.validateFieldsRegister();
		while(validationResult != null){
			System.out.println(validationResult);
			userService.promptUserRegister();
			validationResult = userService.validateFieldsRegister();
		}
	}

	private static void checkAndValidateUserLogin(UserService userService) {
		userService.promptUserLogin();
		String validationResult = userService.validateFieldsLogin();
		while(validationResult != null){
			System.out.println(validationResult);
			userService.promptUserLogin();
			validationResult = userService.validateFieldsLogin();
		}
	}

		private static void checkAndValidateAdminLogin(UserService userService) {
			userService.promptAdminLogin();
			String validationResult = userService.validateFieldsAdminLogin();
			while(validationResult != null){
				System.out.println(validationResult);
				userService.promptAdminLogin();
				validationResult = userService.validateFieldsAdminLogin();
			}
	}

}
