const Sidebar = () => {
  return (
    <div id="sidebar">
      <div className="header">Trend Wear</div>
      <hr />
      <ul id="sidebar-content">
        <li
          className="tab active"
          onClick={() => console.log("Clicked on Dashboard")}
        >
          Dashboard
        </li>
        <li className="tab">Orders</li>
        <li className="tab">Products</li>
        <li className="tab">Add Product</li>
        <button onClick={() => console.log("Hello world")}>Click me</button>
      </ul>
    </div>
  );
};

export default Sidebar;
