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
<body class="bg-dark text-white">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-lg-6 col-md-8 col-sm-12">
                <div class="card p-4">
                    <div class="card-body">
                        <h2 class="text-center mb-4">Edit Profile</h2>
                        <div class="profile-image">
                            <img src="./Images/Person.png" alt="Profile icon">
                        </div>
                        <form action="/update-profile" method="POST">
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input 
                                    type="email" 
                                    id="email" 
                                    name="email" 
                                    value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>" 
                                    class="form-control" 
                                    required>
                            </div>
                            <div class="mb-3">
                                <label for="contactNumber" class="form-label">Contact Number</label>
                                <input 
                                    type="text" 
                                    id="contactNumber" 
                                    name="contactNumber" 
                                    value="<%= request.getAttribute("contactNumber") != null ? request.getAttribute("contactNumber") : "" %>" 
                                    class="form-control" 
                                    required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input 
                                    type="password" 
                                    id="password" 
                                    name="password" 
                                    value="<%= request.getAttribute("password") != null ? request.getAttribute("password") : "" %>" 
                                    class="form-control" 
                                    required>
                            </div>
                            <div class="d-flex justify-content-between">
                                <button type="button" class="btn btn-danger">Cancel</button>
                                <button type="submit" class="btn btn-success">Save</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
                                    
   <%@ include file="Header_Footer/Footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
