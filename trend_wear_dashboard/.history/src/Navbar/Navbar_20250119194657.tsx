import "./Navbar.css";

const Navbar = () => {
  return (
    <div>
      <div id="top-navbar">
        <div className="nav-item add-product-button">Add Product</div>
        <input className="nav-item" placeholder="Search" type="text" />
        <img
          src="/public/bell-icon.png"
          alt="Alerts icon"
          className="nav-item icon"
        />
      </div>
      <div id="content-body"></div>
    </div>
  );
};

export default Navbar;
