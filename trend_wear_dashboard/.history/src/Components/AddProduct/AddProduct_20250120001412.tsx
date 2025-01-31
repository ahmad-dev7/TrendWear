import "./AddProduct.css";
import ProductDetails from "./ProductDetails";
import ProductPreview from "./ProductPreview";
const AddProduct = () => {
  return (
    <div className="parent">
      <div className="child">
        <ProductDetails />
      </div>

      <div className="child ">Child 2</div>
    </div>
  );
};

export default AddProduct;
