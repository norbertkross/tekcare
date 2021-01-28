const nodemailer = require("nodemailer")


var sendVerificationMail = function(verificationUrl, userEmail, theusername) {
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



    //rentersparadise6@gmail.com
    //owiulyyijykxiywr

    //ekyeremeh7@gmail.com
    //jsturwesaijlviqw

    // Send email containing HTML:
    var mailOptions = {
        from: 'ekyeremeh7@gmail.com',
        to: userEmail,
        subject: 'Email verification - TekCare Application',
        text: 'That was Easy !!',
        html: `<b> Hello ${theusername} !! </b><br>Please, verify your Email to continue to the next step<br/>
        <a href="${verificationUrl}">Verify Email Here</a>`,

    }


    transporter.sendMail(mailOptions, function(error, info) {
        if (error) {
            console.log(`
                THE ERR: ${ error }
                `);
            //res.send("Bad State");
        } else {
            //res.send("OKAY")
            console.log('Email sent: ' + info.response);
            transporter.close();
        }
    });



}

module.exports = sendVerificationMail