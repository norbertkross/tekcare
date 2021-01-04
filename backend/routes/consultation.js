const express = require("express");
const router = express.Router();

const mysqlConnection = require("../mysql_connection/connections");

const {
  addConsultation,
  getAllConsultations,
} = require("./api/ConsultationAPI.js");

// get all consultations by userid
router.get("/consultations", async (req, res) => {
  const { userId } = req.params;

  try {
    const consultations = getAllConsultations(mysqlConnection, userId);
    res.json(consultations);
  } catch (err) {
    res.status(500).json({
      message: err,
    });
  }
});

// insert into consultation table
router.post("addConsultation", async (req, res) => {
  const { consultationData } = req.params;

  try {
    const affectedRows = addConsultation(mysqlConnection, consultationData);
    res.json(affectedRows);
  } catch (err) {
    res.status(500).json({
      message: err,
    });
  }
});

module.exports = router;
