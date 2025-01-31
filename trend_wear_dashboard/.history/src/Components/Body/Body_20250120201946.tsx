// Body.tsx
import AddProduct from "../AddProduct/AddProduct";
import Dashboard from "../Dashboard/Dashboard";
import "./Body.css";

interface Props {
  activeBody: string;
}

const Body = ({ activeBody }: Props) => {
  return (
    <div id="body-content">
      {activeBody === "Dashboard" && <Dashboard />}
      {activeBody === "Add Product" && <AddProduct />}
    </div>
  );
};

export default Body;
