<%-- 
    Document   : Event
    Created on : Dec 7, 2024, 11:05:35?AM
    Author     : Nethmini
--%>
<%@ include file="Header_Footer/Nav.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Events-Silent Cinemas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./CSS/Event.css">
</head>
<body>
   
    <main class="events">
         <div class="container">
        <h1 style=" text-align: left; font-size: 1.5em; margin-bottom: 30px; color: black; font-weight: bold;">EVENTS</h1>
        <section class="event section">
            <!-- Card 1 -->
            <div class="event-card ">
                <h3>WHAT ARE SILENT EVENTS?</h3>
                <div class="card-content">
                    <p>
                        This is the ultimate luxury cinema experience. Elegance of a fully licensed lounge bar with a menu
                        with a selection of delicious food and in-cinema service with a state-of-the-art blockbuster movie
                        experience that has to be seen to be believed.
                    </p>
                    <img src="./Images/Events/Event-1.jfif" alt="Silent Event" class="image1">
                </div>
            </div>
        </section>
        </div>

        <div class="container">
        <section>
            <!-- Card 2 -->
            <div class="event-card">
                <h3 class="heading2">CORPORATE GROUP DEALS AND PRIVATE BOOKINGS AT SCOPE.</h3> 
            
                <div class="card-content">
                    <img src="./Images/Events/Event-2.jpg"  alt="Corporate Event" class="image2">
                    <p>
                        Looking for the perfect venue in the heart of the city for a corporate function or a private gathering?
                        Everyone loves movies, and not every day you get treated with the ultimate cinema experience. A cinema
                        experience of the next level to your guests, staff, or directors from overseas, clients, or VIP Clients 
                        or any one you wish to treat to the ultimate cinema experience.
                    </p>

                </div>
            </div>
        </section>
        </div>

        <div class="container">
        <section class="contact-section">
            <p class="contact-text">Want to get in touch with us.</p>
            <a href="./ContactUS.jsp" class="contact-button">CONTACT US</a>   
        </section>
        </div>
    </main>
    <%@ include file="Header_Footer/Footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>