<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Movie Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="Eddit Movie.css">
</head>

<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4">Edit Movie Details</h2>
        <form action="edit_movie.jsp" method="POST" enctype="multipart/form-data">
            
            
            <div class="mb-3">
                <label for="old-movie-name" class="form-label">Old Movie Name:</label>
                <input type="text" id="old-movie-name" class="form-control" value="${movie.name}" readonly>
            </div>

            
            <div class="mb-3">
                <label for="new-movie-name" class="form-label">New Movie Name:</label>
                <input type="text" id="new-movie-name" name="movie_name" class="form-control" value="${movie.name}" required>
            </div>

            
            <div class="mb-3">
                <label class="form-label">Current Movie Poster:</label>
                <div class="text-center">
                    <img src="${movie.poster}" alt="Old Movie Poster" id="preview-image" class="img-fluid rounded border">
                </div>
            </div>

            
            <div class="mb-3">
                <label for="movie-poster" class="form-label">New Movie Poster:</label>
                <input type="file" id="movie-poster" name="movie_poster" accept="image/*" class="form-control">
            </div>

            
            <div class="mb-3">
                <label for="movie-details" class="form-label">Movie Details:</label>
                <textarea id="movie-details" name="movie_details" class="form-control" rows="4" required>${movie.details}</textarea>
            </div>

           
            <div class="mb-3">
                <label for="movie-cast" class="form-label">Cast:</label>
                <textarea id="movie-cast" name="movie_cast" class="form-control" rows="3" required>${movie.cast}</textarea>
            </div>

          
            <div class="mb-3">
                <label for="movie-facts" class="form-label">Facts:</label>
                <textarea id="movie-facts" name="movie_facts" class="form-control" rows="3">${movie.facts}</textarea>
            </div>

          
            <div class="mb-3">
                <label for="trailer-link" class="form-label">Trailer Link:</label>
                <input type="url" id="trailer-link" name="trailer_link" class="form-control" value="${movie.trailerLink}" required>
            </div>

           
            <div class="mb-3">
                <label for="movie-rating" class="form-label">Rating:</label>
                <input type="number" id="movie-rating" name="movie_rating" class="form-control" min="1" max="10" step="0.1" value="${movie.rating}" required>
            </div>

            
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Edit Movie</button>
            </div>
        </form>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
