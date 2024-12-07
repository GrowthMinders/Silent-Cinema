<%-- 
    Document   : logpassword
    Created on : Dec 5, 2024, 9:35:56 PM
    Author     : Supun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Functionality.LoginServletEmail.match"%>
<%@ page import="Functionality.LoginServletPass.match1"%>
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
    <script src="./JS/Login/logauthenticatepass.js"></script>
</head>
<body class="bg-gradient" onload="check1();">
    <script>
        <% if(match1.state1 == 1){ %>
            var pass;
            pass = <%= match1.state1%>;
        <% } %>
    </script>
    <div class="container d-flex justify-content-center align-items-center vh-100" style="flex-direction: column;">
            <span id="errors" style="display: none;">
            </span>
        <div class="card p-4 shadow-lg rounded" style="width: 100%; max-width: 400px;">
            <form action="./LoginServletPass" method="post" onsubmit="return logval1();">
                <div class="mb-3">
                    <input type="password" id="pass" name="pass" placeholder="PASSWORD" class="form-control">
                </div>
                <input type="email" id="email" name="email" value="<%= match.emailrec%>" hidden>
                <button type="submit" class="btn btn-primary w-100">Login</button>
            </form>
            <div class="text-center mt-3">
                <a href="./Forgotpw.jsp" class="text-decoration-none">Forgot Password?</a>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

