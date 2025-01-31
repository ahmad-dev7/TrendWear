import "./ProductDetails.css";
import Spacer from "../../Constants/Spacer";
import DetailsSectionContainer from "../../Constants/ProductDetailSection/DetailsSectionContainer";
import LabeledInputField from "../../Constants/LabeledInputField/LabeledInputField";
import LabeledTextArea from "../../Constants/LabeledInputField/LabeledTextarea";
import AddImage from "../../Constants/AddImage/AddImage";

const ProductDetails = () => {
  return (
    <>
      <div className="product-detail-container">
        <DetailsSectionContainer heading="Base Information">
          <LabeledInputField>Title</LabeledInputField>
          <Spacer height="24px" />
          <LabeledTextArea>Description</LabeledTextArea>
        </DetailsSectionContainer>
        <Spacer height="24px" />

        <DetailsSectionContainer heading="Pictures">
          <AddImage />
          {/* <div className="picture-container-parent">
            <div className="img-container"></div>
            <div className="img-container"></div>
            <div className="img-container"></div>
            <div className="img-container add-more">Add Image</div>
          </div> */}
        </DetailsSectionContainer>
      </div>
    </>
  );
};

export default ProductDetails;
