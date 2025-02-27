package com.techlabs.test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/JDBCdemo")
public class JDBCdemo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/countries","root","Suyash@21");
	
			Statement stmt = connection.createStatement();
			
			//insert
			String insertQuery = "insert into country(country_id,country_name,region_id)" + "values('AN','anything',101)";
		
			int res1 = stmt.executeUpdate(insertQuery);
			
			System.out.println("Number of rows affected: "+res1);
			
			//update
			String updateQuery = "update country set country_name='everything' where region_id=101";
			
			int res2 = stmt.executeUpdate(updateQuery);
			
			System.out.println("Number of rows updated: "+res2);
			
			//delete
			String deleteQuery = "delete from country where region_id=101";
			
			int res3 = stmt.executeUpdate(deleteQuery);
			
			System.out.println("Number of rows deleted: "+res3);
			
			String selectQuery = "select * from country";
			ResultSet rs = stmt.executeQuery(selectQuery);
			
			while(rs.next()) {
			//  int id = rs.getInt("id");
				String country_name = rs.getString("country_name");
				System.out.println(country_name);
				String country_id = rs.getString("country_id");
				System.out.println(country_id);
				int region_id = rs.getInt("region_id");
				System.out.println(region_id);
				System.out.println("----------");
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
