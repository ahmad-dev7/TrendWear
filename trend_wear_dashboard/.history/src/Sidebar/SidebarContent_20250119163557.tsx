import "./Sidebar.css";
import { useState } from "react";

const SidebarContent = () => {
  var tabs = ["Dashboard", "Orders", "Products", "Add Product"];
  var activeTab = tabs[0];

  const [active, setTab] = useState("Dashboard");

  function changeTab(clickedTab: string) {
    // setText((prevText) => (prevText === "Hello" ? "Goodbye" : "Hello"));
    setTab(() => (activeTab = clickedTab));
  }

  return (
    <>
      {tabs.map((tab) => (
        <li
          key={tab}
          className={"tab " + (activeTab == tab && "active")}
          onClick={() => changeTab(tab)}
        >
          {tab}
        </li>
      ))}
      {/* <li className="tab active">Dashboard</li>
      <li className="tab">Orders</li>
      <li className="tab">Products</li>
      <li className="tab">Add Product</li> */}
    </>
  );
};

export default SidebarContent;
