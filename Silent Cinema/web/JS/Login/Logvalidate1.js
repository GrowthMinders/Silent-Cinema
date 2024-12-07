function logval1(){
    var pass = document.getElementById("pass").value; 
    
    var errordisplay = document.getElementById("errors");
        if(pass.length === 0){
            errordisplay.innerHTML = '<img src="./Images/Regimages/24.png">Password required';
            errordisplay.removeAttribute("style");
            return false;
        }    
    
    
    errordisplay.innerHTML = "";
    errordisplay.style.display = "none";
    return true;
} 




