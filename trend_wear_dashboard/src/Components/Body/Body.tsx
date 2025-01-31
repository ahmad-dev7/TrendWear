// Body.tsx
import "./Body.css";

interface Props {
  children: React.ReactNode;
}

const Body = ({ children }: Props) => {
  return <div id="body-content">{children}</div>;
};

export default Body;
