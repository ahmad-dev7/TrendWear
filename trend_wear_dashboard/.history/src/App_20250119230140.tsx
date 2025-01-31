import { useState } from "react";
import Body from "./Components/Body/Body";
import Navbar from "./Components/Navbar/Navbar";
import Sidebar from "./Components/Sidebar/Sidebar";

function App() {
  const [body, setBody] = useState("Dashboard");

  return (
    <div id="parent">
      <Sidebar onSelectTab={setBody} />
      <div style={{ flex: 1 }}>
        <Navbar />
        <Body>{body}</Body>
      </div>
    </div>
  );
}

export default App;
