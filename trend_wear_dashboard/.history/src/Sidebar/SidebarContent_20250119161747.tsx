import "./Sidebar.css";

interface Tab {
  label: string;
  action: Function;
}

const SidebarContent = () => {
  var tabs: [label: string, Partial<Tab>] = {
    home: { label: "Home", action: () => console.log("Home tab clicked") },
  };
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
