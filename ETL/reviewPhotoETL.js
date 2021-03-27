const fs = require("fs");
const fastcsv = require("fast-csv");
const mysql = require("mysql");

let stream = fs.createReadStream('reviews_photos.csv');
let csvData = [];

let count = 0;
let initialHeader = true;
let extraData = '';
let lastPop = '';
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
      lastPop = text.pop();
  }

  let newText = text.map((s) => {
    return s.split(',');
  })
  stream.pause();
    let insertQuery = 'INSERT INTO reviews_photos (id, review_id, url) VALUES ?'
    connection.query(insertQuery, [newText], (err, results) => {
      if(err) {
        console.log(err)
        console.log('error')
      } else {
        console.log('Finished part ' + count);
        count++;
        stream.resume();
      }
    })

    count++;

  //console.log('pause')
  //count++;
  //console.log(count)

  //console.log(text.length);


})
.on('end', function() {
  console.log('check here')

  let insertQuery = 'INSERT INTO reviews_photos (id, review_id, url) VALUES ?'
  lastPop = lastPop.split(',');
  connection.query(insertQuery, [[lastPop]], (err, results) => {
    if(err) {
      console.log(err)
    } else {
      console.log('finished!')
    }
  })

});

//stream.pipe(csvStream);

