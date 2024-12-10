<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Users</title>
    <link rel="stylesheet" href="Users.css">
</head>

<body>
    <div class="container">
        <h2>Users</h2>
        <table>
            <thead>
                <tr>
                    <th>#</th>
                    <th>Name</th>
                    <th>Contact Number</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>NIC Number</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Sample user data (could be fetched from a database)
                    String[][] users = {
                        {"1", "Osandi", "0123456789", "osandi@example.com", "123 Galle, City", "1234567890"},
                        {"2", "Ravindu", "0987654321", "ravindu@example.com", "123 Colombo, City", "0987654321"}
                    };

                    // Loop to display user data
                    for (int i = 0; i < users.length; i++) {
                %>
                <tr>
                    <td><%= users[i][0] %></td>
                    <td><%= users[i][1] %></td>
                    <td><%= users[i][2] %></td>
                    <td><%= users[i][3] %></td>
                    <td><%= users[i][4] %></td>
                    <td><%= users[i][5] %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <div class="button-group">
            <button type="button" class="btn-close" onclick="window.close()">Close</button>
        </div>
    </div>
</body>

</html>
