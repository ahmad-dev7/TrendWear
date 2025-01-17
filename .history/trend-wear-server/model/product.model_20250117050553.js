const mongoose = require("mongoose");
const db = require("../config/db");
const { Schema } = mongoose;

const productSchema = new Schema({
  name: {
    type: String,
    required: true,
  },
  price: {
    type: Number,
    required: true,
  },
  description: {
    type: String,
    required: true,
  },
  images: [
    {
      color: {
        type: String,
      },
      url: {
        type: String,
        required: true,
      },
    },
  ],
  size: [
    {
      size: {
        type: String,
        required: true,
      },
    },
  ],
});
