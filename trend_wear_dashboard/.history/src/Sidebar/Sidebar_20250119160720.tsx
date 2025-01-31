import "./Sidebar.css";
import SidebarContent from "./SidebarContent";

const Sidebar = () => {
  return (
    <div id="sidebar">
      <div className="header">Trend Wear</div>
      <hr />
      <ul id="sidebar-content">
        <SidebarContent />
      </ul>
    </div>
  );
};

export default Sidebar;
