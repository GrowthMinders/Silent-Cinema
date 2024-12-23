<%-- 
    Document   : login
    Created on : Nov 24, 2024, 11:22:56 AM
    Author     : Supun
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest, jakarta.servlet.http.HttpServletResponse" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Silent Cinemas Login</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="./CSS/Login.css" rel="stylesheet">
</head>
<body class="bg-gradient">
    <div class="container d-flex justify-content-center align-items-center vh-100" style="flex-direction: column;">

        <div class="card p-4 shadow-lg rounded" style="width: 100%; max-width: 500px;">
        <div style=" margin-bottom: 5px;">
            <a href="./index.jsp"><img src="./Images/Logo.png" alt="Logo" width="80"></a>
        </div>
            <p style="font-size: 24px; font-weight: bold;">ENTER MAIL(TO SEND RECEIPT)</p>
            <form action="./PaymentServlet" method="get">
                <div class="mb-3">
                     <input type="text" id="seldate" name="seldate" value="<%= request.getParameter("seldate") %>" hidden>
                        <input type="text" id="seltime" name="seltime" value="<%= request.getParameter("seltime") %>" hidden>
                        <input type="text" id="selmovie" name="selmovie" value="<%= request.getParameter("selmovie") %>" hidden>
                        <input type="text" id="selseats" name="selseats" value="<%= request.getParameter("selseats") %>" hidden>
                        <input type="text" id="seatprice" name="seatprice" value="<%= request.getParameter("seatprice") %>" hidden>
                        <input type="text" id="seatno" name="seatno" value="<%= request.getParameter("seatno") %>" hidden>
                        <input type="email" id="email" name="email" placeholder="EMAIL" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-primary w-100">Next</button>
            </form>

        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

