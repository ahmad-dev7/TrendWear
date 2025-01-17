const ProductServices = require("../services/product.services");

exports.addProduct = async (req, res, next) => {
  try {
    console.log(req);
    const productData = await ProductServices.addProduct(req.body);
    res.status(200).json({ message: "Success" });
  } catch (error) {
    next(error);
  }
};