import "./Navbar.css";

const Navbar = () => {
  return (
    <div id="top-navbar">
      <div className="nav-item add-product-button">Add Product</div>
      <input className="nav-item" placeholder="Search"></input>
      <img src="/public/bell-icon.png" className="nav-item">
        Item 3
      </img>
    </div>
  );
};

export default Navbar;
