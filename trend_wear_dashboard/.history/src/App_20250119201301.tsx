import Dashboard from "./Body/Dashboard";
import Navbar from "./Navbar/Navbar";
import Sidebar from "./Sidebar/Sidebar";

function App() {
  return (
    <div id="parent">
      <Sidebar />
      <div style={{ flex: 1 }}>
        <Navbar />
        <Dashboard title="Dashboard Title" />
      </div>
    </div>
  );
}

export default App;
