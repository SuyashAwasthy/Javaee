package com.techlabs.jdbc;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet("/PreparedStatement")
public class TestPreparedStatement extends HttpServlet {

	@Resource(name = "jdbc/countries")
	private DataSource dataSource;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();			
			System.out.println("Database connection successful.");
			
//			1. Create SQL for PreparedStatement using Parameters

			String sql = "select country_id, country_name, region_id from country where region_id=?";
			
//			2. Create a PreparedStatement
			
			preparedStatement = connection.prepareStatement(sql);
			
//			3. Insert Parameter value(s) into PreparedStatement

			preparedStatement.setInt(1,2);
			
//			4. Execute the PreparedStatement
			
			resultSet = preparedStatement.executeQuery();
			
//			5. Process the ResultSet (if applicable)
			
			while(resultSet.next()) {
				System.out.println(resultSet.getString("country_id") + " " + resultSet.getString("country_name") + " " + resultSet.getInt("region_id"));
			}
			
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
