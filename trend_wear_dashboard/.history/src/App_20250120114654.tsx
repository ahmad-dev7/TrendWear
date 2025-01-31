// import { useState } from "react";
// import Body from "./Components/Body/Body";
// import Navbar from "./Components/Navbar/Navbar";
// import Sidebar from "./Components/Sidebar/Sidebar";
// import AddProducts from "./Components/AddProduct/AddProduct";
// //import Dashboard from "./Components/Dashboard/Dashboard";

// function App() {
//   const [body, setBody] = useState("Dashboard");

//   console.log(body);

//   return (
//     <div id="parent">
//       <Sidebar onSelectTab={setBody} />
//       <div style={{ flex: 1 }}>
//         <Navbar />
//         <Body>
//           <AddProducts />
//         </Body>
//       </div>
//     </div>
//   );
// }

// export default App;

import { useState } from "react";
import "./App.css";
import Sidebar from "./Components/Sidebar/Sidebar";

const App = () => {
  const [body, setBody] = useState("Dashboard");
  console.log(body);
  return (
    <div className="app">
      {/* Sidebar */}
      <aside className="sidebar">
        <Sidebar onSelectTab={setBody} />
      </aside>

      {/* Main Layout */}
      <div className="main-layout">
        {/* Navbar */}
        <header className="navbar">Navbar Content</header>

        {/* Content Section */}
        <main className="content-section">
          <div style={{ height: "1500px" }}>Hello</div>
        </main>
      </div>
    </div>
  );
};

export default App;
