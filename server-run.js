const http = require('http');
const port = 3000;
const fs = require('fs');

const server = http.createServer(requestHandler);

const requestHandler = (request, response) => {
  console.log(request.url);
  fs.readFile('Json-Resources'+request.url+'.json', (err, contents) => {
  	response.end(contents)
  });
}


server.listen(port, (err) => {
  if (err) {
    return console.log('something bad happened', err)
  }
  console.log(`server is listening on ${port}`)
});