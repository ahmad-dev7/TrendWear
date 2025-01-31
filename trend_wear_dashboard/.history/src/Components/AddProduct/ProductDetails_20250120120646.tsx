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
        </DetailsSectionContainer>
        <Spacer height="24px" />
        <DetailsSectionContainer heading="Details">
          <LabeledInputField placeHolder="₹">Price</LabeledInputField>
          <Spacer height="24px" />
          <LabeledInputField>Size</LabeledInputField>
        </DetailsSectionContainer>

        <Spacer height="24px" />
        <DetailsSectionContainer heading="Brand">
          <LabeledInputField>Name</LabeledInputField>
          <Spacer height="24px" />
          <LabeledInputField>Logo Url</LabeledInputField>
        </DetailsSectionContainer>
        <Spacer height="24px" />
        <div id="add-product-button">Add Product</div>
      </div>
    </>
  );
};

export default ProductDetails;
