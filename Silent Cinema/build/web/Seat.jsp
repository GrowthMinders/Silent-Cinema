<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Seat Selection</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
  <link href="css/seat-selection.css" rel="stylesheet">
</head>
<body>

  <!-- Navigation Bar -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
      <img src="images/logo.png" alt="Cinema Logo" class="navbar-logo">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link" href="#">HOME</a></li>
        <li class="nav-item"><a class="nav-link" href="#">MOVIES</a></li>
        <li class="nav-item"><a class="nav-link" href="#">DEALS AND EXCLUSIVES</a></li>
        <li class="nav-item"><a class="nav-link" href="#">BUY TICKETS</a></li>
        <li class="nav-item"><a class="nav-link" href="#">LOGIN</a></li>
      </ul>
    </div>
  </nav>

  <!-- Seat Selection Section -->
  <main class="seat-selection">
    <h1 class="title">SELECT SEATS</h1>

    <!-- Movie Details -->
    <div class="movie-info">
        <p class="movie-title">VENOM: Avatar The Last Airbender</p>
        <div class="movie-details">
            <p class="movie-location"><i class="fas fa-map-marker-alt"></i> Silent Cinema - Homagama</p>
            <p class="movie-date">Wed, 13 Nov</p>
            <p class="movie-format">Digital 3D</p>
        </div>
        <hr class="movie-details-line">
    </div>

    <!-- Showtime Buttons -->
    <div class="showtimes d-flex justify-content-start">
        <span class="showtime-label">ShowTime</span>
        <button class="time-button">10.00 AM</button>
        <button class="time-button">3.00 PM</button>
    </div>
    <hr class="showtime-line">

    <div class="seat-layout">
        <!-- Left Section -->
        <div class="seat-section">
          <div class="row">
            <button class="seat">A1</button>
            <button class="seat">A2</button>
            <button class="seat">A3</button>
            <button class="seat">A4</button>
            <button class="seat">A5</button>
          </div>
          <div class="row">
            <button class="seat">B1</button>
            <button class="seat">B2</button>
            <button class="seat">B3</button>
            <button class="seat">B4</button>
            <button class="seat">B5</button>
          </div>
          <div class="row">
            <button class="seat">C1</button>
            <button class="seat">C2</button>
            <button class="seat">C3</button>
            <button class="seat">C4</button>
            <button class="seat">C5</button>
          </div>
          <div class="row">
            <button class="seat">D1</button>
            <button class="seat">D2</button>
            <button class="seat">D3</button>
            <button class="seat">D4</button>
            <button class="seat">D5</button>
          </div>
          <div class="row">
            <button class="seat">E1</button>
            <button class="seat">E2</button>
            <button class="seat">E3</button>
            <button class="seat">E4</button>
            <button class="seat">E5</button>
          </div>
          <div class="row">
            <button class="seat">F1</button>
            <button class="seat">F2</button>
            <button class="seat">F3</button>
            <button class="seat">F4</button>
            <button class="seat">F5</button>
          </div>
        </div>
      
        <!-- Center Section -->
        <div class="seat-section">
          <div class="row">
            <button class="seat">A6</button>
            <button class="seat">A7</button>
            <button class="seat">A8</button>
            <button class="seat">A9</button>
            <button class="seat">A10</button>
            <button class="seat">A11</button>
            <button class="seat">A12</button>
            <button class="seat">A13</button>
            <button class="seat">A14</button>
            <button class="seat">A15</button>
          </div>
          <div class="row">
            <button class="seat">B6</button>
            <button class="seat">B7</button>
            <button class="seat">B8</button>
            <button class="seat">B9</button>
            <button class="seat">B10</button>
            <button class="seat">B11</button>
            <button class="seat">B12</button>
            <button class="seat">B13</button>
            <button class="seat">B14</button>
            <button class="seat">B15</button>
          </div>
          <div class="row">
            <button class="seat">C6</button>
            <button class="seat">C7</button>
            <button class="seat">C8</button>
            <button class="seat">C9</button>
            <button class="seat">C10</button>
            <button class="seat">C11</button>
            <button class="seat">C12</button>
            <button class="seat">C13</button>
            <button class="seat">C14</button>
            <button class="seat">C15</button>
          </div>
          <div class="row">
            <button class="seat">D6</button>
            <button class="seat">D7</button>
            <button class="seat">D8</button>
            <button class="seat">D9</button>
            <button class="seat">D10</button>
            <button class="seat">D11</button>
            <button class="seat">D12</button>
            <button class="seat">D13</button>
            <button class="seat">D14</button>
            <button class="seat">D15</button>
          </div>
          <div class="row">
            <button class="seat">E6</button>
            <button class="seat">E7</button>
            <button class="seat">E8</button>
            <button class="seat">E9</button>
            <button class="seat">E10</button>
            <button class="seat">E11</button>
            <button class="seat">E12</button>
            <button class="seat">E13</button>
            <button class="seat">E14</button>
            <button class="seat">E15</button>
          </div>
          <div class="row">
            <button class="seat">F6</button>
            <button class="seat">F7</button>
            <button class="seat">F8</button>
            <button class="seat">F9</button>
            <button class="seat">F10</button>
            <button class="seat">F11</button>
            <button class="seat">F12</button>
            <button class="seat">F13</button>
            <button class="seat">F14</button>
            <button class="seat">F15</button>
          </div>
        </div>
      
        <!-- Right Section -->
        <div class="seat-section">
          <div class="row">
            <button class="seat">A16</button>
            <button class="seat">A17</button>
            <button class="seat">A18</button>
            <button class="seat">A19</button>
            <button class="seat">A20</button>
            <button class="seat">A21</button>
          </div>
          <div class="row">
            <button class="seat">B16</button>
            <button class="seat">B17</button>
            <button class="seat">B18</button>
            <button class="seat">B19</button>
            <button class="seat">B20</button>
            <button class="seat">B21</button>

          </div>
          <div class="row">
            <button class="seat">C16</button>
            <button class="seat">C17</button>
            <button class="seat">C18</button>
            <button class="seat">C19</button>
            <button class="seat">C20</button>
            <button class="seat">C21</button>
          </div>
          <div class="row">
            <button class="seat">D16</button>
            <button class="seat">D17</button>
            <button class="seat">D18</button>
            <button class="seat">D19</button>
            <button class="seat">D20</button>
            <button class="seat">D21</button>
          </div>
          <div class="row">
            <button class="seat">E16</button>
            <button class="seat">E17</button>
            <button class="seat">E18</button>
            <button class="seat">E19</button>
            <button class="seat">E20</button>
            <button class="seat">E21</button>
          </div>
          <div class="row">
            <button class="seat">F16</button>
            <button class="seat">F17</button>
            <button class="seat">F18</button>
            <button class="seat">F19</button>
            <button class="seat">F20</button>
            <button class="seat">F21</button>
          </div>
        </div>
      </div>
      
    <div class="screenImg pt-2">
        <img src="images/movie-screen.png" alt="movie screen" class="img-fluid img-100 screen">
    </div>

        <div class="status-legend">
          <span class="status selected"><span class="color-box blue"></span> Selected</span>
          <span class="status available"><span class="color-box gray"></span> Available</span>
          <span class="status reserved"><span class="color-box light-blue"></span> Reserved</span>
        </div>

      <hr class="status-divider">

        <p class="ticket-message">0 ticket(s) selected. Please select attendees</p>
        <hr class="message-divider">

        <div class="navigation-buttons">
          <button class="nav-button back">BACK</button>
          <button class="nav-button continue">CONTINUE</button>
        </div>
      
      
  </main>

  <!-- Bootstrap JS and dependencies -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
