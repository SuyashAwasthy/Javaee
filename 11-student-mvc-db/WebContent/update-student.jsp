<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Student</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
</head>
<body>
	<div class="container">
		<div class="text-center">
			<p class="h2">Update Student</p>
		</div>
	</div>
	<hr>
	<form action="StudentController">
		<input type="hidden" name="command" value="update"/> 
		<input type="hidden" name="id" value="${theStudent.id}"/>
		<div class="mb-3">
			<label for="first_name" class="form-label">First Name</label> 
			<input type="text" class="form-control" id="first_name" name="first_name"
				value="${theStudent.firstName}">
		</div>
		<div class="mb-3">
			<label for="last_name" class="form-label">Last Name</label> 
			<input type="text" class="form-control" id="last_name" name="last_name"
				value="${theStudent.lastName}">
		</div>
		<div class="mb-3">
			<label for="email" class="form-label">Email ID</label> 
			<input type="email" class="form-control" name="email" id="email"
				value="${theStudent.email}">
		</div>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>
</body>
</html>