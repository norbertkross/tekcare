const express = require("express");
const router = express.Router();

const mysqlConnection = require("../mysql_connection/connections");

const { getAllUserMedicalInfo } = require("./api/MedicalInfoAPI.js");

// get all medical Information
router.get("/medicals", async (req, res) => {
  const { userId } = req.params;

  try {
    const medicalInfos = getAllUserMedicalInfo(mysqlConnection, userId);
    res.json(medicalInfos);
  } catch (err) {
    res.status(500).json({
      message: err,
    });
  }
});

module.exports = router;
