import "./ProductDetails.css";
import Spacer from "../../Constants/Spacer";
interface Props {
  className: string;
}
const ProductDetails = ({ className }: Props) => {
  return (
    <div className="parent">
      <p className="heading">Base Information</p>
      <Spacer height="25px" />
      <div>Hello</div>
    </div>
  );
};

export default ProductDetails;
