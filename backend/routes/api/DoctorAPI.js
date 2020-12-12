module.exports = {
  /**
   * Get all Doctors
   * @param {*} dbConnection SQL Database Connection
   * @param {*} userId doctor id
   */
  getAllDoctors: (dbConnection, userId) => {
    dbConnection.connect(function (err) {
      if (err) throw err;
      dbConnection.query(
        "SELECT * FROM users WHERE id = ?",
        [userId],
        function (err, result) {
          if (err) throw err;

          console.log(`getAllDoctors: ${result}`);
          return result;
        }
      );
    });
  },
};
