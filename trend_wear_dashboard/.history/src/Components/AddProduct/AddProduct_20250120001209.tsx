import "./AddProduct.css";
import ProductDetails from "./ProductDetails";
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
