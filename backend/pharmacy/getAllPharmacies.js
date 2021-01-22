const express = require('express');
const mysqlConnection = require("../mysql_connection/connections")
const allPharmacies = express.Router();

allPharmacies.get("/all_pharmacies", (req, res) => {
    mysqlConnection.query(
        "SELECT * FROM all_pharmacies ORDER BY id",
        (err, rows, cols) => {
            if (err) {
                res.status(400).send({msg: "Failed to fetch pharmacies"});
            } else {
                res.status(200).send(rows);
            }
        }
    )
});

module.exports = allDoctors;