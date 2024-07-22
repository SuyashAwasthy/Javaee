<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Home</title>
    <link rel="stylesheet" href="css/adminHome.css">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
    <div class="navbar">
        <a href="admin">Home</a>
        <a href="addCustomer.jsp">Add Customer</a>
        <a href="viewCustomers.jsp">View Customers</a>
        <a href="viewTransaction.jsp">View Transactions</a>
    	<a href="logout" class="logout-btn">Logout</a>
    </div>

    <div class="container">
        <h1 class="container2">Welcome to Admin Home</h1>
        <div class="card-container">
            <div class="card">
                <h2>Add New Customer</h2>
                <p>Create a new customer account in the system.</p>
                <a href="admin?command=add_customer" class="btn">Add Customer</a>
            </div>
            <div class="card">
                <h2>View Customers</h2>
                <p>View the list of all customers in the system.</p>
                <a href="admin?command=view_customer" class="btn">View Customers</a>
            </div>
            <div class="card">
                <h2>View Transactions</h2>
                <p>View the transaction history of all accounts.</p>
                <a href="admin?command=view_transaction" class="btn">View Transactions</a>
            </div>
        </div>
    </div>
</body>
</html>
