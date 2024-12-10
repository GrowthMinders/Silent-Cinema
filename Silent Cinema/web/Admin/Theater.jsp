<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Theatre List</title>
  <link rel="stylesheet" href="Theater.css"> 
</head>
<body>
  <div class="container">
    <h1>Theatre List</h1>
    <div class="btn-container">
      <button class="btn btn-add">Add New Theatre</button>
      <button class="btn btn-delete">Delete Selected</button>
    </div>
    <table>
      <thead>
        <tr>
          <th>S.No.</th>
          <th>Theatre Name</th>
          <th>Image</th>
          <th>Delete</th>
          <th>Modify</th>
        </tr>
      </thead>
      <tbody>
        <%
          // Sample theatre data
          String[][] theatres = {
            {"1", "Silent 3D", "silent 3D.jpg", "Movies World"},
            {"2", "Silent Black_Box", "Silent Black_Box.jpg", "PVR"},
            {"3", "Silent Common", "Silent Common.jpg", "Cineplex"}
          };
          
          for (int i = 0; i < theatres.length; i++) {
        %>
        <tr>
          <td><%= theatres[i][0] %></td>
          <td><%= theatres[i][1] %></td>
          <td><img src="<%= theatres[i][2] %>" alt="<%= theatres[i][3] %>"></td>
          <td><button class="delete-btn"><img src="icons8-delete-24.png" alt="Delete"></button></td>
          <td><a href="#" class="edit-link">Edit</a></td>
        </tr>
        <%
          }
        %>
      </tbody>
    </table>
  </div>
</body>
</html>
