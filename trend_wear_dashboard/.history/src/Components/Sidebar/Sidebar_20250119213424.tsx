import "./Sidebar.css";
import SidebarContent from "./SidebarContent";
import { RxDashboard } from "react-icons/rx";
import { TbShoppingCartShare } from "react-icons/tb";
import { BsShop } from "react-icons/bs";
import { IoBagAddOutline } from "react-icons/io5";
import { IconType } from "react-icons";

interface Props {
  onSelectTab: (tab: string) => void;
}

const Sidebar = ({ onSelectTab }: Props) => {
  interface Tabs {
    icon: IconType;
    label: string;
  }

  var tabs = ["Dashboard", "Orders", "Products", "Add Product"];
  var tabsIcons = [
    <RxDashboard />,
    <TbShoppingCartShare />,
    <BsShop />,
    <IoBagAddOutline />,
  ];

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
