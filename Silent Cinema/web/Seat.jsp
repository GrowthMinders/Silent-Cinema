<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.time.LocalTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest, jakarta.servlet.http.HttpServletResponse" %>
<%@ page import="Functionality.PaymentServlet.emailgrab" %>

<%
    String url = "jdbc:sqlserver://192.168.121.250\\DATABASESERVER:1433;databaseName=Silent;encrypt=true;trustServerCertificate=true";
    String username = "Supun";
    String password = "Rulz@2002";
    int ticketprice = 0;
    String id = request.getParameter("movieid");

    try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Connection conn = DriverManager.getConnection(url, username, password);
        PreparedStatement sql = conn.prepareStatement("SELECT mprice FROM movie WHERE mid = ?");
        sql.setString(1, id);
        ResultSet result = sql.executeQuery();

        if (result.next()) {
            String tp = result.getString("mprice");
            ticketprice = Integer.parseInt(tp);
        }
        conn.close();
    } catch (Exception ex) {
        out.println("<p class='text-danger text-center'>Error: " + ex.getMessage() + "</p>");
    }
%>
<%@ include file="Header_Footer/Nav.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seat Selection</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- Custom CSS -->
    <link href="./CSS/Seat.css" rel="stylesheet">
    <script src="./JS/Seats/seating.js"></script>
</head>
<body onload="document.querySelectorAll('.seat-selection-seat').forEach(function(element) {
               element.setAttribute('disabled', true);
               }); remender();">

    <script>
        function seatrelease() {
            document.querySelectorAll('.seat-selection-seat').forEach(function(element) {
                element.removeAttribute("disabled");
            });
            remender();
        }

        function remender() {
            var time = document.getElementById("seltime").value;

            if (time === null || time === "") {
                Swal.fire({
                    title: 'Welcome<br>Select a time slot,<br> to enable seat selection.',
                    imageUrl: './Images/Seat/successful.png',
                    imageWidth: 100,
                    imageHeight: 100,
                    imageAlt: 'Seat Selection Alert',
                    confirmButtonText: 'OK'
                });
                return false;
            }
        }

        function pusher(){
            var time = document.getElementById("seltime").value;
            var seats = document.getElementById("selseats").value;

            if (time === null || time === "") {
                Swal.fire({
                    title: 'Select a time slot',
                    imageUrl: './Images/Seat/warning.png',
                    imageWidth: 100,
                    imageHeight: 100,
                    imageAlt: 'Seat Selection Alert',
                    confirmButtonText: 'OK'
                });
                return false;
            }
            if (seats === null || seats === "") {
                Swal.fire({
                    title: 'Select seats',
                    imageUrl: './Images/Seat/warning.png',
                    imageWidth: 100,
                    imageHeight: 100,
                    imageAlt: 'Seat Selection Alert',
                    confirmButtonText: 'OK'
                });
                return false;
            }    
            
            return true;
        }
    </script>

    <div>
        <main class="seat-selection-container container-fluid mt-5">
            <h1 class="seat-selection-title text-center mb-4">SELECT SEATS</h1>

<%
    String moviename = "";
    try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Connection conn = DriverManager.getConnection(url, username, password);
        PreparedStatement sql = conn.prepareStatement("SELECT * FROM movie WHERE mid = ?");
        sql.setString(1, id);
        ResultSet result = sql.executeQuery();
        if (result.next()) { 
            moviename = result.getString("mname");
%>
            <div class="seat-selection-movie-info">
                <p class="seat-selection-movie-title h4"><%= moviename %></p>
                <p><i class="fas fa-map-marker-alt"></i> <%= result.getString("mtheater") %> - Homagama</p>
                <p><%= java.time.LocalDate.now().format(java.time.format.DateTimeFormatter.ofPattern("dd-MM-yyyy")) %></p>
                <hr class="seat-selection-movie-details-line">
            </div>
<%
        }
        conn.close();
    } catch (Exception ex) { 
        out.println("<p class='text-danger text-center'>Error: " + ex.getMessage() + "</p>");
    }
