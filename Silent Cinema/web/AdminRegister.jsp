<%-- 
    Document   : AdminRegister
    Created on : Dec 11, 2024, 1:30:06 PM
    Author     : Supun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./CSS/Registration.css">
</head>
<body>
    <div class="container">
        <div class="logo">
            <a href="./index.jsp"><img src="./Images/Logo.png" alt="Logo"></a>
        </div>
        <h1>CREATE ACCOUNT</h1>
          <form action = "AdminRegisterServlet" method="post" name="reg">
              <input type="text" name = "fname" id = "fname" placeholder="FIRST NAME" required>
              <input type="text" name = "lname" id = "lname" placeholder="LAST NAME" required>
              <input type="email" name = "email" id = "email" placeholder="EMAIL" required>
              <input type="password" name = "pass" id = "pass" placeholder="PASSWORD" required>  
              <button type="submit">REGISTER</button>
          </form>
    </div>
</body>
</html>
