module.exports = {
  /**
   * Get all Medical Information concerning a patient
   * @param {*} dbConnection SQL Database Connection
   * @param {*} userId Patient Id
   */
  getAllUserMedicalInfo: (dbConnection, userId) => {
    dbConnection.connect(function (err) {
      if (err) throw err;
      dbConnection.query(
        "SELECT * FROM medical_Info WHERE patient_id = ?",
        [userId],
        function (err, result) {
          if (err) throw err;

          console.log(`getAllUserMedicalInfo: ${result}`);
          return result;
        }
      );
    });
  },
};
