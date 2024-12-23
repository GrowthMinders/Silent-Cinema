<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Showtime</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light d-flex justify-content-center align-items-center vh-100">
    <div class="container p-4 bg-white rounded shadow">
        <h2 class="text-center mb-4">Add Showtime</h2>
        <form action="../ShowtimingAdd" method="post">
            
             <%   
                      String url ="jdbc:sqlserver://192.168.121.250\\DATABASESERVER:1433;databaseName=Silent;encrypt=true;trustServerCertificate=true";
                      String username = "Supun";
                      String password = "Rulz@2002"; 
                      
                      String theater [] = new String[100];
                       try {
                             Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                             Connection conn = DriverManager.getConnection(url, username, password);
                             PreparedStatement sql = conn.prepareStatement("SELECT tname FROM theater");

                             ResultSet result = sql.executeQuery();
            
                             for(int i =0;result.next() && i < theater.length;i++){
                                 theater[i] = result.getString("tname");
                             }
   
                             conn.close();
                       } catch (Exception ex) {
                
                       }
                       

                       String movies [] = new String[100];
                       try {
                             Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                             Connection conn = DriverManager.getConnection(url, username, password);
                             PreparedStatement sql = conn.prepareStatement("SELECT mname FROM movie");

                             ResultSet result = sql.executeQuery();
            
                             for(int i =0;result.next() && i < movies.length;i++){
                                 movies[i] = result.getString("mname");
                             }
   
                             conn.close();
                       } catch (Exception ex) {
                
                       }
               %>     
            <div class="mb-3">
                <label for="theater" class="form-label">Select Theater:</label>
                <select id="theater" name="theater" class="form-select" required>
                    <option selected hidden>Select Theater</option>
                    <% for(int i=0; i < theater.length; i++){ 
                            if(theater[i] != null){  %>                  
                                <option value="<%= theater[i]%>"><%= theater[i]%></option>
                            <% } %>    
                    <% } %> 
                </select>
            </div>

            <div class="mb-3">
                <label for="movie" class="form-label">Select Movie:</label>
                <select id="movie" name="movie" class="form-select" required>
                    <option selected hidden>Select Movie</option>
                    <% for(int i=0; i < movies.length; i++){ 
                            if(movies[i] != null){  %>                  
                                <option value="<%= movies[i]%>"><%= movies[i]%></option>
                            <% } %>    
                    <% } %> 
                </select>
            </div>

            <div class="mb-3">
                <label for="start-date" class="form-label">Start Date:</label>
                <input type="date" id="sdate" name="sdate" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="end-date" class="form-label">End Date:</label>
                <input type="date" id="edate" name="edate" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="start-time" class="form-label">Start Time:</label>
                <input type="text" id="stime" name="stime" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="end-time" class="form-label">End Time:</label>
                <input type="text" id="etime" name="etime" class="form-control" required>
            </div>

            <div class="d-flex justify-content-between">
                <button type="submit" class="btn btn-primary">Add Showtime</button>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
