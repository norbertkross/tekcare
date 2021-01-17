const express = require("express");
const mysqlConnection = require("../mysql_connection/connections");
allDoctors = express();


allDoctors.get("/all_doctors",(req,res)=>{

    var query = "SELECT * FROM all_doctors ORDER BY id";
    mysqlConnection.query(query,(err,rows,cols)=>{
        if(!err){        
        res.send(rows)
        }else{
        //console.log(err);
        res.send({"msg":"failed"})    
        }
    })
});


module.exports = allDoctors