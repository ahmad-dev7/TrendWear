import "./ProductDetailSection.css";

interface Props {
  children: React.ReactNode;
  heading: string;
}

const DetailsSectionContainer = ({ children, heading }: Props) => {
  return (
    <>
      <p id="details-section-container-heading">{heading}</p>
      <div id="details-section-container">{children}</div>
    </>
  );
};

export default DetailsSectionContainer;
