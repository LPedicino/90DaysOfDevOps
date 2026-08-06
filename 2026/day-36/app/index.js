const express = require('express');
const { Pool } = require('pg');

const app = express();
const port = process.env.PORT || 3000;

const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
});

app.get('/', async (req, res) => {
  try {
    const dbResult = await pool.query('SELECT NOW()');
    res.send(`<h1>Day 36 Full App Running!</h1><p>Database connected at: ${dbResult.rows[0].now}</p>`);
  } catch (err) {
    res.send(`<h1>Day 36 Full App Running!</h1><p>Database connecting... Error: ${err.message}</p>`);
  }
});

app.listen(port, () => {
  console.log(`App listening on port ${port}`);
});
