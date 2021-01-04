const express = require("express")
const mysqlConnection = require("../mysql_connection/connections")
const addPrescriptions = express.Router()

addPrescriptions.post("/add-prescription",(req,res)=>{
        var patient_id = req.query.patient_id
        var conclusion = req.query.conclusion


        var query = `INSERT INTO prescriptions(patient_id,conclusion) VALUES("${patient_id}",${JSON.stringify(conclusion)})`
        mysqlConnection.query(query,(err,rows,cols)=>{
            if(!err){
                res.send({"msg":"Successful"})
            }else{
                res.send({"msg":"failed"})
            }
        })
    })

    module.exports = addPrescriptions