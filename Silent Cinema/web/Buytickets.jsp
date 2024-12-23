<%-- 
    Document   : buytickets
    Created on : Dec 5, 2024, 12:56:46?PM
    Author     : ?Isuu?
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
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
                    <div id="carouselExample" class="carousel slide">
            <div class="carousel-inner">
              <div class="carousel-item active" id="carousel-item">
                <img src="./Backend_Images/Movies/<%= result.getString("mposter") %>" class="d-block w-100" alt="<%= result.getString("mposter") %>">
                <div class="carousel-caption" id="sec">
                    <h2 id="movie-label" class="fs-5 mb-3">NOW SHOWING AT SILENT CINEMA</h2>
                        <h1 id="movie-name" class="mb-2"><%= result.getString("mname") %></h1>
                        <div id="movie-lang" class="mb-2">
                            <form name ="flmstbuy" action="./Seat.jsp" method="post">
                                <input type="hidden" name="movieid" id="movieid" value="<%= result.getString("mid") %>">
                                    <a href="#">
                                         <img src="./Images/Buytickets/ticket.png" onclick="document.forms['flmstbuy'].submit();" alt="Left Icon" width="70" height="70" >
                                    </a>
                            </form>
                            
                            <a href="<%= result.getString("tlink") %>">
                                <img src="./Images/Buytickets/youtube.png" alt="Right Icon" width="50" height="50">
                            </a>
                        </div>
                        <p id="movie-duration" class="fs-5">2 H 40 MIN</p>
                </div>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
