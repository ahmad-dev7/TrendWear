const mongoose = require("mongoose");
const db = require("../config/db");
const { Schema } = mongoose;

const productSchema = new Schema({
  // Name of the product [Printed Denim Jeans]
  name: {
    type: String,
    required: true,
  },
  // Description of the product [Printed Denim Jeans with a unique design]
  description: {
    type: String,
    required: true,
  },
  // Price of the product [₹400]
  price: {
    type: Number,
    required: true,
    min: 0,
  },
  // Images url {Required}, with color options {Optional}, [pink,https://example_img]
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
  // Sizes [28, 2] || [XL,4]
  size: [
    {
      size: {
        type: String,
        required: true,
      },
      stock: {
        type: Number,
        required: true,
        default: 0,
      },
    },
  ],
  // Brand of the product [Levis]
  brand: {
    name: {
      type: String,
      default: "Unknown",
    },
    logo: {
      type: String,
    },
  },
  // Category of the product [Jeans]
  category: [
    {
      type: String,
      required: true,
    },
  ],
});

const ProductModel = db.model("product", userSchema);

module.exports = ProductModel;
