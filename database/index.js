const mysql = require('mysql')

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'root',
  database: 'sdc'
})

connection.connect((err) => {
  if(err) {
    console.log(err);
  } else {
    console.log('connected to MySQL')
  }
})

module.exports = connection;