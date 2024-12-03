function validate(){ 
    //Creating variables using user inputs
    var fname = document.getElementById("fname").value;
    var lname = document.getElementById("lname").value;
    var email = document.getElementById("email").value; 
    var tel = document.getElementById("tel").value;
    var pass = document.getElementById("pass").value;
    var cpass = document.getElementById("cpass").value;
    var nic = document.getElementById("nic").value;
   
   //Creating a variable to represent the errors class
   var errordisplay = document.getElementById("errors");
    
    
   //Regex for first and last name validations
    const regexname = /^([a-zA-Z ]+){3,50}$/;
   //Regex for password validations
    const regexpass1 = /[a-z]+/;
    const regexpass2 = /[A-Z]+/;
    const regexpass3 = /[0-9]+/;
    const regexpass4 = /[~`!@#$%^&*()_+=}{"':;<>,./?]+/;
   //Regex for email validations
    const regexemail1 = /^([a-z0-9]{6,30})(@)(gmail\.com)$/;
    const regexemail2 = /^([a-zA-Z0-9-_]{3,64})(@)(outlook\.com)$/;
    const regexemail3 = /^([a-zA-Z0-9-_]{4,32})(@)(yahoo\.com)$/;
   //Regex for telephone validations
    const regextel = /^(\+94[0-9]{9}|(071|076|077|075|074|070|078)[0-9]{7}|0777[0-9]{6})$/;
   //Regex for NIC validations
    const regexnic = /^([0-9]{12}|[0-9]{9}V)$/;
    
    //First name
    if(fname.length === 0){
       errordisplay.innerHTML = '<img src="./Images/Regimages/24.png">First name required';
       errordisplay.removeAttribute("style");
       return false;
    }
    if(!regexname.test(fname)){
       errordisplay.innerHTML = '<img src="./Images/Regimages/24.png">Invalid first name';
       errordisplay.removeAttribute("style");
       return false;
    }
   //Last name
    if(lname.length === 0){
       errordisplay.innerHTML = '<img src="./Images/Regimages/24.png">Last name required';
       errordisplay.removeAttribute("style");
       return false;
    }
    if(!regexname.test(lname)){
       errordisplay.innerHTML = '<img src="./Images/Regimages/24.png">Invalid last name';
       errordisplay.removeAttribute("style");
       return false;
    }
    //Email
    if(email.length === 0){
       errordisplay.innerHTML = '<img src="./Images/Regimages/24.png">Email required';
       errordisplay.removeAttribute("style");
       return false;
    }
    if(!regexemail1.test(email) || regexemail2.test(email) || regexemail3.test(email)){
       errordisplay.innerHTML = '<img src="./Images/Regimages/24.png">Invalid email';
       errordisplay.removeAttribute("style");
       return false;
    }
    //Telephone
    if(tel.length === 0){
       errordisplay.innerHTML = '<img src="./Images/Regimages/24.png">Contact number required';
       errordisplay.removeAttribute("style");
       return false;
    }
    if(!regextel.test(tel)){
       errordisplay.innerHTML = '<img src="./Images/Regimages/24.png"> Invalid contact number';
       errordisplay.removeAttribute("style");
       return false;
    }
    //Password
    if(pass.length === 0){
       errordisplay.innerHTML = '<img src="./Images/Regimages/24.png">Password required';
       errordisplay.removeAttribute("style");
       return false;
    }
    if(!regexpass1.test(pass)){
       errordisplay.innerHTML = '<img src="./Images/Regimages/24.png">Lowercase characters needed';
       errordisplay.removeAttribute("style");
       return false;
    }
    if(!regexpass2.test(pass)){
       errordisplay.innerHTML = '<img src="./Images/Regimages/24.png">Uppercase characters needed';
       errordisplay.removeAttribute("style");
       return false;
    }
    if(!regexpass3.test(pass)){
       errordisplay.innerHTML = '<img src="./Images/Regimages/24.png">Digits needed';
       errordisplay.removeAttribute("style");
       return false;
    }
    if(!regexpass4.test(pass)){
       errordisplay.innerHTML = '<img src="./Images/Regimages/24.png">Special characters needed';
       errordisplay.removeAttribute("style");
       return false;
    }
    if(pass.length < 8){
       errordisplay.innerHTML = '<img src="./Images/Regimages/24.png">Password too weak';
       errordisplay.removeAttribute("style");
       return false;
    }
    if(pass.length > 24){
       errordisplay.innerHTML = '<img src="./Images/Regimages/24.png">Password too long';
       errordisplay.removeAttribute("style");
       return false;
    }
    //Confirm Password
    if(cpass.length === 0){
       errordisplay.innerHTML = '<img src="./Images/Regimages/24.png">Confirm password required';
       errordisplay.removeAttribute("style");
       return false;
    }
    if(pass !== cpass){
       errordisplay.innerHTML = '<img src="./Images/Regimages/24.png">Passwords do not match';
       errordisplay.removeAttribute("style");
       return false;
    }
    //NIC
    if(nic.length === 0){
       errordisplay.innerHTML = '<img src="./Images/Regimages/24.png">NIC required';
       errordisplay.removeAttribute("style");
       return false;
    }
    if(!regexnic.test(nic)){
       errordisplay.innerHTML = '<img src="./Images/Regimages/24.png">Invalid NIC';
       errordisplay.removeAttribute("style");
       return false;
    }
     
     
    errordisplay.innerHTML ="";
    errordisplay.style.display = "none";
    return true;
}



