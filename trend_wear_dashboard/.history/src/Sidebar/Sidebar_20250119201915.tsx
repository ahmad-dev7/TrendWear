import "./Sidebar.css";
import SidebarContent from "./SidebarContent";

interface Props {
  onSelectTab: (tab: string) => void;
}

const Sidebar = ({ onSelectTab }: Props) => {
  var tabs = ["Dashboard", "Orders", "Products", "Add Product"];

  return (
    <div id="sidebar">
      <div className="header">Trend Wear</div>
      <ul id="sidebar-content">
        <SidebarContent tabs={tabs} onSelectTab={onSelectTab} />
      </ul>
    </div>
  );
};

export default Sidebar;
