<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Home</title>
    <link rel="stylesheet" href="css/adminHome.css">
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>

	<div class="navbar">
        <a href="user">Home</a>
        <a href="passbook.jsp">Passbook</a>
        <a href="newTransaction.jsp">New Transaction</a>
        <a href="editProfile.jsp">Edit Profile</a>
    	<a href="logout" class="logout-btn">Logout</a>
    </div>

    <div class="container">
        <h1>Welcome, ${customerName}</h1>
        <div class="card-container">
            <div class="card">
                <h2>Passbook</h2>
                <p>View your passbook details (debit/credit/transfer).</p>
                <a href="passbook.jsp" class="btn">Passbook</a>
            </div>
            <div class="card">
                <h2>New Transaction</h2>
                <p>Make a new transaction to own/another account.</p>
                <a href="newTransaction.jsp" class="btn">New Transaction</a>
            </div>
            <div class="card">
                <h2>Edit Profile</h2>
                <p>Update/change your current profile details.</p>
                <a href="editProfile.jsp" class="btn">Edit Profile</a>
            </div>
        </div>
    </div>
</body>
</html>
