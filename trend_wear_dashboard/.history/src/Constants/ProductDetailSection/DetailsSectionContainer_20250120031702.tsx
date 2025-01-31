import "./ProductDetailSection.css";

interface Props {
  children: React.ReactNode;
  heading: string;
}

const DetailsSectionContainer = ({ children, heading }: Props) => {
  return (
    <>
      <p className="details-section-container-heading">{heading}</p>
      <div className="details-section-container">{children}</div>
    </>
  );
};

export default DetailsSectionContainer;
