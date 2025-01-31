import "./Navbar.css";
import { FaRegBell } from "react-icons/fa6";

const Navbar = () => {
  return (
    <div>
      <div id="top-navbar">
        <div className="nav-item add-product-button">Add Product</div>
        <input className="nav-item" placeholder="Search" type="text" />
        <FaRegBell className="nav-item icon"></FaRegBell>
        {/* <img
          src="/public/bell-icon.png"
          alt="Alerts icon"
          className="nav-item icon"
        /> */}
      </div>
    </div>
  );
};

export default Navbar;
