import Dashboard from "./Body/Dashboard";
import Navbar from "./Navbar/Navbar";
import Sidebar from "./Sidebar/Sidebar";

function App() {
  return (
    <div id="parent">
      <Sidebar onSelectTab={(value) => console.log(value)} />
      <div style={{ flex: 1 }}>
        <Navbar />
        <Dashboard title="Hello Home" />
      </div>
    </div>
  );
}

export default App;
