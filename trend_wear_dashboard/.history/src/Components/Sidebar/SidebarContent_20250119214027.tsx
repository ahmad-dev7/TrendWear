import "./Sidebar.css";
import { useState } from "react";
interface Props {
  tabsList: string[];
  onSelectTab: (tab: string) => void;
}

const SidebarContent = ({ tabsList, onSelectTab }: Props) => {
  const [active, setTab] = useState("Dashboard");
  return (
    <>
      {tabs.map((tab) => (
        <li
          key={tab}
          className={"tab " + (tab == active && "active")}
          onClick={() => {
            setTab(tab);
            onSelectTab(tab);
          }}
        >
          {tab}
        </li>
      ))}
    </>
  );
};

export default SidebarContent;
