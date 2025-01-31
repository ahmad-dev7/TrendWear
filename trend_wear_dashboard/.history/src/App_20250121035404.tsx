import Body from "./Components/Body/Body";
import Navbar from "./Components/Navbar/Navbar";
import Sidebar from "./Components/Sidebar/Sidebar";
import AddProducts from "./Components/AddProduct/AddProduct";
import Dashboard from "./Components/Dashboard/Dashboard";
import { useState } from "react";
import ExpenseList from "./ExpenseTracker/ExpenseList";
import Form from "./Form";

export const categories = ["Fruit", "Vegetables", "Groceries"];

function App() {
  const [expense, setExpenses] = useState([
    { id: 1, description: "Apple", amount: 1000, category: "Fruit" },
    { id: 2, description: "Mango", amount: 1000, category: "Fruit" },
    { id: 3, description: "Orange", amount: 1000, category: "Fruit" },
    { id: 4, description: "Grapes", amount: 1000, category: "Fruit" },
    { id: 5, description: "Watermelon", amount: 1000, category: "Fruit" },
  ]);

  return (
    <>
      <Form />
      <div className="mb-5"></div>
      <ExpenseList
        expenses={expense}
        onRemove={(id) => setExpenses(expense.filter((e) => e.id != id))}
      />
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
