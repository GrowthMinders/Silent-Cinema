<%-- 
    Document   : login
    Created on : Nov 24, 2024, 11:22:56 AM
    Author     : Osandi
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ include file="Header_Footer/Nav.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Silent Cinemas</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

    
    <link rel="stylesheet" href="./CSS/Home.css">
</head>
<body>
    <section class="hero text-center py-5">
        <div class="container">
            <h1 class="display-3">Let’s Book Your Movies</h1>
            <p class="lead">Book Latest Movies and Theaters and more</p>
            <div class="input-group w-50 mx-auto">
                <input type="text" class="form-control" placeholder="Search for the Movies, Theaters">
                <button class="btn btn-dark">🔍</button>
            </div>
        </div>
    </section>

    
   <section class="latest-movies py-5">
    <div class="container">
        <h2 class="text-center mb-4">Latest Movies</h2>
        <div class="row g-4">
            <%
                String url = "jdbc:sqlserver://192.168.121.250\\DATABASESERVER:1433;databaseName=Silent;encrypt=true;trustServerCertificate=true";
                String username = "Supun";
                String password = "Rulz@2002";

                String moviename = "";
                String movielocation = "";
                String movieposter = "";
                String movieprice = "";
                String movieid = "";
                String time[] = new String[5];

                try {
                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                    Connection conn = DriverManager.getConnection(url, username, password);
                    PreparedStatement sql = conn.prepareStatement("SELECT TOP 3 * FROM movie");
                    PreparedStatement sql1 = conn.prepareStatement("SELECT * FROM timming");

                    ResultSet result = sql.executeQuery();

                    while (result.next()) {
                        moviename = result.getString("mname");
                        movielocation = result.getString("mtheater");
                        movieposter = result.getString("mposter");
                        movieprice = result.getString("mprice");
                        movieid = result.getString("mid");

                        boolean timing = false;

                        // Re-execute the timing query for each movie
                        ResultSet result1 = sql1.executeQuery();
                        int i = 0;
                        while (result1.next()) {
                            if (moviename.equals(result1.getString("movie")) && movielocation.equals(result1.getString("theater"))) {
                                time[i] = result1.getString("stime");
                                i++;
                                timing = true;
                            }
                        }
            %>
                        <div class="col-md-4">
                            <div class="card shadow-sm border-0" style="width: 100%; border-radius: 10px; overflow: hidden; max-width: 350px;">
                                <img src="./Backend_Images/Movies/<%= movieposter %>" class="card-img-top" alt="<%= movieposter %>" style="height: 250px; object-fit: cover;">
                                <div class="card-body" style="background: #f8f9fa; padding: 15px;">
                                    <h5 class="card-title text-center" style="font-weight: bold; color: #343a40; margin-bottom: 10px;">
                                        <%= moviename %>
                                    </h5>
                                    <% if (timing) { %>
                                        <div class="time-container d-flex justify-content-center flex-wrap" style="gap: 8px; margin-bottom: 10px;">
                                            <% for (i = 0; i < 5; i++) {
                                                if (time[i] != null && !time[i].isEmpty()) { %>
                                                    <span class="badge bg-primary" style="font-size: 0.85rem; padding: 5px 10px;">
                                                        <%= time[i] %>
                                                    </span>
                                            <% } 
                                            } %>
                                        </div>
                                    <% } %>
                                    <p class="card-text text-center" style="color: #6c757d; font-size: 0.9rem; margin-bottom: 10px;">
                                        <i class="fas fa-map-marker-alt"></i> <%= movielocation %><br>
                                        <strong style="color: #212529;"><%= movieprice %> LKR</strong>
                                    </p>
                                    <form action="./Film_Details.jsp" method="post" class="d-grid gap-2">
                                        <input type="hidden" name="movieId" id="movieId" value="<%= movieid %>">
                                        <button type="submit" class="btn btn-outline-primary" style="font-weight: bold;">Film Details</button>
                                    </form>
                                </div>
                            </div>
                        </div>
            <%
                        result1.close();
                    }

                    conn.close();
                } catch (Exception ex) {
                    out.println("<p style='color: red;'>Error: " + ex.getMessage() + "</p>");
                }
            %>
        </div>
    </div>
</section>


   <%@ include file="Header_Footer/Footer.jsp" %>           
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

