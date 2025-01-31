import { useEffect, useState } from "react";
import axios from "axios";

interface User {
  id: number;
  name: string;
}

function App() {
  const [users, setUsers] = useState<User[]>([]);
  const effect = useEffect(() => {
    axios
      .get<User[]>("https://jsonplaceholder.typicode.com/users")
      .then((res) => setUsers(res.data));
  }, []);

  return (
    <div className="list-group">
      {users.map((user) => (
        <li key={user.id} className="list-group-item p-3">
          {user.name}{" "}
        </li>
      ))}
    </div>
  );
}

export default App;
