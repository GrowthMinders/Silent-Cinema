function keycolor(){  
    var pass = document.getElementById("pass").value;
    
    const upper = /[A-Z]+/;
    const lower = /[a-z]+/;
    const digit = /[0-9]+/;
    const special = /[~`!@#$%^&*()_+=}{"':;<>,./?]+/;
    const size = /^.{8,24}$/;
    
    if(upper.test(pass)){
        document.getElementById("up").style.color = "green";
        document.getElementById("icon1").style.color = "green";
    }else{
        document.getElementById("up").style.color = "red";
        document.getElementById("icon1").style.color = "red";
    }
    
    if(lower.test(pass)){
        document.getElementById("lo").style.color = "green";
        document.getElementById("icon2").style.color = "green";
    }else{
        document.getElementById("lo").style.color = "red";
        document.getElementById("icon2").style.color = "red";
    }
    
    if(digit.test(pass)){
        document.getElementById("di").style.color = "green";
        document.getElementById("icon3").style.color = "green";
    }else{
        document.getElementById("di").style.color = "red";
        document.getElementById("icon3").style.color = "red";
    }
    
    if(special.test(pass)){
        document.getElementById("spc").style.color = "green";
        document.getElementById("icon4").style.color = "green";
    }else{
        document.getElementById("spc").style.color = "red";
        document.getElementById("icon4").style.color = "red";
    }
    
    if(size.test(pass)){
        document.getElementById("len").style.color = "green";
        document.getElementById("icon5").style.color = "green";
    }else{
        document.getElementById("len").style.color = "red";
        document.getElementById("icon5").style.color = "red";
    }
    
    if(pass > 24){
        document.getElementById("len").style.color = "red";
        document.getElementById("icon5").style.color = "red";
    }
    
}