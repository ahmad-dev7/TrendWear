import "./Sidebar.css";
import { useState } from "react";
import { RxDashboard } from "react-icons/rx";
interface Props {
  tabs: string[];
  onSelectTab: (tab: string) => void;
}

const SidebarContent = ({ tabs, onSelectTab }: Props) => {
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
          <RxDashboard></RxDashboard> {tab}
        </li>
      ))}
    </>
  );
};

export default SidebarContent;
