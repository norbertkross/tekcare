var nodemailer = require('nodemailer');


var transporter = nodemailer.createTransport({
    host: 'smtp.gmail.com',
    port: '587',
    //secure: true,
    pool: true,
    //service: 'gmail',
    auth: {
        user: 'ekyeremeh7@gmail.com', // change to their email 
        pass: "jsturwesaijlviqw" //google-app-sign-in-email password 
    },
    //secureConnection: 'false',
    tls: {
        rejectUnauthorized: false
    }
});




var sendPassCode = function(userEmail, theusername, vefCode) {
    console.log("sending email...");

    // Send email containing HTML:
    var mailOptions = {
        from: 'ekyeremeh7@gmail.com',
        to: userEmail,
        subject: 'Request To Reset Password For You Account - TekCare Application',
        html: `<b> Hello ${theusername} !! </b><br>Please, Click on the link below to reset your Password<br/>
        <a href="${vefCode}">Reset Password Here</a>`,
    }

    transporter.sendMail(mailOptions, function(error, info) {
        if (error) {
            console.log(`THE ERR: ${error}`);
            //res.send("Bad State");
        } else {
            //res.send("OKAY")
            console.log('Email sent: ' + info.response);
        }
    });

}



module.exports = sendPassCode