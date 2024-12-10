<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Theatre</title>
 
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light d-flex justify-content-center align-items-center vh-100">
  <div class="container">
    <div class="card shadow mx-auto" style="max-width: 600px;">
      <div class="card-body">
        <h2 class="text-center mb-4">Edit Theatre</h2>
        <form action="update_theatre.jsp" method="POST" enctype="multipart/form-data">
          
          <div class="mb-3">
            <label for="old-theater-name" class="form-label">Old Theatre Name:</label>
            <input type="text" id="old-theater-name" class="form-control" value="Silent 3D" readonly>
          </div>

          
          <div class="mb-3">
            <label for="new-theater-name" class="form-label">Theatre Name:</label>
            <input type="text" id="new-theater-name" name="theater_name" class="form-control" value="Silent 3D" required>
          </div>

         
          <div class="mb-3">
            <label class="form-label">Current Theatre Image:</label>
            <div class="text-center">
              <img src="Silent 3D.jpg" alt="Current Theatre" class="img-fluid rounded border" id="preview-image">
            </div>
          </div>

          
          <div class="mb-3">
            <label for="theater-image" class="form-label">Theatre Image:</label>
            <input type="file" id="theater-image" name="theater_image" class="form-control" accept="image/*">
          </div>

         
          <div class="d-grid">
            <button type="submit" class="btn btn-primary">Edit Theatre</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
