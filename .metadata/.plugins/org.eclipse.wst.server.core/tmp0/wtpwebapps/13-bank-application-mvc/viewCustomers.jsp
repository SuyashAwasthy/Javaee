<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>View Customers</title>
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
.container {
	margin-top: 50px;
}

.table {
	margin-top: 20px;
}
</style>
</head>
<body>
	<div class="container">
		<a href="admin" class="button">Back to Admin Home</a>
		<h2 class="text-center">Customers</h2>
		<form action="searchCustomer" method="get" class="search-form">
			<label for="searchBy">Search By:</label> <select id="searchBy"
				name="searchBy" required>
				<option value="">Select...</option>
				<option value="customerId">Customer ID</option>
				<option value="customerName">Customer Name</option>
			</select> <input type="text" id="searchValue" name="searchValue"
				placeholder="Enter search value" required>

			<button type="submit" class="btn">Search</button>
		</form>
		<c:if test="${not empty errorMessage}">
			<div class="alert alert-danger mt-3">${errorMessage}</div>
		</c:if>
		<div class="text-right mb-3"></div>
		<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Password</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="customer" items="${customers}">
					<tr>
						<td>${customer.first_name}</td>
						<td>${customer.last_name}</td>
						<td>${customer.email}</td>
						<td>${customer.passsword}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>