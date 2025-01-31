const Form = () => {
  return (
    <form>
      <div className="mb-4">
        <label htmlFor="name" className="form-label">
          Name
        </label>
        <input id="name" type="text" className="form-control" />
      </div>
    </form>
  );
};

export default Form;
