<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Profile</title>
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

		<h1 class="my-4">Welcome, ${customerName}</h1>
		<h2 class="text-center">Edit Profile</h2>

		<form action="user" method="post">
			<input type = "hidden" name="command" value="edit_profile">
			<div class="form-group">
				<label for="first_name">First Name</label> <input type="text"
					class="form-control" id="first_name" name="first_name" required>
			</div>
			<div class="form-group">
				<label for="last_name">Last Name</label> <input type="text"
					class="form-control" id="last_name" name="last_name" required>
			</div>
			<div class="form-group">
				<label for="password">Password</label> <input type="password"
					class="form-control" id="password" name="password">
			</div>
			<button type="submit" class="btn btn-primary">Update Profile</button>
			<button type="reset" class="btn btn-secondary">Cancel</button>
		</form>
		<c:if test="${not empty errorMessage}">
			<div class="alert alert-danger mt-3">${errorMessage}</div>
		</c:if>
		<c:if test="${not empty successMessage}">
			<div class="alert alert-success mt-3">${successMessage}</div>
		</c:if>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>