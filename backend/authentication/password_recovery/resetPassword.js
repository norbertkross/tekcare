const express = require("express")
const mysqlConnection = require("../../mysql_connection/connections")
const encryptor = require("../EncryptDecrypt/encrypt");
const sendPassCode = require("./sendPassCode")
const resetPassword = express.Router()


resetPassword.post("/resetpassword", (req, res) => {
    var rand = randomAlphaNumeric(6)

    //Take email and password and encrypte the password
    //Compare email to the one existing in the database.
    //If email exists in the database change the user password to the new one that was input by the user

    const { email, password } = req.body;

    // Encrypt Password
    var encryptedPassword = encryptor(password.toString())

    //var email = req.query.email

    // AND email_verified='1'

    var query = `SELECT * FROM users WHERE email='${email}' `
    mysqlConnection.query(query, (err, rows, cols) => {
        if (!err) {
            if (rows != null && rows.length > 0) {

                if (rows[0].email_verified == 1) {
                    console.log("row verified === 1");

                    var updatePassword = `UPDATE users 
                    SET password='${encryptedPassword}'
                    WHERE email='${email}'`


                    mysqlConnection.query(updatePassword, (err, rows, cols) => {
                        if (!err) {
                            res.send("PASSWORD_RESET_SUCCESSFUL");
                        } else {
                            res.send("PASSWORD_RESET_FAILED");
                        }
                    })
                } else {

                    //console.log("row not verified, updating ...");
                    res.send("USER_EXISTS_BUT_EMAIL_IS_NOT_VERIFIED");
                    // send email Verification
                    // sendVerificationMail(verificationUrl, email, name)
                    // sendVerificationMail

                }


            } else {
                //res.send({ "msg": "email not verified" })
                res.send("USER_DOESN'T_EXISTS");
            }
        } else {
            res.send({ "msg": "an error Occurred" })
        }
    })
})


function randomAlphaNumeric(length) {
    var result = '';
    var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_-=+[{]}?';
    var charactersLength = characters.length;
    for (var i = 0; i < length; i++) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
}

module.exports = resetPassword