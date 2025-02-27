<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Student Form</title>
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
	<div class="container mt-5">
		<form action="hello" method="get">
			<h1>Student Form</h1>
			<div class="form-group mt-3">
				<label for="first-name">First Name:</label> <input type="text"
					id="first-name" name="first-name" required>
			</div>
			<div class="form-group mt-3">
				<label for="last-name">Last Name:</label> <input type="text"
					id="last-name" name="last-name" required>
			</div>
			<div>
				<select class="form-select mt-3" name="city"
					aria-label="Default select example">
					<option selected>Open this select menu</option>
					<option value="Mumbai">Mumbai</option>
					<option value="Chennai">Chennai</option>
					<option value="Delhi">Delhi</option>
				</select>
			</div>
			<div class="form-check mt-3">
				<label for="gender">Gender:</label><br> <input value="Male"
					class="form-check-input" type="radio" name="gender" id="gender">
				<label class="form-check-label" for="gender"> Male </label>
			</div>
			<div class="form-check">
				<input value="Female" class="form-check-input" type="radio"
					name="gender" id="gender" checked> <label
					class="form-check-label" for="gender"> Female </label>
			</div>
			<div class="col-sm-10 mt-3">
				<label for="languages">Languages known:</label><br>
				<div class="form-check">
					<input name="languages" class="form-check-input" type="checkbox"
						value="Hindi" id="flexCheckDefault"> <label
						class="form-check-label" for="flexCheckDefault"> Hindi </label>
				</div>
				<div class="form-check">
					<input name="languages" class="form-check-input" type="checkbox"
						value="English" id="flexCheckChecked" checked> <label
						class="form-check-label" for="flexCheckChecked"> English </label>
				</div>
				<div class="form-check">
					<input name="languages" class="form-check-input" type="checkbox"
						value="Tamil" id="flexCheckChecked" checked> <label
						class="form-check-label" for="flexCheckChecked"> Tamil </label>
				</div>
				<div class="form-check">
					<input name="languages" class="form-check-input" type="checkbox"
						value="Kannada" id="flexCheckChecked" checked> <label
						class="form-check-label" for="flexCheckChecked"> Kannada </label>
				</div>
			</div>
			<div class="text-center col-sm-12 mt-2">
				<input type="submit" value="Submit" class="btn btn-primary">
			</div>
		</form>
	</div>
</body>
</html>