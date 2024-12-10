<%-- 
    Document   : careers
    Created on : Dec 9, 2024, 7:01:16 PM
    Author     : 💕Isuu✨
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Careers</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="./CSS/Careers.css">
    </head>
    <body>
        <%@ include file="Header_Footer/Nav.jsp" %>
        <div class="des">
            <div>
                <h1 class="text-center mb-5 mt-5">Carreers</h1>
            </div>
            <div class="row align-items-center">
                <div class="col-lg-4 col-md-5 col-12 text-center">
                    <p class="text-uppercase text-white"><small>Work at Silent Cinemas</small></p>
                </div>
                <div class="col-lg-8 col-md-7 col-12">

                  <p class="text-dark">
                    Silent Cinemas is set to give Sri Lanka its first ever international standard cinema multiplex<br> at Homagama in 2018. Dedicated towards raising the bar in Sri Lanka?s cinema experience,<br> our aim is to provide Sri Lankans with all the flare of old school movie theatres,<br> coupled with state of the art modernity and comfort consistent with international standards.
                  </p>
                  <p class="text-dark">
                    From the box office toppers that will be airing throughout the year, to the handpicked F&B brands<br> right down to the uber comfy seating ? Silent Cinemas is fast-tracking the future of Sri Lanka?s <br> cinema sphere.And you have an opportunity to be a part of that change.
                  </p>
                </div>
            </div>
        </div>
        <div class="container vacancies-container mb-5">
          <h1 class="text-center mb-5">Current Vacancies</h1>
          <div class="row  vacancy-cards">
            <div class="col-12 col-md-6 col-lg-4 col-xl-4 vacancy-card">
              <div class="card h-100 shadow-sm">
                <img src="./Images/Carreer/1.jpg" class="card-img-top" alt="Vacancy Poster 1">
                <div class="card-body text-center">
                  <h6 class="text-uppercase">we are hiring !</h6>
                  <button class="apply-btn btn-primary w-100" data-bs-toggle="modal" data-bs-target="#applyModal">Apply Now</button>
                </div>
              </div>
            </div>

            <div class="col-12 col-md-6 col-lg-4 col-xl-4 vacancy-card">
              <div class="card h-100 shadow-sm">
                <img src="./Images/Carreer/2.jpg" class="card-img-top" alt="Vacancy Poster 1">
                <div class="card-body text-center">
                  <h6 class="text-uppercase">we are hiring !</h6>
                  <button class="apply-btn btn-primary w-100" data-bs-toggle="modal" data-bs-target="#applyModal">Apply Now</button>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="modal fade" id="applyModal" tabindex="-1" aria-labelledby="applyModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="applyModalLabel">Apply for the Position</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body">
                        <form>
                              <div class="mb-3">
                                <label for="name" class="form-label">Full Name</label>
                                <input type="text" class="form-control" id="name" placeholder="Enter your name" required>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email Address</label>
                                <input type="email" class="form-control" id="email" placeholder="Enter your email" required>
                            </div>
                            <div class="mb-3">
                                <label for="contact" class="form-label">Contact Number</label>
                                <input type="tel" class="form-control" id="contact" placeholder="Enter your contact number" required>
                            </div>
                            <div class="mb-3">
                                <label for="cv" class="form-label">Upload CV</label>
                                <input type="file" class="form-control" id="cv" accept=".pdf,.doc,.docx" required>
                            </div>
                            <div class="mb-3">
                                <label for="message" class="form-label">Message</label>
                                <textarea class="form-control" id="message" rows="4" placeholder="Write your message"></textarea>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Submit Application</button>
                    </div>
                </div>
            </div>
        </div>
      <%@ include file="Header_Footer/Footer.jsp" %> 
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
