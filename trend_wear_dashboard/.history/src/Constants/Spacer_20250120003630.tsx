interface Props {
  height?: number;
  width?: number;
}

const Spacer = ({ height, width }: Props) => {
  return <div style={{ height: height, width: width }}></div>;
};

export default Spacer;
