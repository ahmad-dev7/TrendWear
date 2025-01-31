interface Props {
  height?: string;
  width?: string;
}

const Spacer = ({ height = "0px", width = "0px" }: Props) => {
  return <div style={{ height: height, width: width }}></div>;
};

export default Spacer;
