const ProductServices = require("../services/product.services");

exports.addProduct = async (req, res, next) => {
  try {
    console.log(req);
    const savedProduct = await ProductServices.addProduct(req.body);
    res.status(200).json({ message: "Success", product: savedProduct });
    console.log("Product added:", savedProduct);
  } catch (err) {
    res
      .status(500)
      .json({ message: "Failed to add product", error: err.message });
    console.error("Error adding product:", err);
    next(err);
  }
};

exports.getProduct = async (req, res, next) => {};
