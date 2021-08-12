// importing required modulues

const express = require("express");
const path = require('path');
const mysql = require('mysql');
const bodyparser = require('body-parser');
const { static } = require("express");
const { render, compile } = require("pug");
const { request } = require("http");

//Starting server
const app = express();

//creating a static folder to import css js and other files
const publicDirectory = path.join(__dirname, "public");
app.use(express.static(publicDirectory));

//using body parser to  grap data from forms
app.use(bodyparser.urlencoded({ extended: false }))

//use pug template
app.set('view engine', 'pug');


//connection to mysql
const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "root",
    database: "nss"
});


db.connect(function (err) {
    if (err) {
        console.log(err);
    }
    else {
        console.log("Mysql connected");
    }
})


//login page route
app.get("/", (req, res) => {
    res.render("login");
});


// Login page post route 
app.post("/", (req, res) => {
    console.log(req.body);
    db.query("select findlog( ? )",req.body.username, function (err, results) {
        if (err) {
            console.log(err);
        }
        console.log(results);
        JSON.stringify(results);
        let log_in=JSON.stringify(results);
        console.log(log_in);
        let strin="hello";
        console.log(strin);
        if (log_in==`[{"findlog( 'nssmcoe' )":"nssmcoe"}]`) {
            console.log(results)
            db.query("select findpass( ? )", req.body.password , function (err, results) {
                if (err) {
                    console.log(err);
                }
               
                var pass_in=JSON.stringify(results);
                if (pass_in==`[{"findpass( 'nss@123' )":"nss@123"}]`) {
                    console.log(results)
                
                    return res.render("homepage");
                    
                }
                else{
                    
                    return res.render("login", { error: 'INVALID LOGIN CREDENTIALS.'});
                }
            })
            
        }
        else{
            return res.render("login", { error: 'USERNAME NOT FOUND'});
        }
    })
});

//home page route 
app.get("/homepage", (req, res) => {
    res.render("homepage");
});

//registration page route
app.get("/nssreg", (req, res) => {
    res.render("nssreg");
});


//registration page post route 
app.post("/nssreg", (req, res) => {
    console.log(req.body);
    db.query("select prn from volunteer where prn = ? ", req.body.prn, function (err, results) {
        if (err) console.log(err)
        if (results.length > 0) {
            console.log(results)
            return res.render("nssreg", { error: 'Volunteer having this PRN is already existing in our database.Please re-enter Volunteer details' });
        }

        db.query("select aadhaar_no from personal_details where aadhaar_no = ? ", req.body.aadhar, function (err, results) {
            if (err) console.log(err);
            if (results.length > 0) {
                console.log(results)
                return res.render("nssreg", { error: 'Volunteer having this Aadhaar No is already existing in our database.Please re-enter Volunteer details' });
            }

            db.query("select eligibility_no from volunteer where eligibility_no = ? ", req.body.eligibility, function (err, results) {
                if (err) console.log(err)
                if (results.length > 0) {
                    console.log(results)
                    return res.render("nssreg", { error: 'Volunteer having this Eligibily No is already existing in our database.Please re-enter Volunteer details' });
                }

                db.query("select email_id from personal_details where email_id = ? ", req.body.email, function (err, results) {
                    if (err) console.log(err)
                    if (results.length > 0) {
                        console.log(results)
                        return res.render("nssreg", { error: 'Volunteer having this Email Id is already existing in our database.Please re-enter Volunteer details' });
                    }

                    db.query("select whatsapp_no from personal_details where whatsapp_no = ? ", req.body.phone, function (err, results) {
                        if (err) console.log(err)
                        if (results.length > 0) {
                            console.log(results)
                            return res.render("nssreg", { error: 'Volunteer having this Phone No is already existing in our database.Please re-enter Volunteer details' });
                        }
                    

                            var volunteer = "insert into volunteer(prn,eligibility_no,roll_no,student_name,department,year,shift,designation) values('" + req.body.prn + "','" + req.body.eligibility + "'," + req.body.clgroll + ",'" + req.body.fname + "','" + req.body.dept + "','" + req.body.year + "','" + req.body.shift + "','Member')";
                            var personal = "insert into personal_details values('" + req.body.aadhar + "','" + req.body.gender + "','" + req.body.email + "'," + req.body.phone + ",'" + req.body.cat + "')";
                            var has = "insert into has values('" + req.body.prn + "','" + req.body.aadhar + "')";
                            db.query(volunteer, function (err) {
                                if (err) throw err
                                console.log('Volunteer data stored successfuly');
                            })

                            db.query(personal, function (err) {
                                if (err) throw err
                                console.log('personal data stored successfuly');
                            })

                            db.query(has, function (err) {
                                if (err) throw err
                                console.log('has data stored successfuly');
                            })

                            console.log(req.body);
                            return res.render("nssreg", { message: 'Volunteer Registered successfuly.Enter details of new volunteer' });
                    });
                });
            });
        });
    });

});

//display page route
app.get("/display", (req, res) => {
    db.query("SELECT * FROM display", function (err, rows) {
        if (err) throw err
        res.render("display", { items: rows })
    })
});

//activity page route  
app.get("/activity", (req, res) => {
    res.render("activity");
});

