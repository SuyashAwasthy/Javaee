<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>View Passbook</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
</head>
<body class="bg-light">
	<div class="container-lg my-5">
		<a class="btn btn-secondary p-2 px-4" href="user?command=user">Go
			Back</a>
		<h1 class="text-center my-5">Passbook Details</h1>
		<hr />
		<p class="fs-3">
			<span class="lead fs-3">Account Number :</span> ${bankAccountNumber}
		</p>
		<form action="user" method="get">
			<div class="col-sm-10">
				<input type="hidden" name="command" value="passbook" /> <select
					class="form-select form-select-lg mb-3"
					aria-label=".form-select-lg example" name="select">
					<option selected>Open this select menu</option>
					<option value="senderAccountNumber">Sender Account Number
					</option>
					<option value="receiverAccountNumber">Receiver Account
						Number</option>
				</select>
			</div>
			<div class="d-flex my-3">
				<input type="text" class="form-control" name="searchValue"
					placeholder="Search by sender and receiver account number" />
				<input type="submit" class="btn btn-primary mx-2" value="Search" />
				<i class="fa-solid fa-filter"></i>
			</div>
		</form>

		<table class="table table-hover table-bordered border-primary">
			<thead>
				<tr>
					<th>Sender Account Number</th>
					<th>Receiver Account Number</th>
					<th>Date of Transaction</th>
					<th>Type of Transaction</th>
					<th>Amount</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="transaction" items="${TheTransactions}">
					<tr>
						<td>${transaction.sender_account_number}</td>
						<td>${transaction.receiver_account_number}</td>
						<td>${transaction.date_of_transaction}</td>
						<td>${transaction.transaction_type}</td>
						<c:if test="${transaction.transaction_type=='Debit'}">
							<td class="text-danger fw-5">
								-${transaction.transaction_amount}</td>
						</c:if>
						<c:if test="${transaction.transaction_type=='Credit'}">
							<td class="text-success fw-5">
								+${transaction.transaction_amount}</td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>