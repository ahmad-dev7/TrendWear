import "./Navbar.css";
import { FaRegBell } from "react-icons/fa6";

const Navbar = () => {
  return (
    <div id="nav-layout">
      <div id="top-navbar">
        <div className="nav-item add-product-button">Add Product</div>
        <input className="nav-item" placeholder="Search" type="text" />
        <FaRegBell className="nav-item icon"></FaRegBell>
      </div>
    </div>
  );
};

export default Navbar;
