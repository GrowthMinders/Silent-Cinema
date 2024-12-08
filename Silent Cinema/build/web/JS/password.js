function shpass(){
  x = document.getElementById("pass"); 
  y = document.getElementById("cpass"); 
  
  if((x.type === "password") && (y.type === "password")){
      x.type = "text";
      y.type = "text";
  }else{
      x.type = "password";
      y.type = "password";
  }
}


