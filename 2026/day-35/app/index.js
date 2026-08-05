const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('<h1>Hola desde el Day 35 - Multi-Stage Build en Docker!</h1>');
});

app.listen(port, () => {
  console.log(`App running on port ${port}`);
});
