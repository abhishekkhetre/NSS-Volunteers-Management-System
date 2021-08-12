function funcValidate()
{
{
var a=document.activity.act.value;
    if(isNaN(a))
    {
        alert("Enter only numbers");
        return false;
    }
    if(a=="")
    {
        alert("Enter Activity number");
        return false;
    }

var an=document.activity.aname.value;

if( an=="")
{
    alert('Please input Activity name');
    return false;
}

var l=document.activity.location.value;

if( l=="")
{
    alert('Please input Location');
    return false;
}

var i=document.activity.info.value;

if( i=="")
{
    alert('Please input Activity Info');
    return false;
}

}
}
