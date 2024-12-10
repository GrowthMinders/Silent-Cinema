<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dynamic Admin Panel Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="Dashboard.css">
</head>

<body>
    <div class="sidebar">
        <div class="profile">
            <img src="download (3).jpg" alt="Super Admin">
            <h3>Super Admin</h3>
            <p>Online</p>
        </div>
        <ul class="nav flex-column">
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">Movie Theatres</a></li>
            <li><a href="#">Movies</a></li>
            <li><a href="#">Show Timings</a></li>
            <li><a href="#">Users</a></li>
            <li><a href="#">Booking</a></li>
        </ul>
    </div>

    <div class="main-content">
        <div class="header mb-4">
            <h1>Dashboard</h1>
            <p>Control Panel</p>
        </div>

        <div class="row g-3">
            <div class="col-md-6 col-lg-3">
                <div class="stat-box users">
                    <h2 id="user-count">${userCount}</h2>
                    <p>Users</p>
                    <a href="#">More info</a>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="stat-box theatres">
                    <h2 id="theatre-count">${theatreCount}</h2>
                    <p>Theatres</p>
                    <a href="#">More info</a>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="stat-box movies">
                    <h2 id="movie-count">${movieCount}</h2>
                    <p>Movies</p>
                    <a href="#">More info</a>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="stat-box bookings">
                    <h2 id="booking-count">${bookingCount}</h2>
                    <p>Bookings</p>
                    <a href="#">More info</a>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
