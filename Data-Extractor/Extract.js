var mysql = require('mysql');
var fs = require('fs');

var writeFileID = process.argv[2];

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

  fs.writeFile('../Json-Resources/'+writeFileID+'.json', JSON.stringify(data, null, ' '), (err) => {
    if (err) throw err;
  	console.log('The file has been saved!');
  });
});
