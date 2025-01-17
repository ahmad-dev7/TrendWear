const ProductServices = require("../services/product.services");

exports.addProduct = async (req, res, next) => {
  try {
    console.log(req);
    const productData = await ProductServices.addProduct(req.body);
    ProductServices.addProduct(productData);
    res.status(200).json({ message: "Success" });
  } catch (error) {
    res.status(201).json({ message: error });
    next(error);
  }
};
