package com.techlabs.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.techlabs.dao.CustomerDAO;
import com.techlabs.entity.Customer;
import com.techlabs.entity.Transaction;


@WebServlet("/user")
public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private CustomerDAO customerDao;

	 @Resource(name = "jdbc/bankdb")
	 private DataSource dataSource;

	 @Override
	 public void init() throws ServletException {

		  super.init();
		 customerDao = new CustomerDAO(dataSource);
	 }

	
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			String command;

			command = request.getParameter("command");

			if (command == null) {
				command = "view_customer_home";
			}

			switch (command) {
			case "new_transaction":
				newTransaction(request, response);
				break;
			case "edit_profile":
				editProfile(request, response);
				break;
			case "view_passbook":
				viewPassbook(request, response);
				break;
			default:
				viewCustomerHome(request, response);
			}

		}
	 

	private void viewCustomerHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        request.setAttribute("customerName",customer.getFirstName()+" "+customer.getLastName());
        
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/customerHome.jsp");
		
		requestDispatcher.forward(request, response);
	}


	private void viewPassbook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        System.out.println(customer);
		
		List<Transaction> customerTransactions = customerDao.viewCustomerTransaction(customer);
		
		System.out.println(customerTransactions);
		
		request.setAttribute("customerTransactionList", customerTransactions);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/viewPassbook.jsp");
		
		requestDispatcher.forward(request, response);
		
	}


	private void editProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        request.setAttribute("customerName",customer.getFirstName()+" "+customer.getLastName());
        
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String password = request.getParameter("password");
        
        if(firstName == null && lastName == null && password == null) {
        	
        	RequestDispatcher requestDispatcher = request.getRequestDispatcher("/updateProfile.jsp");
	        requestDispatcher.forward(request, response);
        }
        else {
        	
        	customer.setFirstName(firstName);
    		customer.setLastName(lastName);
    		customer.setPassword(password);
    		
    		boolean addedOrNot = customerDao.updateCustomerProfile(customer);
    		
    		if(addedOrNot) {
    			System.out.println("Customer Details updated successfully");
    			request.setAttribute("successMessage","Customer Details updated successfully");
    			
    		}
    	    else {
    	    	System.out.println("Details not updated");
    		    request.setAttribute("errorMessage","Error in updating Details");
    	    }
    		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/updateProfile.jsp");
	        requestDispatcher.forward(request, response);
        	
        }
		
		
		
	}


	private void newTransaction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("customer");
		String errorMessage = null;

		String transactionType = request.getParameter("transaction_type");

		if (transactionType != null && !transactionType.trim().isEmpty()) {

			String amountStr = request.getParameter("amount");

			if (amountStr != null && !amountStr.trim().isEmpty()) {

				try {
					Double amount = Double.parseDouble(amountStr);

					Transaction transaction = new Transaction(customer.getId(), customer.getId(), transactionType,
							amount);

					if ("transfer".equals(transactionType)) {
						String toAccountNumberStr = request.getParameter("to_account_number");

						if (toAccountNumberStr != null && !toAccountNumberStr.trim().isEmpty()) {
							try {

								int toAccountNumber = Integer.parseInt(toAccountNumberStr);
								
								if(customerDao.checkAccountExists(toAccountNumber)) {
									transaction.setReceiverAccountNumber(toAccountNumber);
								}
								else {
									errorMessage = "Receiver account number does not exists";
								}
							} 
							catch (NumberFormatException e) {
								errorMessage = "Invalid receiver account number format.";
							}
						}
						else {
							errorMessage = "Receiver account number is required for transfers.";
						}
					}
					if (errorMessage == null) {
						if("credit".equals(transaction.getType()) || (("debit".equals(transaction.getType()) || "transfer".equals(transaction.getType())) && customerDao.checkAmountExists(transaction))) {
							
							boolean transactionSuccessful = customerDao.newTransaction(transaction);

							if (transactionSuccessful) {
								System.out.println("Transaction successful");
								request.setAttribute("successMessage", "Transaction Successful");
								
							} 
							else {
								errorMessage = "Transaction failed. Please try again.";
							}
							
						}
						else {
							errorMessage = "Insufficient Balance present in your account";
						}
						
					}
				} 
				catch (NumberFormatException e) {
					errorMessage = "Invalid amount format";
				}
			} 
			else {
				errorMessage = "Amount is required.";
			}

			if (errorMessage != null) {
				request.setAttribute("errorMessage", errorMessage);
			}

		} 
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/newTransaction.jsp");
		requestDispatcher.forward(request, response);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}