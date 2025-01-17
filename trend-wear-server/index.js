const app = require("./app");
const db = require("./config/db");
const UserModel = require("./model/user.model");
const ProductModel = require("./model/product.model");

const port = 3000;

app.get("/", (req, res) => {
  res.send("Hello there, this is Ahmad");
});

app.listen(port, () => {
  console.log(`Server listening on port: ${port}`);
});
