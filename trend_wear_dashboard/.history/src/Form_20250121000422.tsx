import "bootstrap/dist/css/bootstrap.css";
const Form = () => {
  return (
    <form>
      <div className="mb-3">
        <label htmlFor="name" className="form-label">
          Name
        </label>
        <input id="name" type="text" className="form-control" />
      </div>
      <div className="mb-3">
        <label htmlFor="textarea" className="form-label">
          Description
        </label>
        <input id="textarea" type="text" className="form-control" />
      </div>
    </form>
  );
};

export default Form;
