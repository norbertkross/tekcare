var express = require("express");
var app = express();
const http = require("http").createServer(app);

const readMSGRouter = require("./messages/readDRmessage.js");
const sendDRmessage = require("./messages/sendDRmessage.js");
const chatroom = require("./messages/getSpecifiqChatroom");
const allDoctors = require("./messages/getAllDoctors");
const sendFeedback = require("./feedback/insertFeedback.js");
const allPrescriptions = require("./feedback/all_prescription.js");
const addPrescriptions = require("./feedback/addPrescriptions.js");

// const loginRouter = require('./requests/auth/normal_user/login_user');
const doctorsRoute = require("./routes/doctors");
const labsRoute = require("./routes/labs");
const medicalInfoRoute = require("./routes/medicalInfo");
const consultationRoute = require("./routes/consultation");
const orderRoute = require("./routes/orders");
const registerRoute = require("./authentication/signUp");
const loginRoute = require("./authentication/login");
const verifyMail = require("./authentication/verifyEmail");
const resetPassword = require("./authentication/password_recovery/resetPassword");


//This takes the post body
app.use(express.json({ extended: false }));


app.get("/", function(req, res) {
    res.send("<center><h2>WELCOME TO <h1>TEKCARE</h1></h2></center>");
});


// ########### use Custom routes########### //

//app.use(loginRouter) // loginRouter was imported in the comment above
app.use(registerRoute);
app.use(loginRoute);
app.use(verifyMail);
app.use(resetPassword);
app.use(readMSGRouter);
app.use(sendDRmessage);
app.use(chatroom);
app.use(allDoctors);
app.use(sendFeedback);
app.use(allPrescriptions);
app.use(addPrescriptions);

app.use(doctorsRoute);
app.use(labsRoute);
app.use(medicalInfoRoute);

app.use(consultationRoute);
app.use(orderRoute);

// Route to use when the requested route is not found on server
app.get("*", function(req, res) {
    res.status(404).send(" Resource Not Found ");
});

// host environment
const myhost = process.env.HOST || "localhost";

// connect With HTTP and listen On Port 8080 or Available PORT
http.listen(process.env.PORT || 3000, myhost, () => {
    console.log("running on port 3000");
});