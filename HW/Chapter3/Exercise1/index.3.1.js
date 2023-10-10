const express = require("express");

const app = express();
const port = 3000;

app.use(express.urlencoded({ extended: true }));

app.get('/', (req, res) => res.send(req.query));

app.post('/', (req, res) => {
  var obj = req.body;
  res.send(Object.keys(obj).map(k => `${k}: ${obj[k]}`).join('\n'));
});

app.put('/', (req, res) => {
  var obj = req.body;
  res.send(Object.keys(obj).map(k => `${k}: ${obj[k]}`).join('\n'));
});

app.delete('/', (req, res) => {
  var obj = req.body;
  res.send(Object.keys(obj).map(k => `${k}: ${obj[k]}`).join('\n'));
});

app.listen(port, () => console.log(`Server listening on port ${port}!`));
