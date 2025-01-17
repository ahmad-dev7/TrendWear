const ProductServices = require("../services/product.services");

exports.addProduct = async (req, res, next) => {
  try {
    console.log(req);
    const productData = await ProductServices.addProduct(req.body);
    ProductServices.addProduct(productData)
      .then((savedProduct) => {
        res.status(200).json({ message: "Success" });
        return console.log("Product added:", savedProduct);
      })
      .catch(function (err) {
        res.status(201).json({ message: "Failed to add product" });
        return console.error("Error adding product:", err);
      });
  } catch (error) {
    next(error);
  }
};
