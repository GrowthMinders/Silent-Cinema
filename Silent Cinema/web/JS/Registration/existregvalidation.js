 function exist() {
     //Creating variables using user inputs
    var email = document.getElementById("email").value; 
    var tel = document.getElementById("tel").value;
    var nic = document.getElementById("nic").value;
   
   //Creating a variable to represent the errors class
   var errordisplay = document.getElementById("errors");
    //Email exist
    if(emailres === email){
       errordisplay.innerHTML = '<img src="./Images/Regimages/24.png">Email already registered';
       errordisplay.removeAttribute("style");
       return false;
    }
    //Tel exist
    if(telres === tel){
       errordisplay.innerHTML = '<img src="./Images/Regimages/24.png">Telephone number already registered';
       errordisplay.removeAttribute("style");
       return false;
    }
    //NIC exist
    if(nicres === nic){
       errordisplay.innerHTML = '<img src="./Images/Regimages/24.png">NIC already registered';
       errordisplay.removeAttribute("style");
       return false;
    }
    
     errordisplay.innerHTML ="";
     errordisplay.style.display="none";
     return true;
    
}



