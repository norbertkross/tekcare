const mongoose = require("mongoose");

const MedicalInfoSchema = mongoose.Schema({
  patientId: Number,
  gender: String,
  bloodType: String,
  height: String,
  bloodPressure: String,
  dateTime: {
    type: Date,
    default: Date.now,
  },
});

module.exports = mongoose.model("MedicalInfo", MedicalInfoSchema);
