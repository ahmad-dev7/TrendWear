import "./ProductDetails.css";
import Spacer from "../../Constants/Spacer";
import DetailsSectionContainer from "../../Constants/ProductDetailSection/DetailsSectionContainer";
import LabeledInputField from "../../Constants/LabeledInputField/LabeledInputField";

const ProductDetails = () => {
  return (
    <>
      <div className="product-detail-container">
        <DetailsSectionContainer heading="Base Information">
          <LabeledInputField>Title</LabeledInputField>
          {/* <p className="title">Title</p>
          <input className="title-input" type="text" /> */}
          <Spacer height="24px" />
          <p className="description">Description</p>
          <textarea className="description-input" />
        </DetailsSectionContainer>
      </div>
    </>
  );
};

export default ProductDetails;
