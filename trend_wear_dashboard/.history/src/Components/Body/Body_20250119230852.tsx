import "./Body.css";

interface Props {
  children: React.ReactNode;
}

const Body = ({ children }: Props) => {
  return <div id="content-body">{children}</div>;
};

export default Body;
