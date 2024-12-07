<%-- 
    Document   : login
    Created on : Nov 24, 2024, 11:22:56 AM
    Author     : Osandi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Functionality.LoginServletEmail.match"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Silent Cinemas Login</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./CSS/Login.css">
    <link rel="stylesheet" href="./CSS/Errors.css">
    
    <script src="./JS/Login/Logvalidate.js"></script>
    <script src="./JS/Login/logauthenticateemail.js"></script>
</head>
<body class="bg-gradient" onload="check();">
    <script>
        <% if(match.state == 1){ %>
            var mail;
            mail = <%= match.state%>;
        <% } %>
    </script>
    <div class="container d-flex justify-content-center align-items-center vh-100" style="flex-direction: column;">
          <span id="errors" style="display: none;">
          </span>
        <div class="card p-4 shadow-lg rounded" style="width: 100%; max-width: 400px;">
            <form action="./LoginServletEmail" method="post" onsubmit="return logval();">
                <div class="mb-3">
                    <input type="email" id="email" name="email" placeholder="EMAIL" class="form-control">
                </div>
                <button type="submit" class="btn btn-primary w-100">Next</button>
            </form>
            <div class="text-center mt-3">
                <p class="mt-2">Don't have an account? <a href="./Registration.jsp" class="text-decoration-none">Create New</a></p>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

