// Body.tsx
import { useState } from "react";
import "./Body.css";
import Dashboard from "../Dashboard/Dashboard";
import AddProduct from "../AddProduct/AddProduct";

interface Props {
  active: string;
  // children: React.ReactNode;
}

var [activeBody, setBody] = useState("Dashboard");

const Body = ({ active }: Props) => {
  setBody(active);
  return (
    <div id="body-content">
      {activeBody === "Dashboard" ? <Dashboard /> : <AddProduct />}
    </div>
  );
};

export default Body;
