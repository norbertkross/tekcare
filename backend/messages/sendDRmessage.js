const express = require("express")
const uploadMessage = express.Router()
const multer = require("multer")
const mysqlConnection = require("../mysql_connection/connections")
const handle_file_upload = require("../mysql_connection/fileUpload")
const upload = multer({dest:"./uploads"})



// Random Variable To Attach To File Names
var randname = Math.floor(Math.random() * 998978643697);

    uploadMessage.post("/send-message",upload.single("msg_media"),(req,res)=>{
        
        var poster_id = req.query.poster_id
        var recepient_id = req.query.recepient_id
        var username = req.query.username
        var message = req.query.message
        var media_type = req.query.media_type
        var isReply = req.query.isReply



        if(req.query.msg_media  || false){

        console.log("\nfile is not null\n");
        // create a newname for the file
        var newname= req.file.originalname.length <200?
        randname+"-"+req.file.originalname:randname+"-"+req.file.originalname.substring(0,200)
        // path to write image to on the server
        var path = "./uploads/"    
        // path to image in the database
        var imageUrl = "http://127.0.0.1:3000/uploads/"+newname    

        // Query
        var messageInsertMediaQuery = `INSERT INTO chat_msg(poster_id,recepient_id,username,message,media_type,media_url,isReply) VALUES('${poster_id}','${recepient_id}','${username}',${JSON.stringify(message)},'${media_type}',${JSON.stringify(imageUrl)},${JSON.stringify(isReply) || " "})`

        handle_file_upload(req,newname,path).then((__)=>{
            if( __ === "OK"){
                //console.log(done.toString());
                mysqlConnection.query(messageInsertMediaQuery,(err,rows,cols)=>{
                    if(!err){
                        res.send({"msg":"Successful"})
                    }else{
                        console.log(err);
                        res.send({"msg":"failed"})
                    }
                })

            }else{
                res.send({"msg":"failed"})
            }
        })

    }else{
        
        // Query
        var messageInsertQuery = `INSERT INTO chat_msg(poster_id,recepient_id,username,message,media_type,media_url,isReply) VALUES('${poster_id}','${recepient_id}','${username}',${JSON.stringify(message)},'${media_type}',' ',${JSON.stringify(isReply) || " "})`

        //console.log(`\n${messageInsertQuery} \n`);
        // adding only msg
        mysqlConnection.query(messageInsertQuery,(err,rows,cols)=>{
            if(!err){
                res.send({"msg":"Successful"})
            }else{
                console.log(err);
                res.send({"msg":"failed"})
            }
        })
    }        

    })



    module.exports = uploadMessage