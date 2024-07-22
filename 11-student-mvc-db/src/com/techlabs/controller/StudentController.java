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
import javax.sql.DataSource;

import com.techlabs.dao.StudentDbUtil;
import com.techlabs.entity.Student;

@WebServlet("/StudentController")
public class StudentController extends HttpServlet {

	private StudentDbUtil studentDbUtil;

	@Resource(name = "jdbc/studentdb")
	private DataSource dataSource;

	@Override
	public void init() throws ServletException {

		super.init();
		studentDbUtil = new StudentDbUtil(dataSource);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String command;

		command = request.getParameter("command");

		if (command == null) {
			command = "list";
		}

		switch (command) {
		case "add":
			addStudent(request, response);
			break;
		case "load":
			loadStudent(request, response);
			break;
		case "delete":
			deleteStudent(request, response);
			break;
		case "update":
			updateStudent(request, response);
			break;
		case "search":
			searchStudent(request,response);
			break;
		default:
			listStudent(request, response);
		}

	}
	private void searchStudent(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		System.out.println("search method");
		String firstName = request.getParameter("first_name");
		System.out.println(firstName);
		List<Student> students = studentDbUtil.searchStudent(firstName);
		System.out.println(students);
		request.setAttribute("theStudentList", students);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/list-student.jsp");
		
		requestDispatcher.forward(request, response);

		
	}

	private void updateStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("update method");
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println(id);
		String firstName = request.getParameter("first_name");
		String lastName = request.getParameter("last_name");
		String email = request.getParameter("email");
		
		Student student = new Student(id,firstName,lastName,email);
		studentDbUtil.updateStudent(student);
		
		response.sendRedirect(request.getContextPath() + "/StudentController");
		
		
		
	}

	private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println("Delete request: "+id);
		studentDbUtil.deleteStudent(id);
		
		response.sendRedirect(request.getContextPath() + "/StudentController?command=list");

	}

	private void loadStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Student student = studentDbUtil.getStudent(id);
		
		request.setAttribute("theStudent", student);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/update-student.jsp");
		requestDispatcher.forward(request, response);
	}

	private void addStudent(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		System.out.println("Inside add method");
		
		// 1. read form values
		String firstName = request.getParameter("first_name");
		String lastName = request.getParameter("last_name");
		String email = request.getParameter("email");
		
		Student student = new Student(firstName,lastName,email);
		System.out.println(student);
		boolean isAdded = studentDbUtil.addStudent(student);
	
		// 2. send data to addStudent() of StudentDbUtil
		System.out.println(isAdded);
		listStudent(request,response);

		response.sendRedirect(request.getContextPath() + "/StudentController?command=list");

	}

	private void listStudent(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Student> studentList = studentDbUtil.getStudents();
		request.setAttribute("theStudentList", studentList);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/list-student.jsp");
		requestDispatcher.forward(request, response);

	}

}
