module.exports = {
  /**
   * Get all Labs concerning a patient
   * @param {*} dbConnection SQL Database Connection
   * @param {*} userId Patient Id
   */
  getAllUserLabsInfo: (dbConnection, userId) => {
    dbConnection.connect(function (err) {
      if (err) throw err;
      dbConnection.query(
        "SELECT * FROM labs WHERE patient_id = ?",
        [userId],
        function (err, result) {
          if (err) throw err;

          console.log(`getAllUserLabsInfo: ${result}`);
          return result;
        }
      );
    });
  },
};
