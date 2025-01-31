function ListTile() {
  const cities = [
    { name: "New York", population: 8405837 },
    { name: "Los Angeles", population: 3990456 },
    { name: "Chicago", population: 2695594 },
    { name: "Houston", population: 2320268 },
    { name: "Philadelphia", population: 1567875 },
  ];
  return (
    <>
      <h1>List</h1>
      <ul className="list-group">
        {cities.map((city) => (
          <li key={city.name} className="list-group">
            Name:{city.name}, Population:{city.population}
          </li>
        ))}
      </ul>
    </>
  );
}

export default ListTile;
