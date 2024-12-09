<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="Header_Footer/Nav.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Movie Details</title>
  
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="./CSS/Film Details.css">
</head>
<body>

  <!-- Banner Section -->
  <div class="banner-container">
    <div class="banner">
      <img src="Singham-Again-Movie-Review-1.jpg" alt="Movie Banner" class="img-fluid">
      <div class="banner-content">
        <h1>VENOM: Avatar The Last Airbender</h1>
        <p class="imdb-rating">IMDB Rating: <span>0/10</span></p>
        <div class="button-group">
          <a href="#" class="btn btn-danger">BUY TICKETS</a>
          <a href="#" class="btn btn-primary">WATCH TRAILER</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Movie Details Section -->
  <div class="container details-container">
    <div class="row">
      <!-- Movie Info -->
      <div class="col-md-8">
        <h4>STORY LINE</h4>
        <p>Four elemental nations are at war with each other, and only the Avatar, master of all four elements, can restore peace. The new Avatar comes in the form of Aang, who strives to fulfill his destiny...</p>
        <p><strong>Program creators:</strong> Michael Dante DiMartino, Bryan Konietzko</p>
        <p><strong>First episode date:</strong> February 21, 2005 (USA)</p>
        <p><strong>Genre:</strong> Action, Adventure, Comedy Drama, Fantasy</p>
        <p><strong>Network:</strong> Nickelodeon</p>
      </div>

      <!-- Cast & Team Info -->
      <div class="col-md-4">
        <h4>CAST</h4>
        <ul>
          <li>Jack De Sena</li>
          <li>Zach Tyler Eisen</li>
          <li>Dante Basco</li> 
          <li>Michaela Jill Murphy</li>
        </ul>
        
        <h4>TEAM</h4>
        <ul>
          <li>Directed by - M. Night Shyamalan</li>
          <li>Produced by - Nickelodeon Animation Studios</li>
          <li>Written by - Aaron Gabriel Ehasz</li>
          <li>Music by - Jeremy Zuckerman</li>
        </ul>
      </div>
    </div>
  </div>

  <%@ include file="Header_Footer/Footer.jsp" %>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
