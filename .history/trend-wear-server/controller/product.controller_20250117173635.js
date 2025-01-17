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

exports.getProducts = async (req, res, next) => {
  const { category, id } = req.query;
  try {
    const products = await ProductServices.getProducts();
    if (!products || products.length === 0) {
      res.status(404).json({ message: "No products found" });
    } else {
      res.status(200).json({ message: "Success", products });
    }
  } catch (err) {
    res
      .status(500)
      .json({ message: "Failed to get products", error: err.message });
    console.error("Error getting products:", err);
    next(err);
  }
};
