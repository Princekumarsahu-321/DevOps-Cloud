const express = require('express');
const healthRouter = require('./routes/health');

const app = express();
app.use(express.json());

app.use(healthRouter);

app.get('/', (req, res) => {
  res.send('Welcome to the API');
});

module.exports = app;