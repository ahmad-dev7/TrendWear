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

  static async getProducts(category, id) {
    try {
      // Initialize an empty filter object
      const filter = {};

      // Add conditions to the filter based on the parameters
      if (category) {
        // Match products whose `category` array contains the given category (case-insensitive)
        filter.category = { $regex: new RegExp(`^${category}$`, "i") };
      }
      if (id) {
        // Match products with the specified `_id`
        filter._id = id;
      }

      // Fetch products based on the filter
      const products = await ProductModel.find(filter);

      return products;
    } catch (err) {
      console.error("Error getting products:", err);
      throw err;
    }
  }
}

module.exports = ProductServices;
