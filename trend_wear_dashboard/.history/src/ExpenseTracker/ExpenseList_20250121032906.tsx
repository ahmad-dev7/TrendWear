interface Expenses {
  id: number;
  description: string;
  amount: number;
  category: string;
}

const ExpenseList = () => {
  return (
    <>
      <table className="table table-bordered">
        <thead>
          <tr>
            <th>Description</th>
            <th>Amount</th>
            <th>Category</th>
            <th>Delete</th>
          </tr>
        </thead>
      </table>
    </>
  );
};

export default ExpenseList;
