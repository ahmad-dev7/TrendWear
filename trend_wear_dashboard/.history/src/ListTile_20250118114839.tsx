function ListTile() {
  const citiesName = ["Mumbai", "Delhi", "Bihar", "Bangalore"];
  return (
    <>
      <h1>List</h1>
      <ul className="list-group">
        {citiesName.map((city) => (
          <li key={city} className="list-group-item">
            Name:{city}
          </li>
        ))}
      </ul>
    </>
  );
}

export default ListTile;
