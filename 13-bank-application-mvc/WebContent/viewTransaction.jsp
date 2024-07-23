<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>View Transactions</title>
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
		<h2 class="text-center">Transactions</h2>
		<form action="admin" method="post" class="date-form">
		<input type="hidden" name="command" value ="view_transaction">
			<label for="start_date">Start Date:</label> <input type="date"
				id="start_date" name="start_date" required> <label
				for="end_date">End Date:</label> <input type="date" id="end_date"
				name="end_date" required>

			<button type="submit" class="btn">Search by Date</button>
		</form>
		<c:if test="${not empty errorMessage}">
			<div class="alert alert-danger mt-3">${errorMessage}</div>
		</c:if>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Transaction ID</th>
					<th>Sender Account Number</th>
					<th>Receiver Account Number</th>
					<th>Type</th>
					<th>Amount</th>
					<th>Date</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="transaction" items="${transactionList}">
					<tr>
						<td>${transaction.id}</td>
						<td>${transaction.senderAccountNumber}</td>
						<td>${transaction.receiverAccountNumber}</td>
						<td>${transaction.type}</td>
						<td>${transaction.amount}</td>
						<td>${transaction.date}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>