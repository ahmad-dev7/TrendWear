import { useState } from "react";
import Body from "./Components/Body/Body";
import Navbar from "./Components/Navbar/Navbar";
import Sidebar from "./Components/Sidebar/Sidebar";
import AddProducts from "./Components/AddProduct/AddProduct";
import Dashboard from "./Components/Dashboard/Dashboard";
//import Dashboard from "./Components/Dashboard/Dashboard";

function App() {
  const [body, setBody] = useState("Dashboard");

  console.log(body);

  return (
    <div id="parent">
      <Sidebar onSelectTab={setBody} />
      <div style={{ flex: 1 }}>
        <Navbar />
        {body === "Dashboard" && <Body activeBody={"Dashboard"}></Body>}
        {body === "Add Product" && <Body activeBody={"Add Product"}></Body>}
      </div>
    </div>
  );
}

export default App;
