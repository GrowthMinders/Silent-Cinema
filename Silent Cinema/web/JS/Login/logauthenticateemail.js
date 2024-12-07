function check(){ 
    var errordisplay = document.getElementById("errors");

    if(mail === 1 && mail !== ""){
        errordisplay.innerHTML = '<img src="./Images/Regimages/24.png">User account not found';
        errordisplay.removeAttribute("style");
        return false;
    }
    
    errordisplay.innerHTML = "";
    errordisplay.style.display = "none";
    return true;
}



