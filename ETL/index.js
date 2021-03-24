const fs = require("fs");
const fastcsv = require("fast-csv");
const mysql = require("mysql");

let stream = fs.createReadStream('characteristics.csv');
let csvData = [];
let count = 0;
let initialHeader = true;
let extraData = '';
const connection = mysql.createConnection({
     host: "localhost",
     user: "root",
     password: 'root',
     database: 'sdc'
   });
stream.setEncoding('utf8')
stream.on('data', function(data) {
  //csvData.push(data);
  let newData = extraData + data;
  extraData = '';
  let text = newData.split('\n');
  if(count === 0) {
    text.shift();
  }

  if(text[text.length-1] === "") {
    text.pop();
  } else {
    extraData = text[text.length-1];
    text.pop();
  }
  let newText = text.map((s) => {
    return s.split(',');
  })



  if(count === 0) {
    //console.log(newText)
  }
  //count++;
  //console.log(count)

  //console.log(text.length);
    stream.pause();
    let insertQuery = 'INSERT INTO characteristics (id, product_id, name) VALUES ?'
    connection.query(insertQuery, [newText], (error, response) => {
      if(error) {
        console.log(error)
      } else {

        console.log('Finished part ' + count);
        count++;
      }
    })
    count++;
    stream.resume();

})
.on('end', function() {
  //console.log(csvData);
  // csvData.shift();
  // const connection = mysql.createConnection({
  //   host: "localhost",
  //   user: "root",
  //   password: 'root',
  //   database: 'sdc'
  // });

  // connection.connect(error => {
  //   if(error) {
  //     console.error(error);
  //   } else {
  //     let query = 'INSERT INTO characteristics (id, product_id, name) VALUES ?';
  //     connection.query(query, [csvData], (error, response) => {
  //       if(error) {
  //         console.log(error)
  //       } else {
  //         console.log('Success')
  //       }
  //     });
  //   }
  // });
});

//stream.pipe(csvStream);

