import "bootstrap/dist/css/bootstrap.css";
import { FormEvent } from "react";
const Form = () => {
  const handleSubmit = (event: FormEvent) => {
    event.preventDefault();
  };

  return (
    <form>
      {/* Name */}
      <div className="mb-3">
        <label htmlFor="name" className="form-label">
          Name
        </label>
        <input id="name" type="text" className="form-control" />
      </div>
      {/* Age */}
      <div className="mb-3">
        <label htmlFor="age" className="form-label">
          Age
        </label>
        <input id="age" type="number" className="form-control" />
      </div>
      {/* Button */}
      <button onSubmit={handleSubmit} type="submit" className="btn btn-primary">
        Submit
      </button>
    </form>
  );
};

export default Form;
