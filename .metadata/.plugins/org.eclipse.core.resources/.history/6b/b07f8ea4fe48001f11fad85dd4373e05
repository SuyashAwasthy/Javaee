<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Passbook</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="css/styles.css">
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
		<a href="user" class="button">Back to Customer Home</a>
		<h2 class="text-center">Passbook</h2>
		<form action="user" method="get">
			<input type="hidden" name="command" value="view_passbook">

			<table class="table table-striped">
				<thead>
					<tr>
						<th>Sender Account No</th>
						<th>Receiver Account No</th>
						<th>Type of Transaction</th>
						<th>Amount</th>
						<th>Date</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="transaction" items="${passbookEntries}">
						<tr>
							<td>${transaction.senderAccountNo}</td>
							<td>${transaction.receiverAccountNo}</td>
							<td>${transaction.transactionType}</td>
							<td>${transaction.amount}</td>
							<td>${transaction.date}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
