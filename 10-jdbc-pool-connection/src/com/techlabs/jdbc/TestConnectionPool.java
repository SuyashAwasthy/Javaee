package com.techlabs.jdbc;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet("/TestConnectionPool")
public class TestConnectionPool extends HttpServlet {
	
	@Resource(name = "jdbc/countries")
	private DataSource dataSource;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Connection connection = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			connection = dataSource.getConnection();
			
			stmt = connection.createStatement();
		
			String sql = "select * from country";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				System.out.println(rs.getString("country_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
			}
			
			if(stmt!=null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
			}
			
			if(connection!=null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
			}
			
		}
	}

}
