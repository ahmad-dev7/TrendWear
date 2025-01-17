const router = require("express").Router();
const ProductController = require("../controller/product.controller");

router.post("/addProduct", ProductController.addProduct);
router.get("/getProduct", ProductController.getProducts);

module.exports = router;
