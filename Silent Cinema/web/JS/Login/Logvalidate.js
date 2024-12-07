function logval(){
    var email = document.getElementById("email").value; 
    
    var errordisplay = document.getElementById("errors");
        if(email.length === 0){
            errordisplay.innerHTML = '<img src="./Images/Regimages/24.png">Email required';
            errordisplay.removeAttribute("style");
            return false;
        }    
    
    
    errordisplay.innerHTML = "";
    errordisplay.style.display = "none";
    return true;
} 

