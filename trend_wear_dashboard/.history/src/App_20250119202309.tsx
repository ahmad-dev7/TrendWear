import Dashboard from "./Body/Dashboard";
import Navbar from "./Navbar/Navbar";
import Sidebar from "./Sidebar/Sidebar";

function App() {
  var currentTab = "Dashboard";
  return (
    <div id="parent">
      <Sidebar onSelectTab={(value) => (currentTab = value)} />
      <div style={{ flex: 1 }}>
        <Navbar />
        <Dashboard title={currentTab} />
      </div>
    </div>
  );
}

export default App;
