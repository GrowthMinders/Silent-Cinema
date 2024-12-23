<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./CSS/Forgotpw.css">
    <link rel="stylesheet" href="./CSS/Errors.css">
    
    <script src="./JS/Reset_Password/Shwcpass.js"></script>
    <script src="./JS/Reset_Password/Shwpass.js"></script>
    <script src="./JS/Reset_Password/Repassvalidate.js"></script>
    <script src="./JS/Registration/passcolornote.js"></script>
</head>
<body class="custom-bg">
    <script>
        function toggle(){
            var element = document.querySelectorAll("#ico");
            for(let i = 0; i<6; i++){
                element[i].removeAttribute("style");
            }    
        }
    </script>
    <div class="container d-flex justify-content-center align-items-center vh-100" style="flex-direction: column;">
        <div>
            <span id="errors" style="display: none;">
            </span>
        </div>
        <div class="card shadow-lg p-4" style="width: 400px;">
            <h4 class="text-center mb-4">Change your password</h4>
            <form action="./ChangePasswordServlet" method="post" onsubmit="return vali();">
                <div class="mb-4 position-relative">
                    <label for="registeredemail" class="form-label">Registered Email</label>
                    <input type="email" class="form-control" id="email" name="email">
                </div>
                <div class="mb-4 position-relative">
                    <label for="newPassword" class="form-label">New password</label>
                    <div class="input-wrapper">
                        <input type="password" class="form-control" id="pass" name="pass" onclick="toggle();" oninput="keycolor();">
                        <button type="button" class="btn btn-outline-secondary position-absolute end-0 me-2 toggle-password" onclick="shpass1();">
                            <i class="bi bi-eye"></i>
                        </button>
                    </div>
                </div>
                 <div id="ico" style="display: none;">
                  <i id="icon1" class="fa-solid fa-check"></i>
                  <span id="up">Uppercase needed(A-Z)</span>
               </div>
               <div id="ico" style="display: none;">
                  <i id="icon2" class="fa-solid fa-check"></i>
                  <span id="lo">Lowercase needed(a-z)</span>
               </div>
               <div id="ico" style="display: none;">
                  <i id="icon3" class="fa-solid fa-check"></i>
                  <span id="di">Digits needed(0-9)</span>
               </div>
               <div id="ico" style="display: none;">
                  <i id="icon4" class="fa-solid fa-check"></i>
                  <span id="spc">Special Character(@,#,$,%,^,ect)</span>
               </div>
               <div id="ico" style="display: none;">
                  <i id="icon5" class="fa-solid fa-check"></i>
                  <span id="len">Length 8-24</span>
               </div>
                <div class="mb-4 position-relative">
                    <label for="confirmPassword" class="form-label">Confirm new password</label>
                    <div class="input-wrapper">
                        <input type="password" class="form-control" id="cpass" name="cpass">
                        <button type="button" class="btn btn-outline-secondary position-absolute end-0 me-2 toggle-password" onclick="shpass2();">
                            <i class="bi bi-eye"></i>
                        </button>
                    </div>
                </div>
                <div class="d-flex justify-content-end gap-2">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
  
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</body>
</html>
