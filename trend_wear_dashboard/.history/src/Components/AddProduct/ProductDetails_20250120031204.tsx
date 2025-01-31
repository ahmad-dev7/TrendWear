import "./ProductDetails.css";
import Spacer from "../../Constants/Spacer";
import DetailsSectionContainer from "../../Constants/ProductDetailSection/DetailsSectionContainer";

const ProductDetails = () => {
  return (
    <>
      <div className="product-detail-container">
        <DetailsSectionContainer heading="Base Information">
          <p className="title">Title</p>
          <input className="title-input" type="text" />
          <Spacer height="24px" />
          <p className="description">Description</p>
          <textarea className="description-input" />
        </DetailsSectionContainer>
        {/* <p className="heading">Base Information</p>
        <Spacer height="12px" />
        <div className="container"></div> */}
      </div>
    </>
  );
};

export default ProductDetails;
