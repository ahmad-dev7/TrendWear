import "./Sidebar.css";
import { useState } from "react";

const SidebarContent = () => {
  var tabs = ["Dashboard", "Orders", "Products", "Add Product"];
  const [active, setTab] = useState("Dashboard");

  function changeTab(clickedTab: string) {
    // setText((prevText) => (prevText === "Hello" ? "Goodbye" : "Hello"));
    setTab(() => clickedTab);
  }

  return (
    <>
      {tabs.map((tab) => (
        <li
          key={tab}
          className={"tab " + (active == tab && "active")}
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
