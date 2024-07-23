<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 500px;
            margin-top: 50px;
            padding: 20px;
            background-color: #d3d3d3;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
        }
        .btn-success:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }
        .btn-primary {
            background-color: #17a2b8;
            border-color: #17a2b8;
        }
        .btn-primary:hover {
            background-color: #138496;
            border-color: #117a8b;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="mt-3">Login</h2>
        <form action="login" method="post">
            <div class="form-group">
                <label for="email_id">Email</label>
                <input type="text" class="form-control" id="email_id" name="email_id" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="role">Login As</label>
                <select class="form-control" id="role" name="role" required>
                    <option value="admin">Admin</option>
                    <option value="customer">Customer</option>
                </select>
            </div>
            <button type="submit" class="btn btn-success">Submit</button>
            <button type="reset" class="btn btn-secondary">Cancel</button>
        </form>
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger mt-3">
                ${errorMessage}
            </div>
        </c:if>
    </div>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
