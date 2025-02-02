const express = require("express");
const body_parser = require("body-parser");
const userRouter = require("./routers/user.route");
const productRouter = require("./routers/product.route");

const app = express();

app.use(body_parser.json());

app.use("/", userRouter);

app.use("/", productRouter);

module.exports = app;
