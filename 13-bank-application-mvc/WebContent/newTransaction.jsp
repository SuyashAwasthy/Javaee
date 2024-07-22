<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>New Transaction</title>
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

		<h2 class="text-center">New Transaction</h2>

		<form action="user" method="get">
			<input type="hidden" name="command" value="new_transaction">
			<div class="form-group">
				<label for="transactionType">Transaction Type</label> <select
					class="form-control" id="transactionType" name="transactionType"
					required>
					<option value="credit">Credit</option>
					<option value="debit">Debit</option>
					<option value="transfer">Transfer</option>
				</select>
			</div>
			<div id="toAccountGroup" class="form-group" style="display: none;">
				<label for="to_account_number">To Account Number</label> <input
					type="text" class="form-control" id="to_account_number"
					name="to_account_number">
			</div>
			<div class="form-group">
				<label for="amount">Amount</label> <input type="number"
					class="form-control" id="amount" name="amount" required>
			</div>

			<button type="submit" class="btn btn-primary">Submit</button>
			<button type="reset" class="btn btn-secondary">Cancel</button>
		</form>
	</div>

	<script>
		document.getElementById('transactionType').addEventListener(
				'change',
				function() {
					var toAccountGroup = document
							.getElementById('toAccountGroup');
					if (this.value === 'transfer') {
						toAccountGroup.style.display = 'block';
					} else {
						toAccountGroup.style.display = 'none';
					}
				});
	</script>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>