import "./ProductDetails.css";
import Spacer from "../../Constants/Spacer";

const ProductDetails = () => {
  return (
    <div className="product-detail-container">
      <p className="heading">Base Information</p>
      <Spacer height="12px" />
      <div className="container">
        <p>Title</p>
      </div>
    </div>
  );
};

export default ProductDetails;
