const express = require('express')
const bodyParser = require('body-parser')
const db = require('../database')

const PORT = 3000;

let app = express();

app.use(bodyParser.urlencoded({ extended: true }));

app.use(express.static(__dirname + '/../client/dist'));

app.get('/data1', (err, result) => {
  
})

app.listen(PORT, () => {
  console.log(`Server is listening at localhost:${PORT}!`)
})