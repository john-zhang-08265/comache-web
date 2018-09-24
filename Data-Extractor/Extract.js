var mysql = require('mysql');

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "root1234",
  database: "sensor_db"
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});

var queryString = "SELECT * FROM lightSensor";

con.query(queryString, function(err, result) {

  var data = [];

  Object.keys(result).forEach(function(key) {
    var row = result[key];
    var timeValue = {
      x: row.timestamp,
      y: row.brightness
    }
    data.push(timeValue)
  });

  console.log(data);
});
