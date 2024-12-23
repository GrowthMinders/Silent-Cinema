function vali(){ 
    //Creating variables using user inputs
    var email = document.getElementById("email").value; 
    var pass = document.getElementById("pass").value;
    var cpass = document.getElementById("cpass").value;

   //Creating a variable to represent the errors class
   var errordisplay = document.getElementById("errors");
   
   //Regex for password validations
    const regexpass1 = /[a-z]+/;
    const regexpass2 = /[A-Z]+/;
    const regexpass3 = /[0-9]+/;
    const regexpass4 = /[~`!@#$%^&*()_+=}{"':;<>,./?]+/;
   //Regex for email validations
    const regexemail1 = /^([a-z0-9]{6,30})(@)(gmail\.com)$/;
    const regexemail2 = /^([a-zA-Z0-9-_]{3,64})(@)(outlook\.com)$/;
    const regexemail3 = /^([a-zA-Z0-9-_]{4,32})(@)(yahoo\.com)$/;
  
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
    
     
     
    errordisplay.innerHTML ="";
    errordisplay.style.display = "none";
    return true;
}

