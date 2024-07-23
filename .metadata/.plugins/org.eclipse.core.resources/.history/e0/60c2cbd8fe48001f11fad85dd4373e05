package com.techlabs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.techlabs.entity.Admin;
import com.techlabs.entity.Customer;

public class ValidateDAO {
	
	private DataSource dataSource;

	public ValidateDAO(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}
	
	public Admin validateAdmin(String email, String password) {
		
		Admin admin = null;
		try {
			Connection connection = dataSource.getConnection();
			
			String sql = "select * from admin where email = ? and password = ?";
			
			PreparedStatement stmt = connection.prepareStatement(sql);
			
			stmt.setString(1, email);
            stmt.setString(2, password);
			
            ResultSet rs = stmt.executeQuery();
            
            if(rs.next()) {
            	
            	admin = new Admin(email, password);
            	
            }
            
            rs.close();
            stmt.close();
            connection.close();
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return admin;
		
	}

	
	public Customer validateCustomer(String email, String password) {
		
		Customer customer = null;
		try {
			Connection connection = dataSource.getConnection();
			
			String sql = "select * from customers where email = ? and password = ?";
			
			PreparedStatement stmt = connection.prepareStatement(sql);
			
			stmt.setString(1, email);
            stmt.setString(2, password);
			
            ResultSet rs = stmt.executeQuery();
            
            if(rs.next()) {
				int id = rs.getInt("id");
				String firstName = rs.getString("first_name");
				String lastName = rs.getString("last_name");
				
				
				customer = new Customer(id, firstName, lastName, email, password);
				
			}
            rs.close();
            stmt.close();
            connection.close();
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return customer;
		
	}

}
