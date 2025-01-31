const Sidebar = () => {
  return (
    <div id="sidebar">
      <div className="header">Trend Wear</div>
      <hr />
      <ul id="sidebar-content">
        <li className="tab active">
          <a onClick={() => console.log("hello world")} href="/">
            Dashboard
          </a>
        </li>
        <li className="tab">Orders</li>
        <li className="tab">Products</li>
        <li className="tab">Add Product</li>
      </ul>
    </div>
  );
};

export default Sidebar;
