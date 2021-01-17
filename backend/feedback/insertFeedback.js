const express = require("express")
const mysqlConnection = require("../mysql_connection/connections")
const sendFeedback = express.Router()

sendFeedback.post("/feedback",(req,res)=>{
        var patient_id = req.query.patient_id
        var lab_report = req.query.lab_report


        var query = `INSERT INTO feedback(patient_id,lab_report) VALUES("${patient_id}",${JSON.stringify(lab_report)})`
        mysqlConnection.query(query,(err,rows,cols)=>{
            if(!err){
                res.send({"msg":"Successful"})
            }else{
                res.send({"msg":"failed"})
            }
        })
    })

    module.exports = sendFeedback