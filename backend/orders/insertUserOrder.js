const express = require('express');
const mysqlConnection = require("../mysql_connection/connections")
const insertUserOrder = express.Router();

insertUserOrder.post("/order", (req, res) => {
    const orderer_id = req.query.orderer_id;
    const price = req.query.price;
    const name = req.query.name;
    const prescription = req.query.prescription;

    mysqlConnection.query(
        `INSERT INTO
        all_drug_orders(orderer_id, name, price, prescription)  
        VALUES("${orderer_id}",  "${name}", "${price}", "${prescription}" )
        `,
        (err, rows, cols) => {
            if (err) {
                res.status(400).send({msg: "failed to insert order"});
            } else {
                res.send({msg: "successful"});
            }
        }
    )
})

module.exports = insertUserOrder;