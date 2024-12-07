<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./CSS/ContactUs.css">
</head>
<body>
    <div class="container-fluid">
        <!-- Navigation Bar -->
        <header class="bg-dark text-light py-3">
            <div class="container d-flex justify-content-between align-items-center">
                <span class="logo fw-bold fs-4">SC Silent Cinemas</span>
                <nav>
                    <a href="#" class="text-light text-decoration-none me-3">HOME</a>
                    <a href="#" class="text-light text-decoration-none me-3">MOVIES</a>
                    <a href="#" class="text-light text-decoration-none me-3">DEALS AND EXCLUSIVES</a>
                    <a href="#" class="btn btn-primary me-3">BUY TICKETS</a>
                    <a href="#" class="text-light text-decoration-none">LOGIN</a>
                </nav>
            </div>
        </header>

        <!-- Main Content -->
        <main class="container my-5">
            <div class="row g-4">
                <!-- Form Section -->
                <div class="col-md-6">
                    <div class="form-section p-4 bg-primary text-light rounded">
                        <h2>Contact Us</h2>
                        <p>
                            If you wish to contact us via email, please fill the following form, and we will get in touch with you at the earliest.
                        </p>
                        <form action="processContactForm.jsp" method="post">
                            <div class="mb-3">
                                <label for="name" class="form-label">Name:</label>
                                <input type="text" id="name" name="name" class="form-control" placeholder="Enter Your Name" required>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email:</label>
                                <input type="email" id="email" name="email" class="form-control" placeholder="Ex: email@email.com" required>
                            </div>
                            <div class="mb-3">
                                <label for="phone" class="form-label">Mobile Number:</label>
                                <input type="tel" id="phone" name="phone" class="form-control" placeholder="Ex: 0xxxxxxxxx" required>
                            </div>
                            <div class="mb-3">
                                <label for="message" class="form-label">Message:</label>
                                <textarea id="message" name="message" class="form-control" placeholder="Enter your message" rows="4" required></textarea>
                            </div>
                            <button type="submit" class="btn btn-light text-primary fw-bold">SUBMIT</button>
                        </form>
                    </div>
                </div>

                <!-- Contact Details -->
                <div class="col-md-6">
                    <div class="contact-details p-4 bg-dark text-light rounded shadow">
                        <h3 class="text-primary">Marketing & Advertising</h3>
                        <p>0771111111 - HOMAGAMA</p>
                        <p><a href="mailto:homagama@silentcinemas.com" class="text-decoration-none text-primary">homagama@silentcinemas.com</a></p>

                        <h3 class="text-primary">Theater Contact Details</h3>
                        <p>CCC Cinema</p>
                        <p>0112083064</p>
                        <p>Liberty by Silent Cinema</p>
                        <p>0771111111</p>

                        <h3 class="text-primary">Help Desk</h3>
                        <p>(09:00 AM - 06:00 PM Monday - Friday)</p>
                        <p>0112222222 / 0772222222</p>
                        <p><a href="mailto:helpdesk@silentcinemas.com" class="text-decoration-none text-primary">helpdesk@silentcinemas.com</a></p>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
