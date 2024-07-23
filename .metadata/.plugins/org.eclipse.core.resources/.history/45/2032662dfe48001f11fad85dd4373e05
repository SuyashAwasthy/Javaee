package com.techlabs.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.techlabs.dao.AdminDAO;
import com.techlabs.entity.Customer;
import com.techlabs.entity.Transaction;



@WebServlet("/admin")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private AdminDAO adminDao;
	
    @Resource(name = "jdbc/bankdb")
	private DataSource dataSource;


    @Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		adminDao = new AdminDAO(dataSource);
	}

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String command = request.getParameter("command");
		
	    if (command == null) {
	    	command = "view_admin_home";
	    }
	    
	    System.out.println(command);
	    switch(command) {
	    	case "add_customer":
	    		addCustomer(request, response);
	    		break;
//	    	case "add_bank_account":
//	    		addBankAccount(request, response);
//	    		break;
	    	case "view_transaction":
	    		viewTransaction(request, response);
	    		break;
	    	case "view_customer":
	    		viewCustomer(request, response);
	    		break;
	    	default:
	    		viewAdminHome(request, response);
	    }
	    
	}

	
	
	private void viewAdminHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/adminHome.jsp");
		
		requestDispatcher.forward(request, response);
		
	}


	private void viewCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Customer> customers = null;
		String errorMessage = null;
		
		String search = request.getParameter("search");
		
		if(search != null && search.equals("customerId")) {
			
			try {
	            int searchParameter = Integer.parseInt(request.getParameter("searchValue"));
	            customers = adminDao.viewCustomerById(searchParameter);
	            
	            if(customers.size() == 0) {
	            	errorMessage = "Invalid Customer ID.";
	            }
	            
	        } 
			catch (NumberFormatException e) {
	            errorMessage = "Invalid Customer ID. Please enter a valid number.";
	        }
			
		}
		else if(search != null && search.equals("customerName")) {
			
			String searchParameter = request.getParameter("searchValue");
			
	        if (searchParameter != null && !searchParameter.trim().isEmpty()) {
	            customers = adminDao.viewCustomerByName(searchParameter);
	            
	            if(customers.size() == 0) {
	            	errorMessage = "Invalid Customer Name.";
	            }
	        }
	        else {
	            errorMessage = "Customer Name cannot be empty.";
	        }
		}
		else {
			customers = adminDao.viewCustomer();
			
		}
		
		System.out.println(customers);
		
		request.setAttribute("customerList", customers);
		
	    if (errorMessage != null) {
	        request.setAttribute("errorMessage", errorMessage);
	    }
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/viewCustomer.jsp");
		
		requestDispatcher.forward(request, response);
		
	}


	private void viewTransaction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// TODO Auto-generated method stub
		List<Transaction> transactions = null;
	    String errorMessage = null;
	    
	    String startDateStr = request.getParameter("start_date");
	    String endDateStr = request.getParameter("end_date");
	    
//	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	    
	    if(startDateStr != null || endDateStr != null) {
	    	
		    Timestamp startDate = null;
			Timestamp endDate = null;
			if (startDateStr != null && !startDateStr.isEmpty()) {
			    startDate = (Timestamp) dateFormat.parse(startDateStr);
			}
			if (endDateStr != null && !endDateStr.isEmpty()) {
			    endDate = (Timestamp) dateFormat.parse(endDateStr);
			}
			System.out.println(startDate);
			Timestamp startTimestamp = startDate != null ? new Timestamp(startDate.getTime()) : null;
			Timestamp endTimestamp = endDate != null ? new Timestamp(endDate.getTime()) : null;
			
			transactions = adminDao.viewTransactionByDate(startTimestamp, endTimestamp);
	    }
	    else {
	    	transactions = adminDao.viewTransaction();
	    }
		
		System.out.println(transactions);
		request.setAttribute("transactionList", transactions);
		
		if (errorMessage != null) {
	        request.setAttribute("errorMessage", errorMessage);
	    }
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/viewTransaction.jsp");
		
		requestDispatcher.forward(request, response);
		
	}


//	private void addBankAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		
//		String customer_id = request.getParameter("customer_id");
//		
//		int customerId = 0;
//
//	    customerId = Integer.parseInt(customer_id);
//        Customer customer = bankDao.getCustomerById(customerId);   
//        
//        if (customer != null) {
//            Account account = new Account(customer.getId(), 0);
//            boolean accountCreated = bankDao.createAccount(account);
//            
//            if (accountCreated) {
//                System.out.println("Bank account created successfully!");
//                request.setAttribute("successMessage", "Bank account created successfully!");
//                request.setAttribute("accountDetails", account);
//                response.sendRedirect("admin?command=view_customer");
//                
//            } else {
//                request.setAttribute("errorMessage", "Failed to create bank account. Please try again.");
//                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/adminHome.jsp");
//                requestDispatcher.forward(request, response);
//                
//            }
//        } else {
//            System.out.println("Customer not found!");
//            request.setAttribute("errorMessage", "Customer not found!");
//            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/adminHome.jsp");
//            requestDispatcher.forward(request, response);
//        } request.setAttribute("errorMessage", "Customer not found!");
//
//    }


	private void addCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String firstName = request.getParameter("first_name");
		String lastName = request.getParameter("last_name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		if(firstName == null && lastName == null && email == null && password == null) {
			
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/addCustomer.jsp");
			requestDispatcher.forward(request, response);
		}
		else {
			
			Customer customer = new Customer(firstName, lastName, email, password);
			
			boolean addedOrNot = adminDao.addCustomer(customer);
			
			if (addedOrNot) {
	            System.out.println("Customer added successfully");
	            request.setAttribute("successMessage", "Customer added successfully");
	        } 
			else {
	        	System.out.println("Error while adding customer");
	        	request.setAttribute("errorMessage", "Error while adding customer");
	        }
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/addCustomer.jsp");
			requestDispatcher.forward(request, response);
			
		}
		
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}