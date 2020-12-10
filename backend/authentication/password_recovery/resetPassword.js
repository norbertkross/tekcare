const express = require("express")
const mysqlConnection = require("../mysql_connection/connections")
const sendPassCode = require("./sendPassCode")
const resetPassword = express.Router()


    resetPassword.post("/resetpassword",(req,res)=>{
        var rand = randomAlphaNumeric(6)
        var email = req.query.email
        var query = `SELECT * FROM users_all WHERE email='${email}' AND email_verified='1'`
        mysqlConnection.query(query,(err,rows,cols)=>{
            if(!err){
                if(rows != null && rows.length > 0){
                    var updateVerificationCode = `UPDATE users_all SET verification_code= '${rand}'`

                    mysqlConnection.query(updateVerificationCode,(err,rows,cols)=>{
                        if(!err){
                            console.log(rows[0].name);
                            sendPassCode(email,rows[0].name,rand)
                            res.send({"msg":"email sent"})
                         }
                     })
                }else{
                res.send({"msg":"email not verified"})
                }
            }else{
                res.send({"msg":"an error Occurred"})
            }
        })
    })


    function randomAlphaNumeric(length) {
        var result           = '';
        var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_-=+[{]}?';
        var charactersLength = characters.length;
        for ( var i = 0; i < length; i++ ) {
            result += characters.charAt(Math.floor(Math.random() * charactersLength));               
        }
        return result;
     }

     module.exports = resetPassword