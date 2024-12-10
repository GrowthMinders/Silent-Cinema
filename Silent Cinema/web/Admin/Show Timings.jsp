<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Show Timings</title>
    <link rel="stylesheet" href="Show Timings.css">
</head>
<body>
    <div class="container">
        <h2>Show Timings</h2>
        <button class="btn-add-show">Add Show</button>
        <button class="btn-delete-selected">Delete Selected</button>
        <table>
            <thead>
                <tr>
                    <th>Select</th>
                    <th>S.No</th>
                    <th>Theater</th>
                    <th>Movie</th>
                    <th>Start/End Date</th>
                    <th>Ticket Price</th>
                    <th>Delete</th>
                    <th>Modify</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="show" items="${showTimings}">
                    <tr>
                        <td><input type="checkbox" name="select" value="${show.id}"></td>
                        <td>${show.id}</td>
                        <td>${show.theater}</td>
                        <td>${show.movie}</td>
                        <td>${show.startDate} / ${show.endDate}</td>
                        <td>Rs.${show.ticketPrice}</td>
                        <td>
                            <form action="deleteShow" method="post">
                                <input type="hidden" name="showId" value="${show.id}">
                                <button type="submit" class="btn-delete">
                                    <img src="icons8-delete-24.png" alt="Delete" class="icon">
                                </button>
                            </form>
                        </td>
                        <td><button class="btn-edit">Edit</button></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
