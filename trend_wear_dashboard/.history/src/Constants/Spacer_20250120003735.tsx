interface Props {
  height?: number;
  width?: number;
}

const Spacer = ({ height = 12, width }: Props) => {
  return <div style={{ height: height + "px", width: width + "px" }}></div>;
};

export default Spacer;
