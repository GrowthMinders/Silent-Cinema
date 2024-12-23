<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest, jakarta.servlet.http.HttpServletResponse" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Terms and Conditions Popup</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Agreement.css">
</head>
<body>
    <div class="modal fade" id="termsModal" tabindex="-1" aria-labelledby="termsModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="termsModalLabel">Silent Cinemas Terms and Conditions</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <ul>
                        <li>The website is for personal use only. Do not use it for commercial purposes or in any way that is unlawful or harmful.</li>
                        <li>All payments are subject to the terms and conditions of each bank. We do not retain your payment details.</li>
                        <li>All sales are final. No cancellations, exchanges, or rebookings will be accepted.</li>
                        <li>Scope Cinemas reserves the right not to screen a movie due to unavoidable circumstances. In such cases, refunds will be made to valid ticket holders.</li>
                        <li>No food or beverage from outside is permitted at the cinema premises.</li>
                        <li>It is your responsibility to ensure that you carry the original booking receipt to the theater.</li>
                        <li>The laws of the Republic of Sri Lanka govern these terms and conditions.</li>
                    </ul>
                </div>
                <form name="seatres1" action="./Emailgain.jsp" method="post">
                        <input type="text" id="seldate" name="seldate" value="<%= request.getParameter("seldate") %>" hidden>
                        <input type="text" id="seltime" name="seltime" value="<%= request.getParameter("seltime") %>" hidden>
                        <input type="text" id="selmovie" name="selmovie" value="<%= request.getParameter("selmovie") %>" hidden>
                        <input type="text" id="selseats" name="selseats" value="<%= request.getParameter("selseats") %>" hidden>
                        <input type="text" id="seatprice" name="seatprice" value="<%= request.getParameter("seatprice") %>" hidden>
                        <input type="text" id="seatno" name="seatno" value="<%= request.getParameter("seatno") %>" hidden>
                </form>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal" onclick="window.location.href = './index.jsp';">Disagree</button>
                    <button type="button" class="btn btn-primary" onclick="document.forms['seatres1'].submit();">Agree</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        const termsModal = new bootstrap.Modal(document.getElementById('termsModal'));
        termsModal.show();
    </script>
</body>
</html>
