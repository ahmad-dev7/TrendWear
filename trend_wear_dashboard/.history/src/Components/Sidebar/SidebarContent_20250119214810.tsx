import "./Sidebar.css";
import { useState } from "react";

interface Tabs {
  icon: JSX.Element;
  label: string;
}

interface Props {
  tabsList: Tabs[];
  onSelectTab: (tab: string) => void;
}

const SidebarContent = ({ tabsList, onSelectTab }: Props) => {
  const [active, setTab] = useState("Dashboard");
  return (
    <>
      {tabsList.map((tab) => (
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
    </>
  );
};

export default SidebarContent;
