const express = require("express");
const mysqlConnection = require("../mysql_connection/connections");
const encryptor = require("../authentication/EncryptDecrypt/encrypt");
const loginRouter = express.Router();

loginRouter.post("/login", (req, res) => {

    var emailname = req.query.emailname
    var passwordRaw = req.query.password

    // Encrypt Password
    var password = encryptor(passwordRaw.toString())

    // Query to get all users  
    var validate = `SELECT id AS rid,name,email AS characters,profile_image,email_verified FROM users WHERE password ='${password}' AND (name='${emailname}' OR email='${emailname}')`;

    mysqlConnection.query(validate, (err, rows, cols) => {
        if (!err) {
            if (rows.length > 0) {
                res.send(rows)
            } else {
                res.send({ "msg": "username and or password is wrong" })
            }
        } else {
            res.send({ "msg": "username and or password is wrong" })
        }
    })

})


module.exports = loginRouter