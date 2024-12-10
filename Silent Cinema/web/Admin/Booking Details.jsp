<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="Booking Details.css">
</head>

<body>
    <div class="container container-custom">
        <h2 class="text-center">Booking Details</h2>
        <div class="table-responsive">
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>User</th>
                        <th>Show ID</th>
                        <th>Show Date</th>
                        <th>Status</th>
                        <th>Category</th>
                        <th>Booked On</th>
                        <th>Seat</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="booking" items="${bookings}">
                        <tr>
                            <td>${booking.id}</td>
                            <td>${booking.user}</td>
                            <td>${booking.showId}</td>
                            <td>${booking.showDate}</td>
                            <td>${booking.status}</td>
                            <td>${booking.category}</td>
                            <td>${booking.bookedOn}</td>
                            <td>${booking.seat}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="d-flex justify-content-center mt-3">
            <button type="button" class="btn btn-close-custom" onclick="window.close()">Close</button>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
