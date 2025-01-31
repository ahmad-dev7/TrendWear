import "bootstrap/dist/css/bootstrap.css";
import { FieldValues, useForm } from "react-hook-form";
import { categories } from "./App";

const Form = () => {
  const { register, handleSubmit } = useForm();

  const onSubmit = (data: FieldValues) => console.log(data);
  return (
    <form onSubmit={handleSubmit(onSubmit)}>
      <div className="mb-4">
        <label htmlFor="description" className="form-label">
          Description
        </label>
        <input
          {...register("description")}
          id="description"
          type="text"
          className="form-control p-2"
        />
      </div>
      <div className="mb-4">
        <label htmlFor="amount" className="form-label">
          Amount
        </label>
        <input
          {...register("amount")}
          id="amount"
          type="text"
          className="form-control p-2"
        />
      </div>
      <div className="mb-4">
        <label htmlFor="category" className="form-label">
          Category
        </label>
        <select
          {...register("category")}
          id="category"
          className="form-select p-2"
        >
          <option value=""></option>
          {categories.map((category) => (
            <option className="dropdown-item" value={category} key={category}>
              {category}
            </option>
          ))}
        </select>
      </div>
      <button className="btn btn-primary">Submit</button>
    </form>
  );
};

export default Form;
