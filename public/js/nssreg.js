
function funcValidate()
{
    {
    var fn=document.nssForm.fname.value;
    
    if( fn=="")
    {
        alert('Please input Name');
        return false;
    }
    
    var m=document.getElementById('male');
    var f=document.getElementById('female');

    if( (m.checked == false) && (f.checked ==false) )
    {
        alert("Please choose Gender");
        document.getElementById("gen").style.border="2px solid red";
        return false;
    }
    else
    {
        document.getElementById("gen").style.border="";
    }

    var em=document.nssForm.email.value;
    var atpos=em.indexOf("@");
    var dotpos=em.lastIndexOf(".");
    if(atpos<1 || dotpos<atpos+2 || dotpos+2>=em.length)
    {
        alert("Invalid email id");
        return false;
    }
    
    var y=document.getElementById("year")
    if(y.value == null || y.value ==""){
    alert("Please select a year");
    return false;
    }

    var d=document.getElementById("dept")
    if(d.value == null || d.value ==""){
        alert("Please select a department");
        return false;
    }

    var d=document.getElementById("shift")
    if(d.value == null || d.value ==""){
        alert("Please select a shift");
        return false;
    }

    var r=document.nssForm.clgroll.value;
    if(isNaN(r))
    {
        alert("Enter only numbers");
        return false;
    }
    if(r=="")
    {
        alert("Enter roll number");
        return false;
    }
    

    var p=document.nssForm.phone.value;
    if(isNaN(p))
    {
        alert("Enter only numbers");
        return false;
    }
    if(p=="")
    {
        alert("Enter mobile number");
        return false;
    }
    if(p.length>10)
    {
        alert("Invalid Number");
        return false;
    }
    if(p.length<10)
    {
        alert("Invalid Number");
        return false;
    }
    
    var per=document.nssForm.prn.value;
    if(per=="")
    {
        alert("Enter prn number");
        return false;
    }
    
    var e=document.nssForm.eligibility.value;
    if(isNaN(e))
    {
        alert("Enter only numbers");
        return false;
    }
    if(e=="")
    {
        alert("Enter eligibility number");
        return false;
    }
    var c=document.nssForm.cat.value;
    var form= /[^a-z]/i;
    var cat=form.test(c);
    if( c=="")
    {
        alert('Please input Category');
        return false;
    }
    if( c==null || cat==true)
    {
        alert("Enter only alphabets for Category");
        return false;
    }
    var a=document.nssForm.aadhar.value;
    if(isNaN(a))
    {
        alert("Enter only numbers");
        return false;
    }
    if(a=="")
    {
        alert("Enter aadhar number");
        return false;
    }
    
    
    }

}