%>

            <!-- Showtime Buttons -->
            <div class="seat-selection-showtimes mb-4">
                <span class="seat-selection-showtime-label">ShowTime:</span>
                <%
                    try {
                        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                        Connection conn = DriverManager.getConnection(url, username, password);
                        PreparedStatement sql = conn.prepareStatement("SELECT stime, sdate, edate FROM timming WHERE movie = ?");
                        sql.setString(1, moviename);
                        ResultSet result = sql.executeQuery();
                        DateTimeFormatter TimeConvert = DateTimeFormatter.ofPattern("h:mm a");
                        LocalTime NowTime = LocalTime.now();
                        while (result.next()) { 
                        LocalTime DbTime = LocalTime.parse(result.getString("stime"), TimeConvert);
                          if(NowTime.isBefore(DbTime)){ %>
                            <button class="seat-selection-time-button"  onclick=" 
                                var timer = this.innerText;
                                document.getElementById('seltime').value = timer;
                                seatreserved();
                                seatrelease();
                            "> 
                                <%= result.getString("stime") %> 
                            </button>
                        <% }}
                        conn.close();
                    } catch (Exception e) {
                        out.println("<p class='text-danger text-center'>Error: " + e.getMessage() + "</p>");
                    }
                %>
                <hr class="seat-selection-showtime-line">
            </div>

            <!-- Seat Layout -->
            
            <center> <div class="seat-selection-layout">
                <div class="seat-selection-section">
                    <div style="justify-items: left; gap: 30px; margin-right: 85px;">
                        <div class="seat-selection-row">
                            <button class="seat-selection-seat" id="A1" onclick="seatsreserve('A1'); counter(); this.style.backgroundColor ='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">A1</button>
                            <button class="seat-selection-seat" id="A2" onclick="seatsreserve('A2'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">A2</button>
                            <button class="seat-selection-seat" id="A3" onclick="seatsreserve('A3'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">A3</button>
                            <button class="seat-selection-seat" id="A4" onclick="seatsreserve('A4'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">A4</button>
                            <button class="seat-selection-seat" id="A5" onclick="seatsreserve('A5'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">A5</button>
                        </div>
                        <div class="seat-selection-row">
                            <button class="seat-selection-seat" id="B1" onclick="seatsreserve('B1'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">B1</button>
                            <button class="seat-selection-seat" id="B2" onclick="seatsreserve('B2'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">B2</button>
                            <button class="seat-selection-seat" id="B3" onclick="seatsreserve('B3'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">B3</button>
                            <button class="seat-selection-seat" id="B4" onclick="seatsreserve('B4'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">B4</button>
                            <button class="seat-selection-seat" id="B5" onclick="seatsreserve('B5'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">B5</button>
                        </div>
                        <div class="seat-selection-row">
                            <button class="seat-selection-seat" id="C1" onclick="seatsreserve('C1'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">C1</button>
                            <button class="seat-selection-seat" id="C2" onclick="seatsreserve('C2'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">C2</button>
                            <button class="seat-selection-seat" id="C3" onclick="seatsreserve('C3'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">C3</button>
                            <button class="seat-selection-seat" id="C4" onclick="seatsreserve('C4'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">C4</button>
                            <button class="seat-selection-seat" id="C5" onclick="seatsreserve('C5'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">C5</button>
                        </div>
                        <div class="seat-selection-row">
                            <button class="seat-selection-seat" id="D1" onclick="seatsreserve('D1'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">D1</button>
                            <button class="seat-selection-seat" id="D2" onclick="seatsreserve('D2'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">D2</button>
                            <button class="seat-selection-seat" id="D3" onclick="seatsreserve('D3'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">D3</button>
                            <button class="seat-selection-seat" id="D4" onclick="seatsreserve('D4'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">D4</button>
                            <button class="seat-selection-seat" id="D5" onclick="seatsreserve('D5'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">D5</button>
                        </div>
                        <div class="seat-selection-row">
                            <button class="seat-selection-seat" id="E1" onclick="seatsreserve('E1'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">E1</button>
                            <button class="seat-selection-seat" id="E2" onclick="seatsreserve('E2'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">E2</button>
                            <button class="seat-selection-seat" id="E3" onclick="seatsreserve('E3'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">E3</button>
                            <button class="seat-selection-seat" id="E4" onclick="seatsreserve('E4'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">E4</button>
                            <button class="seat-selection-seat" id="E5" onclick="seatsreserve('E5'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">E5</button>
                        </div>
                        <div class="seat-selection-row">
                            <button class="seat-selection-seat" id="F1" onclick="seatsreserve('F1'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">F1</button>
                            <button class="seat-selection-seat" id="F2" onclick="seatsreserve('F2'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">F2</button>
                            <button class="seat-selection-seat" id="F3" onclick="seatsreserve('F3'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">F3</button>
                            <button class="seat-selection-seat" id="F4" onclick="seatsreserve('F4'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">F4</button>
                            <button class="seat-selection-seat" id="F5" onclick="seatsreserve('F5'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">F5</button>
                        </div>
                    </div>
                    <!-- Center Section -->
                    <div style="justify-items: center; margin-right: 85px;">
                        <div class="seat-selection-row">
                            <button class="seat-selection-seat" id="A6" onclick="seatsreserve('A6'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">A6</button>
                            <button class="seat-selection-seat" id="A7" onclick="seatsreserve('A7'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">A7</button>
                            <button class="seat-selection-seat" id="A8" onclick="seatsreserve('A8'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">A8</button>
                            <button class="seat-selection-seat" id="A9" onclick="seatsreserve('A9'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">A9</button>
                            <button class="seat-selection-seat" id="A10" onclick="seatsreserve('A10'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">A10</button>
                            <button class="seat-selection-seat" id="A11" onclick="seatsreserve('A11'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">A11</button>
                            <button class="seat-selection-seat" id="A12" onclick="seatsreserve('A12'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">A12</button>
                            <button class="seat-selection-seat" id="A13" onclick="seatsreserve('A13'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">A13</button>
                            <button class="seat-selection-seat" id="A14" onclick="seatsreserve('A14'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">A14</button>
                            <button class="seat-selection-seat" id="A15" onclick="seatsreserve('A15'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">A15</button>
                        </div>
                        <div class="seat-selection-row">
                            <button class="seat-selection-seat" id="B6" onclick="seatsreserve('B6'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">B6</button>
                            <button class="seat-selection-seat" id="B7" onclick="seatsreserve('B7'); counter(); this.style.backgroundColor='#0000ff'; this.style.color=' black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">B7</button>
                            <button class="seat-selection-seat" id="B8" onclick="seatsreserve('B8'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">B8</button>
                            <button class="seat-selection-seat" id="B9" onclick="seatsreserve('B9'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">B9</button>
                            <button class="seat-selection-seat" id="B10" onclick="seatsreserve('B10'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">B10</button>
                            <button class="seat-selection-seat" id="B11" onclick="seatsreserve('B11'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">B11</button>
                            <button class="seat-selection-seat" id="B12" onclick="seatsreserve('B12'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">B12</button>
                            <button class="seat-selection-seat" id="B13" onclick="seatsreserve('B13'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">B13</button>
                            <button class="seat-selection-seat" id="B14" onclick="seatsreserve('B14'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">B14</button>
                            <button class="seat-selection-seat" id="B15" onclick="seatsreserve('B15'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">B15</button>
                        </div>
                        <div class="seat-selection-row">
                            <button class="seat-selection-seat" id="C6" onclick="seatsreserve('C6'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">C6</button>
                            <button class="seat-selection-seat" id="C7" onclick="seatsreserve('C7'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">C7</button>
                            <button class="seat-selection-seat" id="C8" onclick="seatsreserve('C8'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">C8</button>
                            <button class="seat-selection-seat" id="C9" onclick="seatsreserve('C9'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">C9</button>
                            <button class="seat-selection-seat" id="C10" onclick="seatsreserve('C10'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">C10</button>
                            <button class="seat-selection-seat" id="C11" onclick="seatsreserve('C11'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight=' bold'; this.setAttribute('disabled', true);">C11</button>
                            <button class="seat-selection-seat" id="C12" onclick="seatsreserve('C12'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">C12</button>
                            <button class="seat-selection-seat" id="C13" onclick="seatsreserve('C13'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">C13</button>
                            <button class="seat-selection-seat" id="C14" onclick="seatsreserve('C14'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">C14</button>
                            <button class="seat-selection-seat" id="C15" onclick="seatsreserve('C15'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">C15</button>
                        </div>
                        <div class="seat-selection-row">
                            <button class="seat-selection-seat" id="D6" onclick="seatsreserve('D6'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">D6</button>
                            <button class="seat-selection-seat" id="D7" onclick="seatsreserve('D7'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">D7</button>
                            <button class="seat-selection-seat" id="D8" onclick="seatsreserve('D8'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">D8</button>
                            <button class="seat-selection-seat" id="D9" onclick="seatsreserve('D9'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">D9</button>
                            <button class="seat-selection-seat" id="D10" onclick="seatsreserve('D10'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">D10</button>
                            <button class="seat-selection-seat" id="D11" onclick="seatsreserve('D11'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">D11</button>
                            <button class="seat-selection-seat" id="D12" onclick="seatsreserve('D12'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">D12</button>
                            <button class="seat-selection-seat" id="D13" onclick="seatsreserve('D13'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">D13</button>
                            <button class="seat-selection-seat" id="D14" onclick="seatsreserve('D14'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">D14</button>
                            <button class="seat-selection-seat" id="D15" onclick="seatsreserve('D15'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled ', true);">D15</button>
                        </div>
                        <div class="seat-selection-row">
                            <button class="seat-selection-seat" id="E6" onclick="seatsreserve('E6'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">E6</button>
                            <button class="seat-selection-seat" id="E7" onclick="seatsreserve('E7'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">E7</button>
                            <button class="seat-selection-seat" id="E8" onclick="seatsreserve('E8'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">E8</button>
                            <button class="seat-selection-seat" id="E9" onclick="seatsreserve('E9'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">E9</button>
                            <button class="seat-selection-seat" id="E10" onclick="seatsreserve('E10'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">E10</button>
                            <button class="seat-selection-seat" id="E11" onclick="seatsreserve('E11'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">E11</button>
                            <button class="seat-selection-seat" id="E12" onclick="seatsreserve('E12'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">E12</button>
                            <button class="seat-selection-seat" id="E13" onclick="seatsreserve('E13'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">E13</button>
                            <button class="seat-selection-seat" id="E14" onclick="seatsreserve('E14'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">E14</button>
                            <button class="seat-selection-seat" id="E15" onclick="seatsreserve('E15'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">E15</button>
                        </div>
                        <div class="seat-selection-row">
                            <button class="seat-selection-seat" id="F6" onclick="seatsreserve('F6'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">F6</button>
                            <button class="seat-selection-seat" id="F7" onclick="seatsreserve('F7'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">F7</button>
                            <button class="seat-selection-seat" id="F8" onclick="seatsreserve('F8'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">F8</button>
                            <button class="seat-selection-seat" id="F9" onclick="seatsreserve('F9'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">F9</button>
                            <button class="seat-selection-seat" id="F10" onclick="seatsreserve('F10'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">F10</button>
                            <button class="seat-selection-seat" id="F11" onclick="seatsreserve('F11'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">F11</button>
                            <button class="seat-selection-seat" id="F12" onclick="seatsreserve('F12'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">F12</button>
                            <button class="seat-selection-seat" id="F13" onclick="seatsreserve('F13'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">F13</button>
                            <button class="seat-selection-seat" id="F14" onclick="seatsreserve('F14'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">F14</button>
                            <button class="seat-selection-seat" id="F15" onclick="seatsreserve('F15'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">F15</button>
                        </div>
                    </div>

                    <!-- Right Section -->
                    <div style="justify-items: right;">
                        <div class="seat-selection-row">
                            <button class="seat-selection-seat" id="A16" onclick="seatsreserve('A16'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">A16</button>
                            <button class="seat-selection-seat" id="A17" onclick="seatsreserve('A17'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">A17</button>
                            <button class="seat-selection-seat" id="A18" onclick="seatsreserve('A18'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">A18</button>
                            <button class="seat-selection-seat" id="A19" onclick="seatsreserve('A19'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">A19</button>
                            <button class="seat-selection-seat" id="A20" onclick="seatsreserve('A20'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true );">A20</button>
                            <button class="seat-selection-seat" id="A21" onclick="seatsreserve('A21'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">A21</button>
                        </div>
                        <div class="seat-selection-row">
                            <button class="seat-selection-seat" id="B16" onclick="seatsreserve('B16'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">B16</button>
                            <button class="seat-selection-seat" id="B17" onclick="seatsreserve('B17'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">B17</button>
                            <button class="seat-selection-seat" id="B18" onclick="seatsreserve('B18'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">B18</button>
                            <button class="seat-selection-seat" id="B19" onclick="seatsreserve('B19'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">B19</button>
                            <button class="seat-selection-seat" id="B20" onclick="seatsreserve('B20'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">B20</button>
                            <button class="seat-selection-seat" id="B21" onclick="seatsreserve('B21'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">B21</button>
                        </div>
                        <div class="seat-selection-row">
                            <button class="seat-selection-seat" id="C16" onclick="seatsreserve('C16'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">C16</button>
                            <button class="seat-selection-seat" id="C17" onclick="seatsreserve('C17'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">C17</button>
                            <button class="seat-selection-seat" id="C18" onclick="seatsreserve('C18'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">C18</button>
                            <button class="seat-selection-seat" id="C19" onclick="seatsreserve('C19'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">C19</button>
                            <button class="seat-selection-seat" id="C20" onclick="seatsreserve('C20'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">C20</button>
                            <button class="seat-selection-seat" id="C21" onclick="seatsreserve('C21'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">C21</button>
                        </div>
                        <div class="seat-selection-row">
                            <button class="seat-selection-seat" id="D16" onclick="seatsreserve('D16'); counter(); this.style.backgroundColor='#0000ff'; this .style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">D16</button>
                            <button class="seat-selection-seat" id="D17" onclick="seatsreserve('D17'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">D17</button>
                            <button class="seat-selection-seat" id="D18" onclick="seatsreserve('D18'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">D18</button>
                            <button class="seat-selection-seat" id="D19" onclick="seatsreserve('D19'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">D19</button>
                            <button class="seat-selection-seat" id="D20" onclick="seatsreserve('D20'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">D20</button>
                            <button class="seat-selection-seat" id="D21" onclick="seatsreserve('D21'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">D21</button>
                        </div>
                        <div class="seat-selection-row">
                            <button class="seat-selection-seat" id="E16" onclick="seatsreserve('E16'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">E16</button>
                            <button class="seat-selection-seat" id="E17" onclick="seatsreserve('E17'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">E17</button>
                            <button class="seat-selection-seat" id="E18" onclick="seatsreserve('E18'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">E18</button>
                            <button class="seat-selection-seat" id="E19" onclick="seatsreserve('E19'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">E19</button>
                            <button class="seat-selection-seat" id="E20" onclick="seatsreserve('E20'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">E20</button>
                            <button class="seat-selection-seat" id="E21" onclick="seatsreserve('E21'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">E21</button>
                        </div>
                        <div class="seat-selection-row">
                            <button class="seat-selection-seat" id="F16" onclick="seatsreserve('F16'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">F16</button>
                            <button class="seat-selection-seat" id="F17" onclick="seatsreserve('F17'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">F17</button>
                            <button class="seat-selection-seat" id="F18" onclick="seatsreserve('F18'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">F18</button>
                            <button class="seat-selection-seat" id="F19" onclick="seatsreserve('F19'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">F19</button>
                            <button class="seat-selection-seat" id="F20" onclick="seatsreserve('F20'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">F20</button>
                            <button class="seat-selection-seat" id="F21" onclick="seatsreserve('F21'); counter(); this.style.backgroundColor='#0000ff'; this.style.color='black'; this.style.fontWeight='bold'; this.setAttribute('disabled', true);">F21</button>
                        </div>
                    </div>
                </div></center>

                <!-- Screen Section -->
                <div class="seat-selection-screen pt-2">
                    <img src="./Images/Seat/moviescreen.png" alt="Movie screen" class="img-fluid">
                </div>

                <!-- Seat Status Legend -->
                <div class="seat-selection-status-legend" style="gap: 80px;">
                    <span class="seat-selection-status"><span class="seat-selection-color-box gray"></span> Available</span>
                    <span class="seat-selection-status"><span class="seat-selection-color-box light-blue"></span> Reserved</span>
                </div>
                <hr class="seat-selection-divider">
                <p class="seat-selection-ticket-message" id="counting">0 ticket(s) selected. Please select attendees.</p>
                <hr class="seat-selection-divider">

                <div class="navigation-buttons">
                    <form name="seatres" action="./Agreement.jsp" method="get" onsubmit="return pusher();">
                        <input type="text" id="seldate" name="seldate" value="<%= java.time.LocalDate.now().format(java.time.format.DateTimeFormatter.ofPattern("dd-MM-yyyy")) %>" hidden>
                        <input type="text" id="seltime" name="seltime" hidden>
                        <input type="text" id="selmovie" name="selmovie" value = "<%= moviename %>" hidden>
                        <input type="text" id="selseats" name="selseats" hidden>
                        <input type="text" id="seatprice" name="seatprice" value = "<%= ticketprice%>" hidden>
                        <input type="text" id="seatno" name="seatno" hidden>
                        <button type = "submit" class="nav-button-back">CONTINUE</button>
                    </form>
                     
                     
