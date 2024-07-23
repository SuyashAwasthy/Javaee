package com.techlabs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.techlabs.entity.Account;
import com.techlabs.entity.Customer;
import com.techlabs.entity.Transaction;

public class AdminDAO {
	
	private DataSource dataSource;

	public AdminDAO(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}
	
	
	public boolean addCustomer(Customer customer) {
		// TODO Auto-generated method stub
		int res = 0, acc_res =0;
		try {
			Connection connection = dataSource.getConnection();
			
			String query_insert = "insert into customers(first_name, last_name, email, password) values (?, ?, ?, ?);";
			
			PreparedStatement stmt = connection.prepareStatement(query_insert);
			
			stmt.setString(1, customer.getFirstName());
			stmt.setString(2, customer.getLastName());
			stmt.setString(3, customer.getEmail());
			stmt.setString(4, customer.getPassword());
			
			res = stmt.executeUpdate();
			
			String query_select = "select id from customers where first_name = ? and last_name = ? and email = ? and password = ?";
			
			PreparedStatement pstmt = connection.prepareStatement(query_select);
			
			pstmt.setString(1, customer.getFirstName());
			pstmt.setString(2, customer.getLastName());
			pstmt.setString(3, customer.getEmail());
			pstmt.setString(4, customer.getPassword());
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int customerId = rs.getInt("id");
				Account account = new Account(customerId, 0);
				
				String query_acc_insert = "insert into accounts(customer_id, balance) values (?, ?);";
				
				PreparedStatement astmt = connection.prepareStatement(query_acc_insert);
				astmt.setInt(1, account.getCustomerId());
				astmt.setDouble(2, account.getBalance());
				
				acc_res = astmt.executeUpdate();
				
				astmt.close();
				
			}
			
			stmt.close();
			pstmt.close();
			connection.close();
			
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(res != 0 && acc_res != 0) return true;
		return false;
	}
	
	
	
	public List<Customer> viewCustomer(){
		
		List<Customer> customers = new ArrayList<Customer>();
		
		try {
			Connection connection = dataSource.getConnection();
			
			Statement stmt = connection.createStatement();
			
			String query = "select * from customers;";
			
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				int id = rs.getInt("id");
				String firstName = rs.getString("first_name");
				String lastName = rs.getString("last_name");
				String email = rs.getString("email");
				String password = rs.getString("password");
				
				
				Customer customer = new Customer(id, firstName, lastName, email, password);
				
				customers.add(customer);
				
			}
			
			rs.close();
			stmt.close();
			connection.close();
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return customers;
	}
	
	
	
	public List<Customer> viewCustomerById(int customerId) {
		List<Customer> customers = new ArrayList<Customer>();
		
		try {
        	Connection connection = dataSource.getConnection();
        	
            String query = "select * from customers where id = ?;";
            
            PreparedStatement stmt = connection.prepareStatement(query);
            
            stmt.setInt(1, customerId);
            
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
            	int id = rs.getInt("id");
				String firstName = rs.getString("first_name");
				String lastName = rs.getString("last_name");
				String email = rs.getString("email");
				String password = rs.getString("password");
				
				
				Customer customer = new Customer(id, firstName, lastName, email, password);
				customers.add(customer);
            }
            
            rs.close();
            stmt.close();
            connection.close();
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
	}
	
	


	public List<Customer> viewCustomerByName(String customerName) {
		List<Customer> customers = new ArrayList<Customer>();
		
		try {
        	Connection connection = dataSource.getConnection();
        	
            String query = "select * from customers where first_name = ?;";
            
            PreparedStatement stmt = connection.prepareStatement(query);
            
            stmt.setString(1, customerName);
            
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
            	int id = rs.getInt("id");
				String firstName = rs.getString("first_name");
				String lastName = rs.getString("last_name");
				String email = rs.getString("email");
				String password = rs.getString("password");
				
				
				Customer customer = new Customer(id, firstName, lastName, email, password);
				customers.add(customer);
            }
            
            rs.close();
            stmt.close();
            connection.close();
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
	}
	
	
	
	public List<Transaction> viewTransaction(){
		
		List<Transaction> transactions = new ArrayList<Transaction>();
		
		try {
			Connection connection = dataSource.getConnection();
			
			Statement stmt = connection.createStatement();
			
			String query = "select * from transactions;";
			
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				int id = rs.getInt("id");
			    int senderAccountNumber = rs.getInt("sender_account_number");
			    int receiverAccountNumber = rs.getInt("receiver_account_number");
			    String type = rs.getString("type");
			    double amount = rs.getDouble("amount");
			    Timestamp date = rs.getTimestamp("date");
				
				
				Transaction transaction = new Transaction(id, senderAccountNumber, receiverAccountNumber, type, amount, date);
				
				transactions.add(transaction);
				
			}
			rs.close();
            stmt.close();
            connection.close();
			
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return transactions;
	}


	public List<Transaction> viewTransactionByDate(Timestamp startTimestamp, Timestamp endTimestamp) {
		// TODO Auto-generated method stub
		
		List<Transaction> transactions = new ArrayList<Transaction>();
		
		try {
			Connection connection = dataSource.getConnection();
			
			String query = "select * from transactions where date >= ? and date <= ?;";
			
			PreparedStatement stmt = connection.prepareStatement(query);
			
			stmt.setTimestamp(1, startTimestamp);
			stmt.setTimestamp(2, endTimestamp);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				int id = rs.getInt("id");
			    int senderAccountNumber = rs.getInt("sender_account_number");
			    int receiverAccountNumber = rs.getInt("receiver_account_number");
			    String type = rs.getString("type");
			    double amount = rs.getDouble("amount");
			    Timestamp date = rs.getTimestamp("date");
				
				
				Transaction transaction = new Transaction(id, senderAccountNumber, receiverAccountNumber, type, amount, date);
				
				transactions.add(transaction);
				
			}
			rs.close();
            stmt.close();
            connection.close();
			
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return transactions;
	}


	

}
