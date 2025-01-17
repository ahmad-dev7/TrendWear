// const mongoose = require("mongoose");
// const db = require("../config/db");
// const UserModel = require("../model/user.model");
// const { Schema } = mongoose;

// const cartSchema = new Schema({
//   userId: {
//     type: Schema.Types.ObjectId,
//     ref: UserModel.modelName,
//   },
//   items: [
//     {
//       productId: {
//         type: Schema.Types.ObjectId,
//         ref: "Product",
//         required: true,
//       },
//       quantity: {
//         type: Number,
//         required: true,
//         default: 1,
//       },
//     },
//   ],
//   createdAt: {
//     type: Date,
//     default: Date.now,
//   },
// });
