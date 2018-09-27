const express = require('express');
const app = express();
const port = 3000;
const fs = require('fs');

/*
*	HTTP COMMANDS
*/

app.get('/*', (req, res) => {
	console.log(req.url);
});

app.post('/', function (req, res) {
  res.send('Got a POST request');
});

app.put('/user', function (req, res) {
  res.send('Got a PUT request at /user');
});

app.delete('/user', function (req, res) {
  res.send('Got a DELETE request at /user');
});

/*
*	LISTENS TO HTTP PORT
*/

app.listen(port, () => {
	console.log(`Example app listening on port ${port}!`)
});