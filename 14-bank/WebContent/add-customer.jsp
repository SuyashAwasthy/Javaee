<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Add Customer</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.7.1/font/bootstrap-icons.min.js"></script>
  </head>
  <body>
    <div class="container my-5">
      <a class="btn btn-secondary p-2 px-4" href="admin?command=admin"
        >Go Back</a
      >
      <h2 class="text-center my-5">Add Customer</h2>
      <hr />
      <form action="admin" method="post">
        <div class="col-sm-10 my-3">
          <input
            type="hidden"
            name="command"
            value="insert"
            class="form-control"
          />
        </div>
        <div class="input-group input-group-lg mt-5">
          <span class="input-group-text">First and Last name</span>
          <input
            type="text"
            aria-label="First name"
            class="form-control"
            placeholder="First Name"
            name="fname"
          />
          <input
            type="text"
            aria-label="Last name"
            class="form-control"
            placeholder="Last Name"
            name="lname"
          />
        </div>
        <div class="input-group flex-nowrap input-group-lg mt-4">
          <span class="input-group-text" id="addon-wrapping">Email</span>
          <input
            type="text"
            class="form-control"
            placeholder="Email"
            aria-label="Email"
            aria-describedby="addon-wrapping"
            name="email"
          />
        </div>
        <div class="input-group flex-nowrap input-group-lg mt-4">
          <span class="input-group-text" id="addon-wrapping">Password</span>
          <input
            type="password"
            class="form-control"
            placeholder="Password"
            aria-label="Password"
            aria-describedby="addon-wrapping"
            name="password"
            id="password"
          />
          <button
            type="button"
            class="btn btn-outline-primary"
            onclick="togglePasswordVisibility()"
            tabindex="-1"
          >
            show password
          </button>
        </div>

        <div class="col-sm-10 my-4">
          <input
            type="submit"
            value="Submit"
            class="btn btn-outline-primary btn-lg"
          />
          <a href="admin" class="btn btn-outline-primary btn-lg">Cancel</a>
        </div>
      </form>
    </div>

    <script>
      function togglePasswordVisibility() {
        var passwordField = document.getElementById("password");
        var eyeIcon = document.getElementById("eye-icon");

        if (passwordField.type === "password") {
          passwordField.type = "text";
          eyeIcon.classList.remove("bi-eye");
          eyeIcon.classList.add("bi-eye-slash");
        } else {
          passwordField.type = "password";
          eyeIcon.classList.remove("bi-eye-slash");
          eyeIcon.classList.add("bi-eye");
        }
      }
    </script>
  </body>
</html>