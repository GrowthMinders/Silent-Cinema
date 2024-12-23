<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
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
    <% HttpSession name = request.getSession(false);
        String uname ="";
        if (name != null && name.getAttribute("uname") != null){
            uname = (String) name.getAttribute("uname");%>

           <%   
                      String url ="jdbc:sqlserver://192.168.121.250\\DATABASESERVER:1433;databaseName=Silent;encrypt=true;trustServerCertificate=true";
                      String username = "Supun";
                      String password = "Rulz@2002"; 
                      
                      String theater [] = new String[100];
                       try {
                             Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                             Connection conn = DriverManager.getConnection(url, username, password);
                             PreparedStatement sql = conn.prepareStatement("SELECT * FROM customer WHERE fname = ?");
                             
                             sql.setString(1, uname);
                             
                             ResultSet result = sql.executeQuery();
            
                             if(result.next()){ %>
                                 <div class="profile-details">
                                    <p><strong>First Name:</strong><%= result.getString("fname")%></p><br>
                                    <p><strong>Last Name:</strong><%= result.getString("lname")%></p><br>
                                    <p><strong>Email:</strong><%= result.getString("email")%></p><br>
                                    <p><strong>Gender:</strong><%= result.getString("gen")%></p><br>
                                    <p><strong>Contact Number:</strong><%= result.getString("tel")%></p><br>
                                    <p><strong>NIC Number:</strong><%= result.getString("nic")%></p><br>
                                    <p><strong>Password:</strong> *********</p><br>
                                    <form action="./Edit_Profile.jsp" method="post">
                                       <input type="hidden" name="custid" id="custid" value="<%= result.getString("id")%>">
                                           <button type="submit" class="edit-btn">Edit Profile</button>
                                    </form>
                                    <button class="logout-btn" onclick="window.location.href='LogoutServletCust'">Log Out</button>
                                 </div>
                            <% }
   
                             conn.close();
                       } catch (Exception ex) {
                
                       } %>
                      
   <% } %>
    
    <div></center>


    
    <%@ include file="Header_Footer/Footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  
</body>
</html>
