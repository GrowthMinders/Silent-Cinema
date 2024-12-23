var counters = 0;
function seatsreserve(seatno){
    var res = document.getElementById("selseats").value;
    
    if(res !== null && res !== ""){
       res = res + "," + seatno;
       counters ++;
    }else{
       res = seatno;
       counters ++;
    }
    
    document.getElementById("selseats").value = res;
}

function counter() {
    var countresult = document.getElementById("counting");
    countresult.innerText = counters + " ticket(s) selected. Please select attendees.";
    document.getElementById("seatno").value = counters;
}
