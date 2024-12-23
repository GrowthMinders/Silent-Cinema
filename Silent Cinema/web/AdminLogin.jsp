<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Functionality.AdminLogin.match2"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./CSS/AdminLogin.css">
    <link rel="stylesheet" href="./CSS/Errors.css">
    
    <script src="./JS/Login/logauthenticatepass.js"></script>
</head>

<body class="bg-light d-flex justify-content-center align-items-center vh-100 " style="flex-direction: column;"  onload="check1();">
    <script>
        <% if(match2.state2 == 1){ %>
            var pass;
            pass = <%= match2.state2%>;
        <% } %>
    </script>
    <span id="errors" style="display: none;">
    </span>
    <div class="card shadow" style="max-width: 400px; width: 100%;">
          
        <div class="card-body">
            <h2 class="text-center mb-4">Admin Login</h2>
            <form action="./AdminLogin" method="POST">
                <div class="mb-3">
                    <label for="email" class="form-label">Username:</label>
                    <input type="text" id="email" name="email" class="form-control" placeholder="Enter email" required>
                </div>
                <div class="mb-3">
                    <label for="pass" class="form-label">Password:</label>
                    <input type="password" id="pass" name="pass" class="form-control" placeholder="Enter password" required>
                </div>
                <div class="d-grid">
                    <button type="submit" class="btn btn-primary">Login Admin</button>
                </div>
            </form>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
