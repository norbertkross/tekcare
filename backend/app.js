var express = require('express');
var app = express()
const http = require('http').createServer(app)

const readMSGRouter = require("./messages/readDRmessage.js");
const sendDRmessage = require('./messages/sendDRmessage.js');
const chatroom = require('./messages/getSpecifiqChatroom');
const allDoctors = require('./messages/getAllDoctors');
const sendFeedback = require('./feedback/insertFeedback.js');
const allPrescriptions = require('./feedback/all_prescription.js');
const addPrescriptions = require('./feedback/addPrescriptions.js');




app.get('/', function(req, res){
    res.send("<center> <h2>WELCOME TO <h1>TEKCARE</h1> </h2></center>");
  });


  // ########### use Custom routes########### //

        //app.use(loginRouter) // loginRouter was imported in the comment aboove
        app.use(readMSGRouter) 
        app.use(sendDRmessage) 
        app.use(chatroom) 
        app.use(allDoctors) 
        app.use(sendFeedback) 
        app.use(allPrescriptions) 
        app.use(addPrescriptions) 





// Route to use when the requested route is not found on server
app.get('*', function(req, res){
    res.status(404).send(' Resource Not Found ');
  });

  // host environment
  const myhost = process.env.HOST || 'localhost'

    // connect With HTTP and listen On Port 8080 or Available PORT
    http.listen(
        process.env.PORT || 3000,myhost,()=>{
        console.log("running on port 3000");
      })