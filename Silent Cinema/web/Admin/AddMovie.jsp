<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Movie Details</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">
    <div class="container py-5">
        <div class="card shadow mx-auto" style="max-width: 600px;">
            <div class="card-body">
                <h2 class="text-center mb-4">Add Movie Details</h2>
                <form action="add_movie.jsp" method="POST" enctype="multipart/form-data">
                    
                    <div class="mb-3">
                        <label for="movie-name" class="form-label">Movie Name:</label>
                        <input type="text" id="movie-name" name="movie_name" class="form-control" placeholder="Enter Movie Name" required>
                    </div>

                    
                    <div class="mb-3">
                        <label for="movie-poster" class="form-label">Movie Poster:</label>
                        <input type="file" id="movie-poster" name="movie_poster" class="form-control" accept="image/*" required>
                    </div>

                    
                    <div class="mb-3">
                        <label for="movie-details" class="form-label">Movie Details:</label>
                        <textarea id="movie-details" name="movie_details" class="form-control" rows="4" placeholder="Enter Movie Description" required></textarea>
                    </div>

                    
                    <div class="mb-3">
                        <label for="movie-cast" class="form-label">Cast:</label>
                        <textarea id="movie-cast" name="movie_cast" class="form-control" rows="3" placeholder="Enter Cast Details (e.g., Actor 1, Actor 2...)" required></textarea>
                    </div>

                    
                    <div class="mb-3">
                        <label for="movie-facts" class="form-label">Facts:</label>
                        <textarea id="movie-facts" name="movie_facts" class="form-control" rows="3" placeholder="Enter Interesting Facts"></textarea>
                    </div>

                    
                    <div class="mb-3">
                        <label for="trailer-link" class="form-label">Trailer Link:</label>
                        <input type="url" id="trailer-link" name="trailer_link" class="form-control" placeholder="Enter YouTube Trailer Link" required>
                    </div>

                    
                    <div class="mb-3">
                        <label for="movie-rating" class="form-label">Rating:</label>
                        <input type="number" id="movie-rating" name="movie_rating" class="form-control" placeholder="Enter Rating (1 to 10)" min="1" max="10" step="0.1" required>
                    </div>

                    
                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary">Add Movie</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
