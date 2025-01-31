import "./ProductDetailSection.css";

interface Props {
  children: React.ReactNode;
}

const DetailsSectionContainer = ({ children }: Props) => {
  return (
    <div className="details-section-container">
      {children}
      {/* <p className="title">Title</p>
      <input className="title-input" type="text" />
      <Spacer height="24px" />
      <p className="description">Description</p>
      <textarea className="description-input" /> */}
    </div>
  );
};

export default DetailsSectionContainer;
