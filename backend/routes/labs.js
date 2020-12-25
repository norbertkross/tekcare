const express = require("express");
const router = express.Router();

const mysqlConnection = require("../mysql_connection/connections");

const { getAllUserLabsInfo } = require("./api/LabAPI.js");

// get all labs information
router.get("/:userId", async (req, res) => {
  const { userId } = req.params;

  try {
    const labs = getAllUserLabsInfo(mysqlConnection, userId);
    res.json(labs);
  } catch (err) {
    res.status(500).json({
      message: err,
    });
  }
});

module.exports = router;
