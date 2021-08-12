const searchname = () =>{
let filter = document.getElementById('search').value.toLowerCase();
let filterupper = document.getElementById('search').value;
let mytable = document.getElementById('mytable');
let tr = mytable.getElementsByTagName('tr');
for(var i=0; i<tr.length; i++){
    let td = tr[i].getElementsByTagName('td')[3];
    let te = tr[i].getElementsByTagName('td')[4];
    let tf = tr[i].getElementsByTagName('td')[5];
    let tg = tr[i].getElementsByTagName('td')[6];
    let th = tr[i].getElementsByTagName('td')[7];
    let ti = tr[i].getElementsByTagName('td')[9];
    if(td){
        let textvalue = td.textContent || td.innerHTML;
        if(textvalue.toLowerCase().indexOf(filter) > -1){
            tr[i].style.display = "";
        }else{
            tr[i].style.display = "none";
        }
    }
    if(te){
        let textvalue = te.textContent || te.innerHTML;
        if(textvalue.indexOf(filterupper) > -1){
            tr[i].style.display = "";
        }
    }
    if(tf){
        let textvalue = tf.textContent || tf.innerHTML;
        if(textvalue.indexOf(filterupper) > -1){
            tr[i].style.display = "";
        }
    }
    if(tg){
        let textvalue = tg.textContent || tg.innerHTML;
        if(textvalue.toLowerCase().indexOf(filter) > -1){
            tr[i].style.display = "";
        }
    }
    if(th){
        let textvalue = th.textContent || th.innerHTML;
        if(textvalue.toLowerCase().indexOf(filter) > -1){
            tr[i].style.display = "";
        }
    }
    if(ti){
        let textvalue = ti.textContent || ti.innerHTML;
        if(textvalue.toLowerCase().indexOf(filter) > -1){
            tr[i].style.display = "";
        }
    }
}
}

