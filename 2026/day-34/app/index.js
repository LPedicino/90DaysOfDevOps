const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('<h1>Hola desde el Day 34 - Advanced Docker Compose en el Proliant!</h1>');
});

app.listen(port, () => {
  console.log(`App running on port ${port}`);
});
