<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Movie Theater</title>
  
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light d-flex justify-content-center align-items-center vh-100">

  <div class="container bg-white shadow-sm p-5 rounded" style="max-width: 500px;">
    <h2 class="text-center mb-4">Add Movie Theater</h2>
    <form action="submit_theater.jsp" method="POST" enctype="multipart/form-data">
      
      <div class="mb-3">
        <label for="theater-name" class="form-label">Theater Name:</label>
        <input type="text" id="theater-name" name="theater_name" class="form-control" placeholder="Enter theater name" required>
      </div>

      <div class="mb-3">
        <label for="theater-image" class="form-label">Theater Image:</label>
        <input type="file" id="theater-image" name="theater_image" class="form-control" accept="image/*" required>
      </div>

      <div class="text-end">
        <button type="submit" class="btn btn-primary">Add Theater</button>
        <a href="home.jsp" class="btn btn-secondary">Cancel</a>
      </div>
    </form>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
