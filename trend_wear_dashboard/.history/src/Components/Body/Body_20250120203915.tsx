// Body.tsx
import { useState } from "react";
import "./Body.css";

interface Props {
  active: string;
  children: React.ReactNode;
}

var [activeBody, setBody] = useState("Dashboard");

const Body = ({ active }: Props) => {
  return <div id="body-content">{children}</div>;
};

export default Body;
