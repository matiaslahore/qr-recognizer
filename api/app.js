var express = require("express");
var router = express.Router();
var bodyParser = require("body-parser");
var aplicacion = express();
const { execSync } = require('child_process');
// stderr is sent to stdout of parent process
// you can set options.stdio if you want it to go elsewhere

var device = require("./routes/package");

router.get('/', function (request, response) {
    response.status(200).json({"mensaje": "Nuestra primera app con node.js utilizando express"});
});

aplicacion.use(bodyParser.json());

aplicacion.use(router);

aplicacion.use(device);

aplicacion.listen(port = 5000, function () {
    console.log("Servidor iniciado");
	let stdout = execSync('hostname -I');
	console.log("addr: " + stdout);
    console.log("puerto: " + port);
});