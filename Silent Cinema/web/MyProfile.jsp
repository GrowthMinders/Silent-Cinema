<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="Header_Footer/Nav.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Profile</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="./CSS/MyProfile.css">
</head>
<body>
<center><div class="container">
  <div class="profile-container">
    <h1 class="text-white">My Profile</h1>
    <div class="profile-image">
      <img src="./Images/Person.png" alt="Profile Image" />
    </div>
    <div class="profile-details">
      <p><strong>First Name:</strong> Mehrab</p><br>
      <p><strong>Last Name:</strong> Bozorgi</p><br>
      <p><strong>Email:</strong> Mehrabbozorgi.business@gmail.com</p><br>
      <p><strong>Address:</strong> 33062 Zboncak Isle</p><br>
      <p><strong>Contact Number:</strong> 58077.79</p><br>
      <p><strong>NIC Number:</strong> 123456789765</p><br>
      <p><strong>Password:</strong> *********</p><br>
      <button class="edit-btn" onclick="window.location.href='./Edit Profile.jsp'">Edit Profile</button>
    </div>
    <div></center>


    
    <%@ include file="Header_Footer/Footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  </div>
</body>
</html>
