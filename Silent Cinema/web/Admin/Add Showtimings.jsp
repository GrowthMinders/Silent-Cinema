<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <form action="submit_showtime.jsp" method="POST">
            
            <div class="mb-3">
                <label for="theater" class="form-label">Select Theater:</label>
                <select id="theater" name="theater" class="form-select" required>
                    <option value="" disabled selected>Select Theater</option>
                    <option value="Silent 3D">Silent 3D</option>
                    <option value="Silent Black_Box">Silent Black_Box</option>
                    <option value="Silent Common">Silent Common</option>
                </select>
            </div>

            <div class="mb-3">
                <label for="movie" class="form-label">Select Movie:</label>
                <select id="movie" name="movie" class="form-select" required>
                    <option value="" disabled selected>Select Movie</option>
                    <option value="Avatar">Avatar</option>
                    <option value="Kill">Kill</option>
                    <option value="Fighter">Fighter</option>
                </select>
            </div>

            <div class="mb-3">
                <label for="start-date" class="form-label">Start Date:</label>
                <input type="date" id="start-date" name="start_date" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="end-date" class="form-label">End Date:</label>
                <input type="date" id="end-date" name="end_date" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="start-time" class="form-label">Start Time:</label>
                <input type="time" id="start-time" name="start_time" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="end-time" class="form-label">End Time:</label>
                <input type="time" id="end-time" name="end_time" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="ticket-price" class="form-label">Set Price ($):</label>
                <input type="number" id="ticket-price" name="ticket_price" class="form-control" min="1" required>
            </div>

            <div class="d-flex justify-content-between">
                <button type="submit" class="btn btn-primary">Add Showtime</button>
                <button type="button" class="btn btn-secondary" onclick="window.location.href='ShowTimings.jsp'">Close</button>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
