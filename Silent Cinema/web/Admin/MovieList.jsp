<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="MovieList.css">
    <title>Movie List</title>
</head>
<body>
    <div class="container">
        <h2>Movies List</h2>
        <table>
            <thead>
                <tr>
                    <th>S.No</th>
                    <th>Movie Name</th>
                    <th>Poster</th>
                    <th>Trailer</th>
                    <th>Delete</th>
                    <th>Modify</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="movie" items="${movies}">
                    <tr>
                        <td>${movie.id}</td>
                        <td>${movie.name}</td>
                        <td><img src="${movie.poster}" alt="${movie.name}" class="poster"></td>
                        <td><a href="${movie.trailerLink}" target="_blank">View Trailer</a></td>
                        <td>
                            <form action="deleteMovie" method="post">
                                <input type="hidden" name="movieId" value="${movie.id}">
                                <button type="submit" class="delete-button">
                                    <img src="icons8-delete-24.png" alt="Delete" class="icon">
                                </button>
                            </form>
                        </td>
                        <td><button class="modify-button">Edit</button></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
