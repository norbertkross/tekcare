var express = require("express");
var app = express();
const http = require("http").createServer(app);

// const loginRouter = require('./requests/auth/normal_user/login_user');
const doctorsRoute = require("./routes/doctors");
const labsRoute = require("./routes/labs");
const medicalInfoRoute = require("./routes/medicalInfo");
const consultationRoute = require("./routes/consultation");

app.get("/", function (req, res) {
  res.send("<center><h2>WELCOME TO <h1>TEKCARE</h1></h2></center>");
});

// ########### use Custom routes########### //

//app.use(loginRouter) // loginRouter was imported in the comment aboove
app.use(doctorsRoute);
app.use(labsRoute);
app.use(medicalInfoRoute);
app.use(consultationRoute);

// Route to use when the requested route is not found on server
app.get("*", function (req, res) {
  res.status(404).send(" Resource Not Found ");
});

// host environment
const myhost = process.env.HOST || "localhost";

// connect With HTTP and listen On Port 8080 or Available PORT
http.listen(process.env.PORT || 3000, myhost, () => {
  console.log("running on port 3000");
});
