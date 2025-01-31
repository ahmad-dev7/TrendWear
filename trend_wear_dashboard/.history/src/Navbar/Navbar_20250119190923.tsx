import "./Navbar.css";

const Navbar = () => {
  return (
    <div id="top-navbar">
      <div className="nav-item add-product-button">Add Product</div>
      <input className="nav-item" placeholder="Search"></input>
      <div className="nav-item">Item 3</div>
    </div>
  );
};

export default Navbar;
