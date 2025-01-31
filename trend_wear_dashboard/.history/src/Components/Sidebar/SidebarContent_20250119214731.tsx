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
          <div>{tab.icon}</div>
          {tab.label}
        </li>
      ))}
    </>
  );
};

export default SidebarContent;
