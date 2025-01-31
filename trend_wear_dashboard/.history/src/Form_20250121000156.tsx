import "bootstrap/dist/css/bootstrap.css";
const Form = () => {
  return (
    <form>
      <div className="mb-3">
        <label htmlFor="name" className="form-label">
          Name
        </label>
        <input id="name" type="text" className="form-control-lg" />
      </div>
    </form>
  );
};

export default Form;
