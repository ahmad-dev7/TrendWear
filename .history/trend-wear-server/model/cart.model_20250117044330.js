const mongoose = require("mongoose");
const db = require("../config/db");
const UserModel = require("../model/user.model");
const { Schema } = mongoose;

const cartSchema = new Schema({
  userId: {
    type: Schema.Types.ObjectId,
    ref: UserModel.modelName,
  },
});
