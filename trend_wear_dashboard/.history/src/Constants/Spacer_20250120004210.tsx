interface Props {
  height?: string;
  width?: string;
}

const Spacer = ({ height = "12px", width = "12px" }: Props) => {
  return <div style={{ height: height, width: width }}></div>;
};

export default Spacer;
