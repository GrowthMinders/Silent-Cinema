<%@ page import="Functionality.PaymentServlet.emailgrab"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Summary</title>
    <link rel="stylesheet" href="./CSS/Bill.css">
</head>
<body>
    <div class="booking-summary">
        <p  style="color: red;">**Please keep these bill safe with you since are mail server is currently down**</p>
        <center><h2 class="summary-title">BOOKING SUMMARY</h2></center>
        
       
        <div class="ticket-details">
            <p><strong>Movie Date: </strong><%= emailgrab.seldate %></p>
            <p><strong>Movie Time: </strong><%= emailgrab.seltime %></p>
            <p><strong>Movie Name: </strong><%= emailgrab.selmovie %></p>
            <p><strong>Seats Booked: </strong><%= emailgrab.selseats %></p>
        </div>

  
        <div class="pricing">
            <div class="row">
                <span>Sub total</span>
                <span class="price">Rs. <%= emailgrab.seatprice %> /=</span>
            </div>
        </div>

       

        
        <div class="total">
            <p><strong>Total</strong></p>
            <p class="price"><strong>Rs. <%= (emailgrab.seatprice * emailgrab.selseatsno) %>/=</strong></p>
        </div>
    </div>
</body>
</html>
