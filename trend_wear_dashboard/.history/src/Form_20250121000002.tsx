import "bootstrap/dist/css/bootstrap.css";
const Form = () => {
  return (
    <form>
      <div className="mb-3">
        <label htmlFor="name">Name</label>
        <input id="name" type="text" className="form-control" />
      </div>
    </form>
  );
};

export default Form;
