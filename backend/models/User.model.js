const mongoose = require("mongoose");
const isEmail = require("validator/lib/isEmail.js");
const bcrypt = require("bcrypt");

const Schema = mongoose.Schema;

// create user schema
const userSchema = Schema({
  name: String,
  email: {
    type: String,
    unique: true,
    required: true,
    validate: [isEmail, "No valid email address provided."],
  },
  password: {
    type: String,
    required: true,
    allowNull: false,
    minlength: 7,
    maxlength: 42,
    select: false,
  },
  contact: String,
  userType: {
    type: String,
    enum: ["STUDENT", "STAFF", "DOCTOR"],
    default: "STUDENT",
  },
  imageUrl: String,
  joinedDate: {
    type: Date,
    default: Date.now,
  },
});

// generate hashed password before save
userSchema.pre("save", async function (next) {
  try {
    // generate salt
    const salt = await bcrypt.genSalt(10);
    // generate a password hash -> [ salt + hash ]
    const passwordHash = await bcrypt.hash(this.password, salt);
    // re-assigned hashed password over original plain text password
    this.password = passwordHash;
    next();
  } catch (error) {
    next(error);
  }
});

// checks if password is valid and is matching saved password in db
userSchema.methods.isValidPassword = function (newPassword) {
  try {
    return bcrypt.compare(newPassword, this.password);
  } catch (error) {
    throw new Error(error);
  }
};

module.exports = mongoose.model("User", userSchema);
