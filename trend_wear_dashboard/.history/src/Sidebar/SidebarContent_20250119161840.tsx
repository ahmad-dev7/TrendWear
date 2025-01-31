import "./Sidebar.css";

const SidebarContent = () => {
  var tabs = ["Dashboard", "Orders", "Products", "Add Product"];
  return (
    <>
      <li className="tab active">Dashboard</li>
      <li className="tab">Orders</li>
      <li className="tab">Products</li>
      <li className="tab">Add Product</li>
    </>
  );
};

export default SidebarContent;
