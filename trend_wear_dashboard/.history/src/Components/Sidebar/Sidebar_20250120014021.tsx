import "./Sidebar.css";
import SidebarContent from "./SidebarContent";
import { RxDashboard } from "react-icons/rx";
import { TbShoppingCartShare } from "react-icons/tb";
import { BsShop } from "react-icons/bs";
import { IoBagAddOutline } from "react-icons/io5";
import { useState } from "react";

interface Props {
  onSelectTab: (tab: string) => void;
}

const Sidebar = ({ onSelectTab }: Props) => {
  interface Tabs {
    icon: JSX.Element;
    label: string;
  }

  const tabs: Tabs[] = [
    { label: "Dashboard", icon: <RxDashboard size={20} /> },
    { label: "Orders", icon: <TbShoppingCartShare size={20} /> },
    { label: "Products", icon: <BsShop size={20} /> },
    { label: "Add Product", icon: <IoBagAddOutline size={20} /> },
  ];

  const [active, setTab] = useState("Dashboard");

  return (
    <div id="sidebar">
      <div className="header">Trend Wear</div>
      <ul id="sidebar-content">
        {tabs.map((tab) => (
          <li
            key={tab.label}
            className={"tab " + (tab.label == active && "active")}
            onClick={() => {
              setTab(tab.label);
              onSelectTab(tab.label);
            }}
          >
            <div className="icon">{tab.icon}</div>
            <div className="label">{tab.label}</div>
          </li>
        ))}
        {/* <SidebarContent tabsList={tabs} onSelectTab={onSelectTab} /> */}
      </ul>
    </div>
  );
};

export default Sidebar;
