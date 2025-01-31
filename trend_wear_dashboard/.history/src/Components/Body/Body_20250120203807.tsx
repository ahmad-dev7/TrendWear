// Body.tsx
import { useState } from "react";
import "./Body.css";

interface Props {
  children: React.ReactNode;
}

var [activeBody, setBody] = useState("Dashboard");

const Body = ({ children }: Props) => {
  return <div id="body-content">{children}</div>;
};

export default Body;
