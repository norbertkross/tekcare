module.exports = {
  /**
   * Get all drug orders
   * @param {*} dbConnection SQL Database Connection
   * @param {*} ordererId patient unique id
   */
  getAllOrders: (dbConnection, ordererId) => {
    dbConnection.connect(function (err) {
      if (err) throw err;
      dbConnection.query(
        "SELECT * FROM all_drug_orders WHERE id = ?",
        [ordererId],
        function (err, result) {
          if (err) throw err;

          console.log(`getAllOrders: ${result}`);
          return result;
        }
      );
    });
  },
};
