import Navbar from "./Navbar/Navbar";
import Sidebar from "./Sidebar/Sidebar";

function App() {
  return (
    <div id="parent">
      <Sidebar />
      <div style={{ flex: 1 }}>
        <Navbar />
        <div id="content-body">{/* Main body content here */}</div>
      </div>
    </div>
  );
}

export default App;
