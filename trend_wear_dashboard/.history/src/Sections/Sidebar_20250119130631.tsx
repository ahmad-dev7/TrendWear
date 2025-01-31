const Sidebar = () => {
  return (
    <div
      className="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark"
      style={{ width: 280 }}
    >
      <a
        href="/"
        className="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-black text-decoration-none"
      >
        <img src="/public/vite.svg" alt="Logo" height={32} width={40} />
        <span className="fs-4" color="white">
          Sidebar
        </span>
      </a>
      <hr />
      <ul className="nav nav-pills flex-column mb-auto">
        <li className="nav-item bg-dark">
          <a href="#" className="nav-link active">
            <img
              src="/public/vite.svg"
              className="bi me-2"
              alt="Home"
              height={16}
              width={16}
            />
            Dashboard
          </a>
        </li>
        <li></li>
        <li></li>
        <li></li>
      </ul>
    </div>
  );
};

export default Sidebar;
