import "./ProductDetails.css";
import Spacer from "../../Constants/Spacer";

const ProductDetails = () => {
  return (
    <div className="product-detail-container">
      <p className="heading">Base Information</p>
      <Spacer height="12px" />
      <div className="container">
        <p className="title">Title</p>
        <input placeholder="Title" type="text" />
        <Spacer height="24px" />
        <p className="description">Description</p>
        <input placeholder="Description" type="text" />
      </div>
    </div>
  );
};

export default ProductDetails;
