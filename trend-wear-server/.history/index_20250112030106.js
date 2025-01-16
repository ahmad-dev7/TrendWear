const app = require("./app");

const port = 3000;

app.get("/", (req, res) => {
  res.send("Hllo World, this is Ahmad");
});

app.listen(port, () => {
  console.log(`Server listening on port: ${port}`);
});
