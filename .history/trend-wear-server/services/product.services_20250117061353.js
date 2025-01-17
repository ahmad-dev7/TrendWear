const ProductModel = require("../model/product.model");

class ProductServices {
  static async addProduct(productData) {
    const product = new ProductModel({
      name: productData.name,
      description: productData.description,
      price: productData.price,
      images: productData.images,
      size: productData.size,
      brand: productData.brand,
      category: productData.category,
    });
    return await product.save();
  }
}

module.exports = ProductServices;
