<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Profile</title>
  <link rel="stylesheet" href="./CSS/MyProfile.css">
</head>
<body>
  <div class="profile-container">
    <h1>My Profile</h1>
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
    </div>
    <button class="edit-btn" onclick="alert('Edit functionality is disabled!')">Edit Profile</button>
  </div>
</body>
</html>
