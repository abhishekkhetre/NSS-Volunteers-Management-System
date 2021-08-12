
function validateForm() {
    var myid = document.getElementById("myId");
    var mypass = document.getElementById("myPass");

    if (myid.value.trim() == "") {
        alert("Username is Blank");
      return false;
    }

    // else if(myid.value!="nssmcoe"){
    //     alert("Username Not Found")
    //   return false;
    // }

    if(mypass.value.trim() == "") {
        alert("Password is blank");
      return false;      
    }

    else{
      return true;
    }

  }