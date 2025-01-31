import Dashboard from "./Body/Dashboard";
import Navbar from "./Navbar/Navbar";
import Sidebar from "./Sidebar/Sidebar";

function App() {
  return (
    <div id="parent">
      <Sidebar />
      <div style={{ flex: 1 }}>
        <Navbar />
        <Dashboard title="Hello Home" />
        <Dashboard title="Hello Dash" />
        <Dashboard title="Hello Ahmad" />
      </div>
    </div>
  );
}

export default App;
