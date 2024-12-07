<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Silent Cinemas</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="<%= request.getContextPath() %>./CSS/Nav.css">
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #1E0890;">
            <div class="container-fluid">
                <!-- Logo -->
                <a class="navbar-brand" href="<%= request.getContextPath() %>./index.jsp">
                    <img src="<%= request.getContextPath() %>./Images/Logo.png" alt="Silent Cinemas Logo" style="width: 50px; height: auto;">
                </a>
                <!-- Hamburger Menu Button -->
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <!-- Navbar Links -->
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link text-white" href="<%= request.getContextPath() %>./index.jsp">HOME</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="<%= request.getContextPath() %>./Movies.jsp">MOVIES</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="<%= request.getContextPath() %>./Deals.jsp">DEALS AND EXCLUSIVES</a>
                        </li>
                        <li class="nav-item highlight">
                            <a class="nav-link text-white" href="<%= request.getContextPath() %>./Buytickets.jsp.jsp">BUY TICKETS</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="<%= request.getContextPath() %>./Logemail.jsp">LOGIN</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
