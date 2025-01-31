import "./Sidebar.css";
import { useState } from "react";

interface Props {
  tabs: string[];
  onSelectTab: (tab: string) => void;
}

const SidebarContent = () => {
  var tabs = ["Dashboard", "Orders", "Products", "Add Product"];
  const [active, setTab] = useState("Dashboard");
  return (
    <>
      {tabs.map((tab) => (
        <li
          key={tab}
          className={"tab " + (tab == active && "active")}
          onClick={() => setTab(tab)}
        >
          {tab}
        </li>
      ))}
    </>
  );
};

export default SidebarContent;
