<%-- 
    Document   : buytickets
    Created on : Dec 5, 2024, 12:56:46?PM
    Author     : ?Isuu?
--%>
<%@ include file="Header_Footer/Nav.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Buy Tickets</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="./CSS/Buytickets.css">
        
    </head>
    <body>
        <div id="carouselExample" class="carousel slide">
            <div class="carousel-inner">
              <div class="carousel-item active" id="carousel-item">
                <img src="./images/buytickets/Singham-Again-Movie-Review-1.png" class="d-block w-100" alt="...">
                <div class="carousel-caption" id="sec">
                    <h2 id="movie-label" class="fs-5 mb-3">NOW SHOWING AT SILENT CINEMA</h2>
                        <h1 id="movie-name" class="mb-2">SINGHAM AGAIN</h1>
                        <div id="movie-lang" class="mb-2">
                            <a href="./Seat.jsp" target="_blank">
                                <img src="./Images/Buytickets/ticket.png" alt="Left Icon" width="70" height="70">
                            </a>
                            (HINDI)
                            <a href="https://example.com/left-icon" target="_blank">
                                <img src="./Images/Buytickets/youtube.png" alt="Right Icon" width="50" height="50">
                            </a>
                        </div>
                        <p id="movie-duration" class="fs-5">2 H 40 MIN</p>
                </div>
            </div>
            </div>
        </div>
        <%@ include file="Header_Footer/Footer.jsp" %> 
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
