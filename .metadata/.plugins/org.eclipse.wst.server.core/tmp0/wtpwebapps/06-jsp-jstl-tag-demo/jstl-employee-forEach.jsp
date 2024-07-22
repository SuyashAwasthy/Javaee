<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.util.List, java.util.ArrayList,com.techlabs.model.Employee"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		List<Employee> employees = new ArrayList<>();
	employees.add(new Employee(1, "Suyash", 10000));
	employees.add(new Employee(2, "Shivansh", 15000));
	employees.add(new Employee(3, "Sudesh", 25000));
	employees.add(new Employee(4, "Rachit", 30000));

	pageContext.setAttribute("theEmployees", employees);
	%>
	<table border="1">
		<tr>
			<td>Emp ID</td>
			<td>Name</td>
			<td>Salary</td>
			<td>Salary Type</td>
		</tr>
		<c:forEach var="emp" items="${theEmployees}">
			<tr>
				<td>${emp.id}</td>
				<td>${emp.name}</td>
				<td>${emp.salary}</td>
				<td>
					<c:if test="${emp.salary >= 20000}">
						High
					</c:if>
					<c:if test="${emp.salary < 20000}">
						Low
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>