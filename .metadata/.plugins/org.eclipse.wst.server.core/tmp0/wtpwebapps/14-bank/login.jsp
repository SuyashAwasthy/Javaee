<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>

    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.7.1/font/bootstrap-icons.min.js"></script>
  </head>
  <body class="bg-light">
    <div class="container mt-5">
      <div class="row justify-content-center">
        <div class="col-md-6">
          <div class="card shadow">
            <div class="card-body">
              <h1 class="card-title text-center mb-4">Bank Application</h1>

              <form
                action="login"
                method="post"
                class="needs-validation"
                novalidate
              >
                <div class="mb-3">
                  <label for="username" class="form-label">Username</label>
                  <input
                    type="text"
                    id="username"
                    name="username"
                    class="form-control"
                    required
                  />
                  <div class="invalid-feedback">
                    Please enter your username.
                  </div>
                </div>

                <div class="mb-3">
                  <label for="password" class="form-label">Password</label>
                  <div class="input-group">
                    <input
                      type="password"
                      id="password"
                      name="password"
                      class="form-control"
                      required
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
                  <div class="invalid-feedback">
                    Please enter your password.
                  </div>
                </div>

                <button type="submit" class="btn btn-primary btn-lg btn-block">
                  Login
                </button>

                <c:if test="${param.error != null}">
                  <div class="mt-3 text-danger text-center">
                    Invalid username or password
                  </div>
                </c:if>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>

    <script>
      function togglePasswordVisibility() {
        var passwordField = document.getElementById("password");

        if (passwordField.type === "password") {
          passwordField.type = "text";
          document.getElementById("eye-icon").classList.remove("bi-eye");
          document.getElementById("eye-icon").classList.add("bi-eye-slash");
        } else {
          passwordField.type = "password";
          document.getElementById("eye-icon").classList.remove("bi-eye-slash");
          document.getElementById("eye-icon").classList.add("bi-eye");
        }
      }
    </script>
  </body>
</html>