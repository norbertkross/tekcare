const mongoose = require("mongoose");

const LabSchema = mongoose.Schema({
  patientId: Number,
  labReport: String,
  conclusion: String,
  dateTime: {
    type: Date,
    default: Date.now,
  },
});

module.exports = mongoose.model("Lab", LabSchema);
