<%-- 
    Document   : movies
    Created on : Dec 5, 2024, 12:56:35?PM
    Author     : ?Isuu?
--%>
<%@ include file="Header_Footer/Nav.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Silent Cinemas</title>
    
</head>
<body>
    <div class="container my-5">
        <h2 class="text-white text-uppercase">Now Showing</h2>
        <div id="now-showing" class="row">
            <!-- Now Showing Movies -->
            <div id="nowShowingCarousel" class="carousel slide">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#nowShowingCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#nowShowingCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#nowShowingCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner" style="height: auto;">
                    <div class="carousel-item active">
                        <img src="./images/movies/Singham-Again-Movie-Review-1.png" class="d-block w-100" alt="Singham Again Movie">
                    </div>
                    <div class="carousel-item" style="height: auto;">
                        <img src="./images/movies/movie2.png" class="d-block w-100" alt="Movie 2">
                    </div>
                    <div class="carousel-item" style="height: auto;">
                        <img src="./images/movies/movie3.png" class="d-block w-100" alt="Movie 3">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#nowShowingCarousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#nowShowingCarousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>

        <h2 class="text-white text-uppercase">Coming Soon</h2>
        <div id="coming-soon" class="row">
            <!-- Coming Soon Movies -->
            <div id="comingSoonCarousel" class="carousel slide">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#comingSoonCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#comingSoonCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#comingSoonCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active" style="height: auto;">
                        <img src="./images/movies/Singham-Again-Movie-Review-1.png" class="d-block w-100" alt="Singham Again Movie">
                    </div>
                    <div class="carousel-item" style="height: auto;">
                        <img src="./images/movies/coming-soon-movie2.png" class="d-block w-100" alt="Coming Soon Movie 2">
                    </div>
                    <div class="carousel-item" style="height: auto;">
                        <img src="./images/movies/coming-soon-movie3.png" class="d-block w-100" alt="Coming Soon Movie 3">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#comingSoonCarousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#comingSoonCarousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
    </div>

   
    <%@ include file="Header_Footer/Footer.jsp" %> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

