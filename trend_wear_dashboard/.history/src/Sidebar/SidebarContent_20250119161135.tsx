import "./Sidebar.css";

const SidebarContent = () => {
  var persons: { [label: string]: [onClick: Function] } = {};
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
