<%-- 
    Document   : login
    Created on : Nov 24, 2024, 11:22:56 AM
    Author     : Osandi
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="Header_Footer/Nav.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Silent Cinemas</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="./CSS/Home.css">
</head>
<body>
    <section class="hero text-center py-5">
        <div class="container">
            <h1 class="display-3">Let’s Book Your Movies</h1>
            <p class="lead">Book Latest Movies and Theaters and more</p>
            <div class="input-group w-50 mx-auto">
                <input type="text" class="form-control" placeholder="Search for the Movies, Theaters">
                <button class="btn btn-dark">🔍</button>
            </div>
        </div>
    </section>

    
    <section class="latest-movies py-5">
        <div class="container">
            <h2 class="text-center mb-4">Latest Movies</h2>
            <div class="row g-4">
               
                <%
                    String[][] movies = {
                        {"Fighter", "10.30 AM | 1.30 PM | 4.30 PM", "1500 LKR onwards", "192.168.209./fighter.png"},
                        {"Avatar The Last Airbender", "10.30 AM | 1.30 PM | 7.30 PM", "1450 LKR onwards", "images/avatar.png"},
                        {"Kill", "1.30 PM | 8.00 PM", "1600 LKR onwards", "file:///D:/Web%20Content/kill.webp"}
                    };
                    for (String[] movie : movies) {
                %>
                <div class="col-md-4">
                    <div class="card">
                        <img src="<%= movie[3] %>" class="card-img-top" alt="<%= movie[0] %>">
                        <div class="card-body" onclick="window.location.href='./Film Details.jsp'">
                            <h5 class="card-title"><%= movie[0] %></h5>
                            <p class="card-text"><%= movie[1] %><br>Silent Cinemas<br><br><%= movie[2] %></p>
                            <a href="./Buytickets.jsp" class="btn btn-primary">BUY TICKETS</a>
                            </div>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
    </section>
   <%@ include file="Header_Footer/Footer.jsp" %>           
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

