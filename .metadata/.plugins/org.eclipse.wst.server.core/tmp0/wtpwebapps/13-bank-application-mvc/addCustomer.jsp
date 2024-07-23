<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add New Customer</title>
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
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card mt-5">
					<div class="card-body">
						<h3 class="card-title text-center">Add New Customer</h3>
						<form action="admin" method="post">
							<input type="hidden" name="command" value="add_customer">
							<div class="form-group">
								<label for="firstName">Customer's first name</label> <input
									type="text" class="form-control" id="first_name"
									name="first_name" required>
							</div>
							<div class="form-group">
								<label for="lastName">Customer's last name</label> <input
									type="text" class="form-control" id="last_name"
									name="last_name" required>
							</div>
							<div class="form-group">
								<label for="email">Email ID</label> <input type="email"
									class="form-control" id="email" name="email" required>
							</div>
							<div class="form-group">
								<label for="password">Password</label> <input type="password"
									class="form-control" id="password" name="password" required>
							</div>
							<div class="form-group text-center">
								<button type="submit" class="btn btn-primary">Submit</button>
								<button type="reset" class="btn btn-secondary">Reset</button>
							</div>



						</form>
						<c:if test="${not empty errorMessage}">
							<div class="alert alert-danger mt-3">${errorMessage}</div>
						</c:if>
						<c:if test="${not empty successMessage}">
							<div class="alert alert-success mt-3">${successMessage}</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>