import "./Sidebar.css";
import SidebarContent from "./SidebarContent";
import { RxDashboard } from "react-icons/rx";
import { TbShoppingCartShare } from "react-icons/tb";
import { BsShop } from "react-icons/bs";
import { IoBagAddOutline } from "react-icons/io5";

interface Props {
  onSelectTab: (tab: string) => void;
}

const Sidebar = ({ onSelectTab }: Props) => {
  interface Tabs {
    icon: JSX.Element;
    label: string;
  }

  const tabs: Tabs[] = [
    { label: "Dashboard", icon: <RxDashboard /> },
    { label: "Orders", icon: <TbShoppingCartShare /> },
    { label: "Products", icon: <BsShop /> },
    { label: "Add Product", icon: <IoBagAddOutline /> },
  ];

  return (
    <div id="sidebar">
      <div className="header">Trend Wear</div>
      <ul id="sidebar-content">
        <SidebarContent tabsList={tabs} onSelectTab={onSelectTab} />
      </ul>
    </div>
  );
};

export default Sidebar;