<script>
    function seatreserved() {
        <% 
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn = DriverManager.getConnection(url, username, password);
            PreparedStatement sql = conn.prepareStatement("SELECT * FROM booking WHERE movie = ?");
            sql.setString(1, moviename);
            ResultSet result = sql.executeQuery();
        %>

        // Get selected time and date from the HTML elements
        var time = document.getElementById("seltime").value;
        var date = document.getElementById("seldate").value;

        <% while (result.next()) { 
            String seat = result.getString("seat");
            String bookedTime = result.getString("time");
            String bookedDate = result.getString("date");
        %>
        // Check if the selected time and date match the data from the database
        if (time === "<%= bookedTime %>" && date === "<%= bookedDate %>") {
           <% String seating[] = seat.split(",");
            for(int i = 0; i<seating.length;i++){ %>
                document.getElementById("<%= seating[i] %>").style.backgroundColor = "#7DBFDF";
                document.getElementById("<%= seating[i] %>").style.color = "white";
                document.getElementById("<%= seating[i] %>").style.fontWeight = "bold";
                document.getElementById("<%= seating[i] %>").style.pointerEvents = "none";
           <% } %> 
        }
        <% }
        conn.close();
        } catch (Exception x) { 
        %>
        document.write("<p class='text-danger text-center'>Error: <%= x.getMessage() %></p>");
        <% } %>
    }
</script>
                </div>
            </main>
        </div>

        <%@ include file="Header_Footer/Footer.jsp" %>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>