const express = require("express");
const mysqlConnection = require("../mysql_connection/connections");
readMSGRouter = express();


readMSGRouter.get("/read-message",(req,res)=>{

    var query = "SELECT * FROM chat_msg ORDER BY msgid";
    mysqlConnection.query(query,(err,rows,cols)=>{
        res.send(rows)
    })
});


module.exports = readMSGRouter