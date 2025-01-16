const mongoose = require("mongoose");

const connection = mongoose
  .createConnection("mongodb://127.0.0.1:27017/trend-wear-db")
  .on("open", () => console.log("MongoDB connected"))
  .on("error", () => console.log("MongoDB connection failed"));

module.exports = connection;