//activity post route
app.post("/activity", (req, res) => {
    var a = 'activity_';
    var b = req.body.act;
    var actname = a.concat(b);
    console.log(actname)
    db.query("select activity_no from activity where activity_no = ? ", req.body.act, function (err, results) {
        if (err) throw err
        if (results.length > 0) {
            return res.render("activity", { message: 'Activity no is already present in our database.Please re-enter activity details' });
        }

        let today = new Date().toDateString();

        var activity = "insert into activity values(" + req.body.act + ",'" + req.body.aname + "','" + req.body.location + "','" + req.body.info + "','" + today + "')";

        db.query(activity, function (err) {
            if (err) throw err
            console.log('Activity data stored successfuly');
        })

        //rendering attendance page from here only
        db.query("SELECT activity_no,activity_name,location FROM activity where activity_no = ?", req.body.act, function (err, act_details) {
            if (err) console.log(err);
            else {
                db.query("Select student_name,year,department,shift,prn FROM volunteer", function (err, vol_details) {
                    if (err) console.log(err);
                    else {
                        console.log(actname)
                        console.log(req.body.act)
                        db.query("CALL add_act(?)", actname, function (err) {
                            if (err) console.log(err);
                            return res.render("attendance", { acts: act_details, vols: vol_details });
                        });

                    }
                });
            }
        });



    })
});

        // recording attendance one by one
app.post("/attendance", (req, res) => {
    var a = 'activity_';
    var b = req.body.submit;
    actname = a.concat(b);
    console.log(actname)
    var i;
    if(Array.isArray(req.body.present))
        {
                console.log("hello")
                    for (i = 0; i < req.body.present.length; i++) {
                        console.log(req.body.present);
                        db.query("update volunteer set " + actname + " = 'Present' WHERE prn = '" + req.body.present[i] + "' ", function (err) {
                            if (err) console.log(err);
                        });
                    }
        }
    else{
                    console.log("hey");
                    db.query("update volunteer set " + actname + " = 'Present' WHERE prn = '" + req.body.present + "' ")

        }
    res.render("homepage");
});

//update route
app.get("/update_delete", (req, res) => {
    db.query("Select student_name,year,department,shift,prn FROM volunteer", function (err, vol_details) {
        if (err) console.log(err);
        else 
            return res.render("update_delete", { vols: vol_details });
    });
});

app.post("/update_delete", (req,res) => {
    var up_prn=req.body.update
    var del_prn=req.body.delete
    if(req.body.update)
    {
        res.render("update",{ message: up_prn });
    }

    app.post("/update", (req,res) => {
        
        db.query("update volunteer set eligibility_no ='" + req.body.eligibility + "' ,roll_no=" + req.body.clgroll + ",student_name='" + req.body.fname + "',department='" + req.body.dept + "',year='" + req.body.year + "',shift='" + req.body.shift + "',designation='Member' where prn = '"+ up_prn +"'");
        
        db.query("select aadhaar_no from has where prn = '"+ up_prn +"'",function(err,results){
            if(err) console.log(err)
            else{
                var adhaar = results[0].aadhaar_no;
                db.query("update personal_details set gender='" + req.body.gender + "',email_id='" + req.body.email + "',whatsapp_no=" + req.body.phone + ",category='" + req.body.cat + "' where aadhaar_no = '"+ adhaar +"' ");
                db.query("SELECT * FROM display", function (err, rows) {
                    if (err) throw err
                    return res.render("display", { items: rows });
                })
            }
        });
    });

    if(req.body.delete)
    {
        db.query("delete from volunteer where prn='"+ del_prn +"'");
        db.query("delete from enrolls where prn='"+ del_prn +"'");
        db.query("select aadhaar_no from has where prn = '"+ del_prn +"'",function(err,results){
            if(err) console.log(err)
            else{
                var adhaar = results[0].aadhaar_no;
                db.query("delete from has where aadhaar_no='"+ adhaar +"'");
                db.query("delete from personal_details where aadhaar_no='"+ adhaar +"'");
                db.query("SELECT * FROM display", function (err, rows) {
                    if (err) throw err
                    return res.render("display", { items: rows });
                })
            }
        });
    }

});


//display_menu route
app.get("/display_menu", (req, res) => {
    res.render("display_menu");
});

//activity details route
app.get("/display_activity", (req, res) => {
    db.query("Select * FROM activity", function (err, act_detail) {
        if (err) console.log(err);
        else 
            return res.render("display_activity", { acts: act_detail });
    });
});

//activity details post route
app.post("/display_attendance", (req, res) => {
    console.log(req.body)
    var a = 'activity_';
    var b = req.body.act;
    var actname = a.concat(b);
    db.query("select * from volunteer where " + actname + " = 'Present'",function(err,vol_detail){
        if(err) console.log(err)
        else{
            db.query("Select * from activity where activity_no = "+ b +" ",function(err,act_value){
                if(err) console.log(err)
                else{
                    return res.render("display_attendance",{ items : vol_detail , acts : act_value , strength : vol_detail.length})
                }
            })
            
        }
    });
});


// listening on given port
app.listen(5000, () => {
    console.log("Server is on port 5000");
});