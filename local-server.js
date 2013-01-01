/**
 * A Simple local webserver using node.js & connect
 *
 * How to install: npm install connect
 * How to run: node local-server.js
 */
var connect = require('connect');
var server = connect()
  .use(connect.static(__dirname))
  .listen(9000);
