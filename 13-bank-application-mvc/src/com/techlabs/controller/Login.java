package com.techlabs.controller; 

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException; 
import javax.servlet.annotation.WebServlet; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.techlabs.dao.ValidateDAO;
import com.techlabs.entity.Admin;
import com.techlabs.entity.Customer; 
 

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Resource(name = "jdbc/bankdb")
    private DataSource dataSource;
    
    private ValidateDAO validateDao;

    @Override
    public void init() throws ServletException {
        super.init();
        validateDao = new ValidateDAO(dataSource);
    }
       
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email_id"); 
        String password = request.getParameter("password"); 
        String role = request.getParameter("role");
        

        if ("admin".equals(role)) {
        	Admin admin = validateDao.validateAdmin(email, password);
        	
        	if (admin != null) {
                HttpSession session = request.getSession();
                session.setAttribute("admin", admin);
                session.setAttribute("role", "admin"); 
                response.sendRedirect("admin"); 
            }
        	else { 
        		request.setAttribute("errorMessage", "Invalid email or password");
        		request.getRequestDispatcher("login.jsp").forward(request, response);
            } 
        }
        if ("customer".equals(role)) {
        	
        	Customer customer = validateDao.validateCustomer(email, password);
        	if (customer != null) {
                HttpSession session = request.getSession();
                session.setAttribute("customer", customer);
                session.setAttribute("role", "customer"); 
                response.sendRedirect("user"); 
            }
        	else { 
        		request.setAttribute("errorMessage", "Invalid email or password");
        		request.getRequestDispatcher("login.jsp").forward(request, response);
            } 
        	
        }
	}

}

