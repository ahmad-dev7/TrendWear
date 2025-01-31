import { useState } from "react";
import Dashboard from "./Body/Dashboard";
import Navbar from "./Navbar/Navbar";
import Sidebar from "./Sidebar/Sidebar";

function App() {
  const [body, setBody] = useState("Dashboard");

  return (
    <div id="parent">
      <Sidebar onSelectTab={setBody} />
      <div style={{ flex: 1 }}>
        <Navbar />
        <Dashboard>Hello</Dashboard>
      </div>
    </div>
  );
}

export default App;
