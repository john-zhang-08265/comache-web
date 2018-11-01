var mysql = require('mysql');
var fs = require('fs');

var writeFileID = process.argv[2];
var deviceMac = process.argv[3]

var con = mysql.createConnection({
  host: "johns-rds.cuntunfadttt.ap-southeast-2.rds.amazonaws.com",
  user: "root",
  password: "root1234",
  database: "SmartHome_DEV"
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});

con.query(
  "SELECT * FROM DeviceValue WHERE deviceMac = ?", [deviceMac], function(err, result) {

  var data = [];

  Object.keys(result).forEach(function(key) {
    var row = result[key];
    var timeValue = {
      x: row.timestamp,
      y: row.value
    }
    data.push(timeValue)
  });

  fs.writeFile('../Json-Resources/'+writeFileID+'.json', JSON.stringify(data, null, ' '), (err) => {
    if (err) throw err;
  	console.log('The file has been saved!');
  });
});

/*
* CHART JSON STRUCTURE
*
*
*
*


    var color = Chart.helpers.color;
    var config = {
      type: 'line',
      data: {
        datasets: [{
          label: 'Dataset with string point data',
          backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
          borderColor: window.chartColors.red,
          fill: false,
          data: [{
            x: time,
            y: val
          }, {
            x: time,
            y: val
          }, {
            x: time,
            y: val
          }, {
            x: time,
            y: val
          }],
        }, {
          label: 'Dataset with date object point data',
          backgroundColor: color(window.chartColors.blue).alpha(0.5).rgbString(),
          borderColor: window.chartColors.blue,
          fill: false,
          data: [{
            x: newDate(0),
            y: randomScalingFactor()
          }, {
            x: newDate(2),
            y: randomScalingFactor()
          }, {
            x: newDate(4),
            y: randomScalingFactor()
          }, {
            x: newDate(5),
            y: randomScalingFactor()
          }]
        }]
      },
      options: {
        responsive: true,
        title: {
          display: true,
          text: 'Chart.js Time Point Data'
        },
        scales: {
          xAxes: [{
            type: 'time',
            display: true,
            scaleLabel: {
              display: true,
              labelString: 'Date'
            },
            ticks: {
              major: {
                fontStyle: 'bold',
                fontColor: '#FF0000'
              }
            }
          }],
          yAxes: [{
            display: true,
            scaleLabel: {
              display: true,
              labelString: 'value'
            }
          }]
        }
      }
    };

    window.onload = function() {
      var ctx = document.getElementById('canvas').getContext('2d');
      window.myLine = new Chart(ctx, config);
    };


*/


