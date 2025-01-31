import "./Navbar.css";

const Navbar = () => {
  return (
    <div>
      <div id="top-navbar">
        <div className="nav-item add-product-button">Add Product</div>
        <input className="nav-item" placeholder="Search"></input>
        <img
          src="/public/bell-icon.png"
          alt="Alerts icon"
          className="icon nav-item"
        />
      </div>
      <div id="content-body"></div>
    </div>
  );
};

export default Navbar;
