import "./AddProduct.css";
import ProductDetails from "./ProductDetails";
import ProductPreview from "./ProductPreview";
const AddProduct = () => {
  return (
    <div className="parent">
      <div className="child details-container">
        <ProductDetails />
      </div>

      <div className="child preview-container">
        <ProductPreview />
      </div>
    </div>
  );
};

export default AddProduct;
