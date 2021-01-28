const express = require("express")
const mysqlConnection = require("../mysql_connection/connections")
const verifyEmail = express.Router()


verifyEmail.get("/verifymail", (req, res) => {

    var email = req.query.email
    var code = req.query.code

    console.log(email, code);

    var query = `SELECT * FROM users WHERE verification_code='${code}' AND email='${email}'`
    mysqlConnection.query(query, (err, rows, cols) => {
        if (!err) {
            if (rows != null && rows.length > 0) {

                var dbCode = rows[0].verification_code;
                if (code.toString() == dbCode.toString()) {
                    var updateQuery = `UPDATE users SET email_verified='1' WHERE email='${email}'`
                    mysqlConnection.query(updateQuery, (err, rows, cols) => {})
                    res.send("<h1><br></br><br> <center>Verification Successful</center> </br></h1>")

                } else {
                    res.send("<h1><br></br><br> <center> Invalid verification Code</center></br></h1>")
                }

            } else {
                console.log(`More or less rows ${rows.length}`);
                res.send("<h1><br></br><br> <center> Invalid verification Code </center> </br></h1>")
            }
        } else {
            console.log(`SELECTION error ${err}`);
            res.send("<h1><br></br><br>A problem Occured</br></h1>")
        }
    })
})

module.exports = verifyEmail