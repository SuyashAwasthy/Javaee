<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/styles.css">
<style>

</style>

</head>
<body>
	<div class="container">
		<h2 class="mt-5">Login</h2>
		<form action="login" method="post">
			<div class="form-group">
				<label for="username">Username</label> <input type="text"
					class="form-control" id="username" name="username" required>
			</div>
			<div class="form-group">
				<label for="password">Password</label> <input type="password"
					class="form-control" id="password" name="password" required>
			</div>
			<div class="form-group">
				<label for="role">Login As</label> <select class="form-control"
					id="role" name="role" required>
					<option value="admin">Admin</option>
					<option value="customer">Customer</option>
				</select>
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
			<button type="reset" class="btn btn-secondary">Cancel</button>
			
		</form>
		<c:if test="${not empty errorMessage}">
            <div class="alert alert-danger mt-3">
                ${errorMessage}
            </div>
        </c:if>
	</div>
</body>
</html>