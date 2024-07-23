package com.techlabs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.techlabs.entity.Customer;
import com.techlabs.entity.Transaction;

public class CustomerDAO {
	
	private DataSource dataSource;

	public CustomerDAO(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}
	
	
	public List<Transaction> viewCustomerTransaction(Customer customer) {
		
		List<Transaction> customerTransactions = new ArrayList<Transaction>();
		
		try {
			Connection connection = dataSource.getConnection();
			
			String query = "select * from transactions where sender_account_number = ? or receiver_account_number = ?;";
			
			PreparedStatement stmt = connection.prepareStatement(query);
			
			stmt.setInt(1, customer.getId());
			stmt.setInt(2, customer.getId());
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				int id = rs.getInt("id");
			    int senderAccountNumber = rs.getInt("sender_account_number");
			    int receiverAccountNumber = rs.getInt("receiver_account_number");
			    String type = rs.getString("type");
			    double amount = rs.getDouble("amount");
			    Timestamp date = rs.getTimestamp("date");
				
				Transaction transaction = new Transaction(id, senderAccountNumber, receiverAccountNumber, type, amount, date);
				
				customerTransactions.add(transaction);
				
			}
			
			rs.close();
			stmt.close();
			connection.close();
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return customerTransactions;
		
		
	}
	
	
	
	public boolean updateCustomerProfile(Customer customer) {
		int res = 0;
		
		try {
			Connection connection = dataSource.getConnection();
			
			String query = "update customers set first_name=?, last_name=?, password=? where id=?";
			
			PreparedStatement stmt = connection.prepareStatement(query);
			
			stmt.setString(1, customer.getFirstName());
			stmt.setString(2, customer.getLastName());
			stmt.setString(3, customer.getPassword());
			stmt.setInt(4, customer.getId());
			
			res = stmt.executeUpdate();
			
			stmt.close();
			connection.close();
			
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(res == 0) return false;
		return true;
	}
	
	
	
	public boolean newTransaction(Transaction transaction) {
		int res = 0;
		try {
			
			Connection connection = dataSource.getConnection();
			 
			String query = "insert into transactions (sender_account_number, receiver_account_number, type, amount) values (?, ?, ?, ?)";
            
			PreparedStatement stmt = connection.prepareStatement(query);
            
			stmt.setInt(1, transaction.getSenderAccountNumber());
			stmt.setInt(2, transaction.getReceiverAccountNumber());
			stmt.setString(3, transaction.getType());
			stmt.setDouble(4, transaction.getAmount());
			res = stmt.executeUpdate();
			
			if(res > 0) {
				if ("debit".equals(transaction.getType()) || "transfer".equals(transaction.getType())) {
					String updateSenderQuery = "update accounts set balance = balance - ? where account_number = ?";
					
					PreparedStatement pstmt = connection.prepareStatement(updateSenderQuery);
					
	                pstmt.setDouble(1, transaction.getAmount());
	                pstmt.setInt(2, transaction.getSenderAccountNumber());
	                pstmt.executeUpdate();
	                
	                pstmt.close();
				}
				
				if ("transfer".equals(transaction.getType()) || "credit".equals(transaction.getType())) {
                    String updateReceiverQuery = "update accounts set balance = balance + ? where account_number = ?";
                    
                    PreparedStatement astmt = connection.prepareStatement(updateReceiverQuery);
                    astmt.setDouble(1, transaction.getAmount());
                    astmt.setInt(2, transaction.getReceiverAccountNumber());
                    astmt.executeUpdate();
                    
                    astmt.close();
                }
				
			}
			
			stmt.close();
			connection.close();
	    } 
		catch (SQLException e) {
	        e.printStackTrace();
	    }
		if(res == 0) return false;
		return true;
	}
	
	
	
	public boolean checkAccountExists(int receiverAccountNumber) {
		
		int res = 0;
		
		try {
			
			Connection connection = dataSource.getConnection();
			 
			String query = "select * from accounts where account_number = ?;";
            
			PreparedStatement stmt = connection.prepareStatement(query);
            
			stmt.setInt(1, receiverAccountNumber);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				res = 1;
			}
			
			rs.close();
			stmt.close();
			connection.close();
	    } 
		catch (SQLException e) {
	        e.printStackTrace();
	    }
		
		if(res == 0) return false;
		return true;
	}
	
	

	public boolean checkAmountExists(Transaction transaction) {
		
		try {
			
			Connection connection = dataSource.getConnection();
			 
			String query = "select balance from accounts where account_number = ?;";
            
			PreparedStatement stmt = connection.prepareStatement(query);
            
			stmt.setInt(1, transaction.getSenderAccountNumber());
			ResultSet rs = stmt.executeQuery();
			double balance = 0;
			
			if(rs.next()) {
				balance = rs.getDouble("balance");
			}
			if(balance < transaction.getAmount()) return false;
			stmt.close();
			connection.close();
	    } 
		catch (SQLException e) {
	        e.printStackTrace();
	    }
		
		return true;
	}
	
}
