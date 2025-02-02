const BootstrapSidebar = () => {
  return (
    <div
      className="d-flex flex-column flex-shrink-0 p-3 bg-light"
      style={{ width: "280x" }}
    >
      <a
        href="/"
        className="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none"
      >
        <svg className="bi me-2" width="40" height="32">
          <use href="#bootstrap"></use>
        </svg>
        <span className="fs-4">Sidebar</span>
      </a>
      <hr />
      <ul className="nav nav-pills flex-column mb-auto">
        <li className="nav-item">
          <a href="#" className="nav-link active" aria-current="page">
            <svg className="bi me-2" width="16" height="16">
              <use href="#home"></use>
            </svg>
            Home
          </a>
        </li>
        <li>
          <a href="#" className="nav-link link-dark">
            <svg className="bi me-2" width="16" height="16">
              <use href="#speedometer2"></use>
            </svg>
            Dashboard
          </a>
        </li>
        <li>
          <a href="#" className="nav-link link-dark">
            <svg className="bi me-2" width="16" height="16">
              <use href="#table"></use>
            </svg>
            Orders
          </a>
        </li>
        <li>
          <a href="#" className="nav-link link-dark">
            <svg className="bi me-2" width="16" height="16">
              <use href="#grid"></use>
            </svg>
            Products
          </a>
        </li>
        <li>
          <a href="#" className="nav-link link-dark">
            <svg className="bi me-2" width="16" height="16">
              <use href="#people-circle"></use>
            </svg>
            Customers
          </a>
        </li>
      </ul>
      <hr />
    </div>
  );
};

export default BootstrapSidebar;
