const express = require('express');
const mysqlConnection = require("../mysql_connection/connections")
const getPharmacyDrugs = express.Router();

getPharmacyDrugs.get("/pharmacy/all_drugs", (req, res) => {
    const pharmacy_id = req.query.pharmacy_id;

    mysqlConnection.query(
        `SELECT * FROM all_drugs WHERE pharm_id = ${pharmacy_id}`,
        (err, rows, cols) => {
            if (err) {
                res.status(400).send({msg: "Error fetching drugs"});
            } else {
                res.status(200).send(rows);
            }
        }
    )
})