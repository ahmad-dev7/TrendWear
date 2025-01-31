import AddProduct from "../AddProduct/AddProduct";
import Dashboard from "../Dashboard/Dashboard";
import "./Body.css";

interface Props {
  activeBody: string;
}

const Body = ({ activeBody }: Props) => {
  return (
    <div id="body-content">
      <div className={activeBody === "Dashboard" ? "active" : ""}>
        <Dashboard />
      </div>
      <div className={activeBody === "Add Product" ? "active" : ""}>
        <AddProduct />
      </div>
    </div>
  );
};

export default Body;
