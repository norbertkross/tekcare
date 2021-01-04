const express = require("express");
const mysqlConnection = require("../mysql_connection/connections");
chatroom = express();


chatroom.get("/our-chatroom",(req,res)=>{

    var myid = req.query.myid
    var otherid = req.query.otherid

    var query = `SELECT * FROM chat_msg WHERE (poster_id='${myid}' OR recepient_id='${otherid}') OR (poster_id='${otherid}' OR recepient_id='${myid}') ORDER BY msgid`;
    mysqlConnection.query(query,(err,rows,cols)=>{
       if(!err){
        res.send(rows)
       }else{
           console.log(err);
        res.send({"msg":"failed"})
       }
    })
});


module.exports = chatroom