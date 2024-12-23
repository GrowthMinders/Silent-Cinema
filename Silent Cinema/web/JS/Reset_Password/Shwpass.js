function shpass2(){
  x = document.getElementById("cpass"); 
  
  if((x.type === "password")){
      x.type = "text";
  }else{
      x.type = "password";
  }
}



