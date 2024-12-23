<%-- 
    Document   : Edit Profile
    Created on : Dec 9, 2024, 3:48:44?PM
    Author     : Supun
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="jakarta.servlet.http.HttpServletResponse" %>

<%@ include file="Header_Footer/Nav.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./CSS/Edit Profile.css">
</head>
<body class="text-white">
<center><div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6 col-md-8 col-sm-12">
                <div class="card p-4">
                    <div class="card-body">
                        <h2 class="text-center mb-4">Edit Profile</h2>
                        <div class="profile-image">
                            <img src="./Images/Person.png" alt="Profile icon">
                        </div>
                        <form action="../UpdateProfile" method="post">
                            
    <%   
                      String url ="jdbc:sqlserver://192.168.121.250\\DATABASESERVER:1433;databaseName=Silent;encrypt=true;trustServerCertificate=true";
                      String username = "Supun";
                      String password = "Rulz@2002";
                      
                      String id = request.getParameter("custid");
                       try {
                             Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                             Connection conn = DriverManager.getConnection(url, username, password);
                             PreparedStatement sql = conn.prepareStatement("SELECT * FROM customer WHERE id = ?");
                             
                             sql.setString(1, id);
                             
                             ResultSet result = sql.executeQuery();
            
                             if(result.next()){ %>
                                    <input 
                                    type="text" 
                                    id="custid" 
                                    name="custid" 
                                    value="<%= result.getString("id")%>" 
                                    hidden 
                                    required>
                                 <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input 
                                    type="email" 
                                    id="email" 
                                    name="email" 
                                    value="<%= result.getString("email")%>" 
                                    class="form-control" 
                                    required>
                            </div>
                            <div class="mb-3">
                                <label for="contactNumber" class="form-label">Contact Number</label>
                                <input 
                                    type="text" 
                                    id="contactNumber" 
                                    name="contactNumber" 
                                    value="<%= result.getString("tel")%>" 
                                    class="form-control" 
                                    required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input 
                                    type="password" 
                                    id="password" 
                                    name="password" 
                                    class="form-control" 
                                    required>
                            </div>
                            <% }
   
                             conn.close();
                       } catch (Exception ex) {
                
                       } %>
                                      
                            <div class="d-flex justify-content-between">
                                <button type="submit" class="btn btn-success">Save</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div></center>

                                    
   <%@ include file="Header_Footer/Footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
