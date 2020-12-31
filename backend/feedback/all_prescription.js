const express = require("express")
const mysqlConnection = require("../mysql_connection/connections")
const allPrescriptions = express.Router()


allPrescriptions.post("/prescriptions",(req,res)=>{

        var query = `SELECT * FROM prescriptions ORDER BY id`
        mysqlConnection.query(query,(err,rows,cols)=>{
            if(!err){
                res.send(rows)
            }else{
                //console.log(`THE ERROR: ${err}`);
                res.json([{"msg":"failed"}])
            }
        })
    })

    module.exports = allPrescriptions