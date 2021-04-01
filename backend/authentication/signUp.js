const express = require("express");
const encryptor = require("../authentication/EncryptDecrypt/encrypt");
//const sendVerificationCode = require("./send_email");
const sendVerificationMail = require("./send_email");
const mysqlConnection = require("../mysql_connection/connections");
const registerUserRoute = express.Router();
//var jwt = require("jsonwebtoken");

registerUserRoute.post("/register", (req, res) => {
    //const { name, email, passwordRaw } = req.body;

    // var name = req.query.name
    // var email = req.query.email
    // var password = req.query.password
    const { name, email, password } = req.body;

    // const user = { name: name, password: password, email: email };

    //console.log(user);
    console.log(email);
    console.log(password);
    console.log(name);



    // Encrypt Password
    //var password = encryptor(passwordRaw.toString())

    var encryptedPassword = encryptor(password.toString());

    //console.log(encryptedPassword);

    // Select The Verify if the Email does not already exist
    var verifyQuery = `SELECT * FROM users WHERE email='${email}' AND  name='${name}'`;

    // Random UID for verification Code
    var verificationMailCode = randomAlphaNumeric(6);

    // Verification Url
    var verificationUrl = `https://localhost:3000/verifymail?email=${email}&code=${verificationMailCode}`;

    // Add new user to database if user does not exist and user is not verified
    var insertUser = `INSERT INTO users(name,email,password,verification_code) 
     VALUES('${name}','${email}','${encryptedPassword}','${verificationMailCode}')`;


    var selectUser = `SELECT * FROM users WHERE email='${email}' AND  name='${name}'`;
    //var selectUser = `SELECT * FROM users WHERE name='${name}' AND password ='${encryptedPassword}'`;

    // Update the user name password and verification code if the email already exist,
    var updateTable = `UPDATE users SET name='${name}', password='${encryptedPassword}',verification_code='${verificationMailCode}'`;

    // Insert user into database
    mysqlConnection.query(verifyQuery, (err, rows, cols) => {
        if (rows) {
            if (rows[0].email_verified === 1) {
                console.log("row verified === 1");
                // res.send({ "msg": "user already exist", "id": id })
                res.send("USER_EXISTS_AND_IS_VERIFIED");
            } else {
                console.log("row not verified, updating ...");

                addUser(updateTable, res);

                // send email Verification
                sendVerificationMail(verificationUrl, email, name);
                // sendVerificationMail

                res.send("USER_EXISTS_BUT_NOT_VERIFIED");
            }
        } else {
            console.log("no user yet so added");





            addUser(insertUser, selectUser, res);



            // send email Verification
            sendVerificationMail(verificationUrl, email, name);


            //res.json({ accessToken: "74973889243b93a6d1833187df58861b5d411f9e9b3219b9c04392745d51d415cce164f26f2d84367dc47152b83b545b5870632123dc1830283d42b528760b5c" })
            // var token = jwt.sign({ user: user }, "password");
            // return res.json({ accessToken: token });
        }
    });
});

function randomAlphaNumeric(length) {
    var result = "";
    var characters =
        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    // !@#$%^&*()_-=+[{]}?
    var charactersLength = characters.length;
    for (var i = 0; i < length; i++) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
}

function addUser(insertQuery, selectUser, res) {

    mysqlConnection.query(insertQuery, (err, rows, cols) => {
        if (!err) {
            console.log("User successfully added to the database");
            selectUserDetails(selectUser, res);


        } else {
            var failedMessage = "Because of an Error User wasn't added to the database ";
            res.send(failedMessage);
        }
    });



};

function selectUserDetails(verifyQuery, res) {
    mysqlConnection.query(verifyQuery, (err, rows, cols) => {
        if (!err) {
            if (rows.length > 0) {
                console.log("Newly created user exist in the database");
                //res.send(rows);
                res.send([{
                    msg: "USER_CREATED_SUCCESSFULLY",
                    id: rows[0].id,
                    name: rows[0].name,
                    email: rows[0].email,
                    profile_image: rows[0].profile_image
                }, ]);
            } else {
                console.log("Newly created user doesn't exist in the database");
            }
        } else {
            console.log(err);
        }

    });
};

module.exports = registerUserRoute;