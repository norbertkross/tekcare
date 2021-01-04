const express = require("express");
const router = express.Router();

const mysqlConnection = require("../mysql_connection/connections");

const { getAllOrders } = require("./api/OrdersAPI.js");

// get all orders by ordererId
router.get("/orders", async (req, res) => {
  const { ordererId } = req.params;

  try {
    const orders = getAllOrders(mysqlConnection, ordererId);
    res.json(orders);
  } catch (err) {
    res.status(500).json({
      message: err,
    });
  }
});

module.exports = router;
