<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Home</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
    <style>
      .navbar {
        background-color: #343a40;
        height: 70px;
      }

      .navbar-brand,
      .navbar-nav .nav-link {
        color: #ffffff; /* White text */
      }

      .navbar-brand:hover,
      .navbar-nav .nav-link:hover {
        color: #adb5bd; /* Light grey text on hover */
      }

      .jumbotron {
        background: url("https://www.kotak.com/content/dam/Kotak/herosliderbanner/loans/home-loan/Documents%20Required%20for%20Home%20Loan%20by%20Kotak%20Bank.jpg")
          no-repeat center center;
        background-size: cover;
        height: 500px;
        display: flex;
        align-items: center;
        justify-content: start;
        color: #ffffff; /* White text */
        text-align: center;
      }
    </style>
  </head>
  <body class="bg-light">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <div class="container">
        <a class="navbar-brand" href="#">Admin Panel</a>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarNav"
          aria-controls="navbarNav"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div
          class="collapse navbar-collapse justify-content-end"
          id="navbarNav"
        >
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="logout"
                >Logout</a
              >
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="jumbotron">
      <h1 class="display-2 text-dark text-xl-start ms-5">
        Welcome to Admin Panel
      </h1>
    </div>

    <div class="container my-5">
      <div class="row justify-content-center ms-5 py-3">
        <div class="col-md-4 my-3">
          <a
            href="admin?command=addCustomer"
            class="btn btn-primary btn-lg btn-block px-5 py-3"
            >Add Customer</a
          >
        </div>
        <div class="col-md-4 my-3">
          <a
            href="admin?command=viewCustomers"
            class="btn btn-primary btn-lg btn-block px-5 py-3"
            >View Customers</a
          >
        </div>
        <div class="col-md-4 my-3">
          <a
            href="admin?command=viewTransactions"
            class="btn btn-primary btn-lg btn-block px-5 py-3"
            >View Transactions</a
          >
        </div>
      </div>
    </div>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>
  </body>
</html>