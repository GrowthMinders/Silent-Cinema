<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
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
    

 <%
    String url = "jdbc:sqlserver://192.168.121.250\\DATABASESERVER:1433;databaseName=Silent;encrypt=true;trustServerCertificate=true";
    String username = "Supun";
    String password = "Rulz@2002";

    String movieId = request.getParameter("movieId");
    

    try {
        // Load the JDBC driver
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

        // Establish the connection
        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement sql = conn.prepareStatement("SELECT * FROM movie WHERE mid = ?")) {

            // Set the parameter
            sql.setString(1, movieId);

            // Execute the query
            try (ResultSet result = sql.executeQuery()) {
                if (result.next()) {
%>
                    <div class="banner-container">  
                        <div class="banner">
                            <img src="./Backend_Images/Movies/<%= result.getString("mposter") %>" alt="Movie Banner" class="img-fluid">
                            <div class="banner-content">
                                <h1><%= result.getString("mname") %></h1>
                                <p class="imdb-rating">IMDB Rating: <span><%= result.getString("mrating") %></span></p>
                                <div class="button-group">
                                    <form name ="flmbuytck" action="./Buytickets.jsp" method="post">
                                          <input type="hidden" name="movieId" id="movieId" value="<%= result.getString("mid") %>">
                                              <a href="#" onclick="document.forms['flmbuytck'].submit();" class="btn btn-danger">BUY TICKETS</a>
                                    </form>
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
                                <p><%= result.getString("mdetails") %></p>
                                <p><strong>Genre:</strong> <%= result.getString("mgenre") %></p>
                            </div>

                            <!-- Cast & Team Info -->
                            <div class="col-md-4">
                                <h4>CAST</h4>
                                <p><%= result.getString("mcast").replace(",", "<br>") %></p>
                                
                                <h4>TEAM</h4>
                                <p><%= result.getString("mfacts").replace(",", "<br>") %></p>
                            </div>
                        </div>
                    </div>
<%
                }
                    
            }
        }
    } catch (Exception ex) {
        out.println("<p>Error: " + ex.getMessage() + "</p>");
    }
%>

  <%@ include file="Header_Footer/Footer.jsp" %>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
