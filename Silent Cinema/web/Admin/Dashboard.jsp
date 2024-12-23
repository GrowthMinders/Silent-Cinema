<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dynamic Admin Panel Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../CSS/Dash.css">
</head>

<body>
    <div class="sidebar">
        <div class="profile">
            <img src="../Images/Admin/download.jpg" alt="Super Admin">
              <% String uname = "";
                  HttpSession name = request.getSession(false);
                if (name != null && name.getAttribute("uname") != null){ 
                   uname = (String) name.getAttribute("uname");
              %>
                <h3><%= uname%></h3>
            <% } %>  

            
        </div>
        <ul class="nav flex-column">
            <li><a href="../Admin/Dashboard.jsp" id="fun">Dashboard</a></li>
            <li><a href="../Admin/Add_TM.jsp" id="fun">Movie Theaters</a></li>
            <li><a href="../Admin/Add_Movie.jsp" id="fun">Movies</a></li>
            <li><a href="../Admin/Add_Showtimings.jsp" id="fun">Show Timings</a></li>
          <% if("Supun".equals(uname)){ %>  
              <li><a href="../AdminRegister.jsp" id="fun">Create Admin</a></li>
          <% } %>    
            <li><a href="../LogoutServlet" id="out">Log Out</a></li>
        </ul>
    </div>
<%   
                      String url ="jdbc:sqlserver://192.168.121.250\\DATABASESERVER:1433;databaseName=Silent;encrypt=true;trustServerCertificate=true";
                      String username = "Supun";
                      String password = "Rulz@2002"; 
                      
                      int usercount = 0;
                      int theatercount = 0;
                      int moviecount = 0;
                      int timingcount = 0;
                      
                       try {
                             Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                             Connection conn = DriverManager.getConnection(url, username, password);
                             PreparedStatement sql = conn.prepareStatement("SELECT * FROM customer");

                             ResultSet result = sql.executeQuery();

                             if(result.next()){
                               for(usercount = 1; result.next();++usercount){
                               }
                             }
                             
                             conn.close();
                       } catch (Exception ex) {
                
                       }
                       

                       
                       try {
                             Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                             Connection conn = DriverManager.getConnection(url, username, password);
                             PreparedStatement sql = conn.prepareStatement("SELECT * FROM theater");

                             ResultSet result = sql.executeQuery();

                             if(result.next()){
                               for(theatercount = 1; result.next();++theatercount){
                               }
                             }
                             
                             conn.close();
                       } catch (Exception ex) {
                
                       }
                       
                       
                       try {
                             Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                             Connection conn = DriverManager.getConnection(url, username, password);
                             PreparedStatement sql = conn.prepareStatement("SELECT * FROM movie");

                             ResultSet result = sql.executeQuery();

                             if(result.next()){
                                for(moviecount = 1; result.next();++moviecount){
                                }
                             }
                             
                             conn.close();
                       } catch (Exception ex) {
                
                       }
                       
                       
                        try {
                             Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                             Connection conn = DriverManager.getConnection(url, username, password);
                             PreparedStatement sql = conn.prepareStatement("SELECT * FROM timming");
                             

                             ResultSet result = sql.executeQuery();

                             if(result.next()){
                                for(timingcount = 1; result.next();++timingcount){
                                }
                             }
                             
                             conn.close();
                       } catch (Exception ex) {
                
                       }

               %>     
    <div class="main-content">
        <div class="header mb-4">
            <h1>Dashboard</h1>
            <p>Control Panel</p>
        </div>

        <div class="row g-3">
            <div class="col-md-6 col-lg-3">
                <div class="stat-box users">
                    <h2 id="user-count"></h2>
                    <p>Users</p>
                    <p style="font-weight: bold; color: black;">(<%= usercount%>)</p>
                    <a href="../Admin/Users.jsp">More info</a>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="stat-box theatres">
                    <h2 id="theatre-count"></h2>
                    <p>Theaters</p>
                    <p style="font-weight: bold; color: black;">(<%= theatercount%>)</p>
                    <a href="../Admin/Theater.jsp">More info</a>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="stat-box movies">
                    <h2 id="movie-count"></h2>
                    <p>Movies</p>
                    <p style="font-weight: bold; color: black;">(<%= moviecount%>)</p>
                    <a href="../Admin/MovieList.jsp">More info</a>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="stat-box bookings">

                    <h2 id="booking-count"></h2>
                    <p>Timings</p>
                    <p style="font-weight: bold; color: black;">(<%= timingcount%>)</p>
                    <a href="../Admin/Show_Timings.jsp">More info</a>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
