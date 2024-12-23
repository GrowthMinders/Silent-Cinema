<%-- 
    Document   : Movies
    Created on : Dec 13, 2024, 9:03:37?PM
    Author     : Supun
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ include file="Header_Footer/Nav.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        
        <title>JSP Page</title>
    </head>
    <body>
        <section class="latest-movies py-5 mb-5">
    <div class="container">
        <h2 class="text-center mb-5">Now Showing</h2>
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
                    PreparedStatement sql = conn.prepareStatement("SELECT * FROM movie");
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
                        <div class="col-md-4 mb-5">
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
