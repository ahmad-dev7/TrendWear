import { useState } from "react";
import Dashboard from "./Components/Body/Body";
import Navbar from "./Components/Navbar/Navbar";
import Sidebar from "./Components/Sidebar/Sidebar";

function App() {
  const [body, setBody] = useState("Dashboard");

  return (
    <div id="parent">
      <Sidebar onSelectTab={setBody} />
      <div style={{ flex: 1 }}>
        <Navbar />
        <Dashboard>{body}</Dashboard>
      </div>
    </div>
  );
}

export default App;
