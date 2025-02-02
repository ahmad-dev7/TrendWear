import "bootstrap/dist/css/bootstrap.css";
const Form = () => {
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
      <button className="btn btn-primary">Submit</button>
    </form>
  );
};

export default Form;
