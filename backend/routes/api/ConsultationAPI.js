module.exports = {
  /**
   * Get all Consultations
   * @param {*} dbConnection SQL Database Connection
   * @param {*} userId patient unique id
   */
  getAllConsultations: (dbConnection, userId) => {
    dbConnection.connect(function (err) {
      if (err) throw err;
      dbConnection.query(
        "SELECT * FROM consultation WHERE id = ?",
        [userId],
        function (err, result) {
          if (err) throw err;

          console.log(`getAllConsultations: ${result}`);
          return result;
        }
      );
    });
  },
  /**
   * insert into consultation table
   * @param {*} dbConnection SQL Database Connection
   * @param {*} consultationData an object of consulation data
   */
  addConsultation: (dbConnection, consultationData) => {
    // TODO: destructure consultationData and pass it as params

    dbConnection.connect(function (err) {
      if (err) throw err;
      dbConnection.query(
        "INSERT INTO consultation VALUES(?,?,?)",
        [consultationData],
        function (err, result) {
          if (err) throw err;

          console.log(`addConsultation: ${result.affectedRows}`);
          return result.affectedRows;
        }
      );
    });
  },
};
