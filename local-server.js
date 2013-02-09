/**
 * A Simple local webserver using node.js & connect
 *
 * How to install: npm install connect
 * How to run: node local-server.js
 */
var connect = require('connect');

var PORT_NUM = 9000;
var server = connect()
  .use(connect.static(__dirname))
  .listen(PORT_NUM);

console.log('local server started at port', PORT_NUM);
