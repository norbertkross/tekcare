const express = require("express");
const router = express.Router();

const mysqlConnection = require("../mysql_connection/connections");

const { getAllDoctors } = require("./api/DoctorAPI.js");

// get all medical Information
router.get("/doctors", async (req, res) => {
  const { userId } = req.params;

  try {
    const doctors = getAllDoctors(mysqlConnection, userId);
    res.json(doctors);
  } catch (err) {
    res.status(500).json({
      message: err,
    });
  }
});

module.exports = router;
