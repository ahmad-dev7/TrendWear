const Sidebar = () => {
  return (
    <div id="sidebar">
      <div className="header"></div>
      {/* <hr /> */}
      <ul className="sidebar-content">
        <li className="side-bar-tab">Dashboard</li>
        <li className="side-bar-tab">Orders</li>
        <li className="side-bar-tab">Products</li>
        <li className="side-bar-tab">Add Product</li>
      </ul>
    </div>
  );
};

export default Sidebar;
