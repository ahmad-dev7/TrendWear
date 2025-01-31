const Sidebar = () => {
  return (
    <div
      className="d-flex flex-column flex-shrink-0 p-3 text-white"
      style={{ width: 280 }}
    >
      <a
        href="/"
        className="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-black text-decoration-none"
      >
        <img src="/public/vite.svg" alt="Logo" height={32} width={40} />
        <span className="fs-4" color="black">
          Sidebar
        </span>
      </a>
    </div>
  );
};

export default Sidebar;
