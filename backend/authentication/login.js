const express = require("express");
const mysqlConnection = require("../mysql_connection/connections");
const encryptor = require("../authentication/EncryptDecrypt/encrypt");
const loginRouter = express.Router();
//const jwt = require('jsonwebtoken');

loginRouter.post("/login", (req, res) => {

    const { name, password } = req.body;

    // console.log(name, password);


    // Encrypt Password
    var encryptedPassword = encryptor(password.toString());

    //console.log(encryptedPassword);

    // Select The Verify if the Email does not already exist
    var verifyQuery = `SELECT * FROM users WHERE name='${name}' AND password ='${encryptedPassword}'`;


    mysqlConnection.query(verifyQuery, (err, rows, cols) => {
        if (!err) {
            if (rows.length > 0) {
                if (rows[0].email_verified == 1) {
                    console.log("User exist and is verified");
                    res.send([{
                        msg: "USER_EXISTS_AND_EMAIL_IS_VERIFIED",
                        id: rows[0].id,
                        name: rows[0].name,
                        email: rows[0].email,
                        profile_image: rows[0].profile_image,
                    }, ]);

                } else {
                    console.log("User exist but not verified");
                    res.send([{ msg: "USER_EXISTS_BUT_EMAIL_IS_NOT_VERIFIED" }]);
                }
            } else {
                console.log("User doesn't exist in the database");
                res.send([{ msg: "USER_DOESN'T_EXIST" }]);
            }
        } else {
            console.log("connection error");
        }
    });


});

module.exports = loginRouter;