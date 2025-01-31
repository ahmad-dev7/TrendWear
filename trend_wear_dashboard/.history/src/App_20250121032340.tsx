// import Body from "./Components/Body/Body";
// import Navbar from "./Components/Navbar/Navbar";
// import Sidebar from "./Components/Sidebar/Sidebar";
// import AddProducts from "./Components/AddProduct/AddProduct";
// import Dashboard from "./Components/Dashboard/Dashboard";
import ExpenseList from "./ExpenseTracker/ExpenseList";
import Form from "./Form";

export const categories = ["Fruit", "Vegetables", "Groceries"];

function App() {
  return (
    <>
      <Form />
      <ExpenseList />
    </>

    // <div id="parent">
    //   <Sidebar onSelectTab={setBody} />
    //   <div style={{ flex: 1 }}>
    //     <Navbar />
    //     <Body>
    //       {body == "Dashboard" && <Dashboard />}
    //       {body == "Add Product" && <AddProducts />}
    //     </Body>
    //   </div>
    // </div>
  );
}

export default App;
