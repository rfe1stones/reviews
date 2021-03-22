const express = require('express')
const bodyParser = require('body-parser')
const db = require('../database')

const PORT = 3000;

let app = express();

app.use(bodyParser.urlencoded({ extended: true }));

app.use(express.static(__dirname + '/../client/dist'));

app.get('/reviews', (req, res) => {
  //console.log('hit here x2')
  let storedParam = { count: 5, page: 1, product_id: null }
  if(req._parsedUrl.query !== null) {
    console.log(`${req._parsedUrl.query.split('=')[0]}: `,req._parsedUrl.query.split('=')[1])
    //check if the query string includes &, if it does seperate with a split
    if(req._parsedUrl.query.includes('&')) {
      req._parsedUrl.query.split('&').map(s => {
        let paramArray = s.split('=')
        storedParam[paramArray[0]] = paramArray[1];
      })
    } else {
      storedParam = { count: 5, page: 1, product_id: null }
      storedParam[req._parsedUrl.query.split('=')[0]] = req._parsedUrl.query.split('=')[1]
    }
    console.log(storedParam)
      //add the values in an object
  }
  console.log(storedParam)
  //console.log(req.params.id)  // anything:<insert> is included in params
  /*
    product_id - integer
    rating - int
    summary - text
    body - text
    recommend - bool
    name - text
    email - text
    photos - [text] array of text urls
    characteristics - object

  */
  let selectQuery;
 if(storedParam.product_id === null) {
   storedParam.product_id = 1;
  selectQuery = 'SELECT * FROM reviews WHERE product_id = ?'
  //db.query(selectQuery, )
  console.log(storedParam.product_id)
  db.query(selectQuery, [storedParam.product_id], (error, results) => {
    //Consideration:
    //creating a secondary DB query to add in the photos section manually into the storedParam
    //In this case it will join the table itself 
    results.map(element => {
      element.date = (element.date).replace(/"/g , '');
      element.summary = (element.summary).replace(/"/g, '');
      element.body = (element.body).replace(/"/g, '');
      element.reviewer_name = (element.reviewer_name).replace(/"/g, '');
      element.reviewer_email = (element.reviewer_email).replace(/"/g, '');
    })
    console.log(results);
    storedParam.results = results;
    // results.date = (results.date).replace(/['"] + /g, '');
    // results.summary = (results.summary).replace(/['"] + /g, '');
    // results.body = (results.body).replace(/['"] + /g, '');
    // results.reviewer_name = (results.reviewer_name).replace(/['"] + /g, '');
    // results.reviewer_email = (results.reviewer_email).replace(/['"] + /g, '');
    res.send(storedParam);
  })
 } else {
  selectQuery = 'SELECT reviewer_name FROM reviews WHERE product_id = ?'
  db.query(selectQuery, [storedParam.product_id], (error, results) => {
    console.log(results);
    res.send(results)
  })
  console.log(storedParam.product_id)
 }

  //db.query
  //console.log(res)
})

app.get('/reviews/meta', (req, res) => {
  console.log(`${req._parsedUrl.query.split('=')[0]}: `,req._parsedUrl.query.split('=')[1])

  //would query a join using the product_id in characteristics with characteristics_review and reviews
  //to show the ratings, recommended, characteristics with id, name, value
})

app.put('/reviews/:review_id/:type', (req, res) => {
  console.log(req.params.review_id)
  console.log(req.params.type)
})

app.post('/reviews', (req, res) => {
  /*
    product_id - integer
    rating - int
    summary - text
    body - text
    recommend - bool
    name - text
    email - text
    photos - [text] array of text urls
    characteristics - object

  */
 //post requirements
})

app.listen(PORT, () => {
  console.log(`Server is listening at localhost:${PORT}`)
})