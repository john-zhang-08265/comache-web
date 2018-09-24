var mysql = require('mysql');

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "root1234"
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});

var queryString = "";

con.query(queryString, function(err, result) {
  Object.keys(result).forEach(function(key) {
    var row = result[key];
    var timeValue = {
      x: row.timestamp,
      y: row.value
    }
  })
});
