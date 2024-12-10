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
    <!-- Custom CSS -->
    <link href="./CSS/Seat.css" rel="stylesheet">
</head>
<body>
    <div>
    <main class="seat-selection-container container-fluid mt-5">
        <h1 class="seat-selection-title text-center mb-4">SELECT SEATS</h1>

        <!-- Movie Details -->
        <div class="seat-selection-movie-info">
            <p class="seat-selection-movie-title h4">VENOM: Avatar The Last Airbender</p>
            <p><i class="fas fa-map-marker-alt"></i> Silent Cinema - Homagama</p>
            <p>Wed, 13 Nov</p>
            <p>Digital 3D</p>
            <hr class="seat-selection-movie-details-line">
        </div>

        <!-- Showtime Buttons -->
        <div class="seat-selection-showtimes mb-4">
            <span class="seat-selection-showtime-label">ShowTime:</span>
            <button class="seat-selection-time-button">10:00 AM</button>
            <button class="seat-selection-time-button">3:00 PM</button>
            <hr class="seat-selection-showtime-line">
        </div>
        
       
        <div class="seat-selection-layout">
            <div class="seat-selection-section">
                <div style="justify-items: left; gap: 30px; margin-right: 85px;">
                    <div class="seat-selection-row">
                        <button class="seat-selection-seat">A1</button>
                        <button class="seat-selection-seat">A2</button>
                        <button class="seat-selection-seat">A3</button>
                        <button class="seat-selection-seat">A4</button>
                        <button class="seat-selection-seat">A5</button>
                    </div>
                    <div class="seat-selection-row">
                        <button class="seat-selection-seat">B1</button>
                        <button class="seat-selection-seat">B2</button>
                        <button class="seat-selection-seat">B3</button>
                        <button class="seat-selection-seat">B4</button>
                        <button class="seat-selection-seat">B5</button>
                    </div>
                    <div class="seat-selection-row">
                        <button class="seat-selection-seat">C1</button>
                        <button class="seat-selection-seat">C2</button>
                        <button class="seat-selection-seat">C3</button>
                        <button class="seat-selection-seat">C4</button>
                        <button class="seat-selection-seat">C5</button>
                    </div>
                    <div class="seat-selection-row">
                        <button class="seat-selection-seat">D1</button>
                        <button class="seat-selection-seat">D2</button>
                        <button class="seat-selection-seat">D3</button>
                        <button class="seat-selection-seat">D4</button>
                        <button class="seat-selection-seat">D5</button>
                    </div>
                    <div class="seat-selection-row">
                        <button class="seat-selection-seat">E1</button>
                        <button class="seat-selection-seat">E2</button>
                        <button class="seat-selection-seat">E3</button>
                        <button class="seat-selection-seat">E4</button>
                        <button class="seat-selection-seat">E5</button>
                    </div>
                    <div class="seat-selection-row">
                        <button class="seat-selection-seat">F1</button>
                        <button class="seat-selection-seat">F2</button>
                        <button class="seat-selection-seat">F3</button>
                        <button class="seat-selection-seat">F4</button>
                        <button class="seat-selection-seat">F5</button>
                    </div>   
                  </div>   
                <!-- Center Section -->
                <div style="justify-items: center; margin-right: 85px;">
                    <div class="seat-selection-row">
                        <button class="seat-selection-seat">A6</button>
                        <button class="seat-selection-seat">A7</button>
                        <button class="seat-selection-seat">A8</button>
                        <button class="seat-selection-seat">A9</button>
                        <button class="seat-selection-seat">A10</button>
                        <button class="seat-selection-seat">A11</button>
                        <button class="seat-selection-seat">A12</button>
                        <button class="seat-selection-seat">A13</button>
                        <button class="seat-selection-seat">A14</button>
                        <button class="seat-selection-seat">A15</button>
                    </div>
                    <div class="seat-selection-row">
                        <button class="seat-selection-seat">B6</button>
                        <button class="seat-selection-seat">B7</button>
                        <button class="seat-selection-seat">B8</button>
                        <button class="seat-selection-seat">B9</button>
                        <button class="seat-selection-seat">B10</button>
                        <button class="seat-selection-seat">B11</button>
                        <button class="seat-selection-seat">B12</button>
                        <button class="seat-selection-seat">B13</button>
                        <button class="seat-selection-seat">B14</button>
                        <button class="seat-selection-seat">B15</button>
                    </div>
                    <div class="seat-selection-row">
                        <button class="seat-selection-seat">C6</button>
                        <button class="seat-selection-seat">C7</button>
                        <button class="seat-selection-seat">C8</button>
                        <button class="seat-selection-seat">C9</button>
                        <button class="seat-selection-seat">C10</button>
                        <button class="seat-selection-seat">C11</button>
                        <button class="seat-selection-seat">C12</button>
                        <button class="seat-selection-seat">C13</button>
                        <button class="seat-selection-seat">C14</button>
                        <button class="seat-selection-seat">C15</button>
                    </div>
                    <div class="seat-selection-row">
                        <button class="seat-selection-seat">D6</button>
                        <button class="seat-selection-seat">D7</button>
                        <button class="seat-selection-seat">D8</button>
                        <button class="seat-selection-seat">D9</button>
                        <button class="seat-selection-seat">D10</button>
                        <button class="seat-selection-seat">D11</button>
                        <button class="seat-selection-seat">D12</button>
                        <button class="seat-selection-seat">D13</button>
                        <button class="seat-selection-seat">D14</button>
                        <button class="seat-selection-seat">D15</button>
                    </div>
                    <div class="seat-selection-row">
                        <button class="seat-selection-seat">E6</button>
                        <button class="seat-selection-seat">E7</button>
                        <button class="seat-selection-seat">E8</button>
                        <button class="seat-selection-seat">E9</button>
                        <button class="seat-selection-seat">E10</button>
                        <button class="seat-selection-seat">E11</button>
                        <button class="seat-selection-seat">E12</button>
                        <button class="seat-selection-seat">E13</button>
                        <button class="seat-selection-seat">E14</button>
                        <button class="seat-selection-seat">E15</button>
                    </div>
                    <div class="seat-selection-row">
                        <button class="seat-selection-seat">F6</button>
                        <button class="seat-selection-seat">F7</button>
                        <button class="seat-selection-seat">F8</button>
                        <button class="seat-selection-seat">F9</button>
                        <button class="seat-selection-seat">F10</button>
                        <button class="seat-selection-seat">F11</button>
                        <button class="seat-selection-seat">F12</button>
                        <button class="seat-selection-seat">F13</button>
                        <button class="seat-selection-seat">F14</button>
                        <button class="seat-selection-seat">F15</button>
                    </div>
                  </div>
                

                <!-- Right Section -->
                <div style="justify-items: right;">
                     <div class="seat-selection-row">
                        <button class="seat-selection-seat">A16</button>
                        <button class="seat-selection-seat">A17</button>
                        <button class="seat-selection-seat">A18</button>
                        <button class="seat-selection-seat">A19</button>
                        <button class="seat-selection-seat">A20</button>
                        <button class="seat-selection-seat">A21</button>
                    </div>
                    <div class="seat-selection-row">
                        <button class="seat-selection-seat">B16</button>
                        <button class="seat-selection-seat">B17</button>
                        <button class="seat-selection-seat">B18</button>
                        <button class="seat-selection-seat">B19</button>
                        <button class="seat-selection-seat">B20</button>
                        <button class="seat-selection-seat">B21</button>
                    </div>
                    <div class="seat-selection-row">
                        <button class="seat-selection-seat">C16</button>
                        <button class="seat-selection-seat">C17</button>
                        <button class="seat-selection-seat">C18</button>
                        <button class="seat-selection-seat">C19</button>
                        <button class="seat-selection-seat">C20</button>
                        <button class="seat-selection-seat">C21</button>
                    </div>
                    <div class="seat-selection-row">
                        <button class="seat-selection-seat">D16</button>
                        <button class="seat-selection-seat">D17</button>
                        <button class="seat-selection-seat">D18</button>
                        <button class="seat-selection-seat">D19</button>
                        <button class="seat-selection-seat">D20</button>
                        <button class="seat-selection-seat">D21</button>
                    </div>
                    <div class="seat-selection-row">
                        <button class="seat-selection-seat">E16</button>
                        <button class="seat-selection-seat">E17</button>
                        <button class="seat-selection-seat">E18</button>
                        <button class="seat-selection-seat">E19</button>
                        <button class="seat-selection-seat">E20</button>
                        <button class="seat-selection-seat">E21</button>
                    </div>
                    <div class="seat-selection-row">
                        <button class="seat-selection-seat">F16</button>
                        <button class="seat-selection-seat">F17</button>
                        <button class="seat-selection-seat">F18</button>
                        <button class="seat-selection-seat">F19</button>
                        <button class="seat-selection-seat">F20</button>
                        <button class="seat-selection-seat">F21</button>
                    </div>
                 </div>
              </div>
            </div>  
         
        
        <!-- Screen Section -->
        <div class="seat-selection-screen pt-2">
            <img src="./Images/Seat/moviescreen.png" alt="Movie screen" class="img-fluid">
        </div>

        <!-- Seat Status Legend -->
        <div class="seat-selection-status-legend">
            <span class="seat-selection-status"><span class="seat-selection-color-box blue"></span> Selected</span>
            <span class="seat-selection-status"><span class="seat-selection-color-box gray"></span> Available</span>
            <span class="seat-selection-status"><span class="seat-selection-color-box light-blue"></span> Reserved</span>
        </div>
        <hr class="seat-selection-divider">
        <p class="seat-selection-ticket-message">0 ticket(s) selected. Please select attendees.</p>
        <hr class="seat-selection-divider">

        <div class="navigation-buttons">
            <button class="nav-button-back">BACK</button>
            <button class="nav-button-continue">CONTINUE</button>
        </div>    
    </main>
</div> 
  
<%@ include file="Header_Footer/Footer.jsp" %>  

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
