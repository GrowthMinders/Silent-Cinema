<%-- 
    Document   : Offers
    Created on : Dec 7, 2024, 10:53:00?AM
    Author     : Nethmini
--%>
<%@ include file="Header_Footer/Nav.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Silent Cinemas Offers</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="./CSS/Offer.css">
</head>
<body>
   

    <main class="offers-container  p-6 m-5  mb-5 pt-5 pb-5">
  <!-- Early Bird Offer -->
    <div class="offer-card col-md-6 mb-3">
      <img src="./Images/Offers/Offer-1.jpg" alt="Early Bird Offer" class="card-image-top offer-image">
      <div class="card-body">
        <h3 class="card-title">Early Bird:<img src="./Images/Offers/Offer-11.jpg" align="center" alt="Special Offer" class="offer-sticker1"></h3>
        <p>Book before noon & save $2 <br>on any tickets.</p>
      </div>
    </div>

    <!--Family Friday Offer -->
    <div class="offer-card col-md-6">
      <img src="./Images/Offers/Offer-2.jpg" alt="Early Bird Offer" class="card-image-top offer-image">
      <div class="card-body">
        <h3 class="card-title">Family Friday:</h3>
        <img src="./Images/Offers/Offer-22.JPG" align="right" alt="Movie Ticket" class="offer-sticker2">
        <p>3 tickets, get the<br>4th free!!!</p>
      </div>
    </div>
  </main>
    
 <%@ include file="Header_Footer/Footer.jsp" %>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


