import Navbar from "./Navbar/Navbar";
import Sidebar from "./Sidebar/Sidebar";

function App() {
  return (
    <div id="parent">
      <Sidebar />
      <Navbar />
      <div className="test"></div>
    </div>
  );
}

export default App;
