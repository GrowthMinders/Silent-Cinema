function check1(){ 
    var errordisplay = document.getElementById("errors");

    if(pass === 1 && pass !== ""){
        errordisplay.innerHTML = '<img src="./Images/Regimages/24.png">Invalid Credential';
        errordisplay.removeAttribute("style");
        return false;
    }
    
    errordisplay.innerHTML = "";
    errordisplay.style.display = "none";
    return true;
}


