import "./ProductDetails.css";
import Spacer from "../../Constants/Spacer";
import DetailSectionContainer from "../../Constants/ProductDetailSection/DetailsSectionContainer";

const ProductDetails = () => {
  return (
    <>
      <div className="product-detail-container">
        <p className="heading">Base Information</p>
        <Spacer height="12px" />
        <div className="container">
          <p className="title">Title</p>
          <input className="title-input" type="text" />
          <Spacer height="24px" />
          <p className="description">Description</p>
          <textarea className="description-input" />
        </div>
      </div>
    </>
  );
};

export default ProductDetails;
