import "./Sidebar.css";
import SidebarContent from "./SidebarContent";

const Sidebar = () => {
  var tabs = ["Dashboard", "Orders", "Products", "Add Product"];

  const handleSelectTab = (tab: string) => {
    console.log(tab);
  };

  return (
    <div id="sidebar">
      <div className="header">Trend Wear</div>
      <ul id="sidebar-content">
        <SidebarContent tabs={tabs} onSelectTab={handleSelectTab} />
      </ul>
    </div>
  );
};

export default Sidebar;
