import "./ProductDetails.css";
import Spacer from "../../Constants/Spacer";

const ProductDetails = () => {
  return (
    <div className="product-detail-container">
      <p className="heading">Base Information</p>
      <Spacer height="12px" />
      <div className="container">
        <p>Title</p>
        <input type="text" />
        <Spacer height="12px" />
        <p>Description</p>
        <input type="text" />
      </div>
    </div>
  );
};

export default ProductDetails;
