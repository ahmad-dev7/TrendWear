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

import React from "react";
import "./App.css";

const App = () => {
  return (
    <div className="app">
      {/* Sidebar */}
      <aside className="sidebar">Sidebar Content</aside>

      {/* Main Layout */}
      <div className="main-layout">
        {/* Navbar */}
        <header className="navbar">Navbar Content</header>

        {/* Content Section */}
        <main className="content-section">
          <p>Your content goes here...</p>
        </main>
      </div>
    </div>
  );
};

export default App;
