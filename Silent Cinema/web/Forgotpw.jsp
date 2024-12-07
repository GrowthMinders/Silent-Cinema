<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./CSS/Forgotpw.css">
</head>
<body class="custom-bg">
    <div class="container d-flex justify-content-center align-items-center vh-100">
        <div class="card shadow-lg p-4" style="width: 400px;">
            <h4 class="text-center mb-4">Change your password</h4>
            <form action="ChangePasswordServlet" method="post">
                <div class="mb-4 position-relative">
                    <label for="registeredemail" class="form-label">Registered Email</label>
                    <input type="email" class="form-control" id="registeredemail" name="email" required>
                </div>
                <div class="mb-4 position-relative">
                    <label for="newPassword" class="form-label">New password</label>
                    <div class="input-wrapper">
                        <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                        <button type="button" class="btn btn-outline-secondary position-absolute end-0 me-2 toggle-password">
                            <i class="bi bi-eye"></i>
                        </button>
                    </div>
                </div>
                <div class="mb-4 position-relative">
                    <label for="confirmPassword" class="form-label">Confirm new password</label>
                    <div class="input-wrapper">
                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                        <button type="button" class="btn btn-outline-secondary position-absolute end-0 me-2 toggle-password">
                            <i class="bi bi-eye"></i>
                        </button>
                    </div>
                </div>
                <div class="d-flex justify-content-end gap-2">
                    <button type="button" class="btn btn-secondary">Cancel</button>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
  
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</body>
</html>
