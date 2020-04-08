var express = require('express');
var router = express.Router();
var deviceModel = require('../models/package');

router.get('/packages', function (request, response) {
    deviceModel.getPackages(function (error, data) {
        response.status(200).json(data);
    });
});

router.put('/package', function (request, response) {
    // console.log(request.query.code);
    // response.status(200).json(request.query.code);
    // response.send();
    deviceModel.getPackageByCode(request.query.package_code, function (error, datos) {
        if (datos.length > 0) {
            var packageData = {
                code: request.body.package_code,
                updated_at: new Date()
            };
            deviceModel.updatePackage(packageData, function (error, datos) {
                if (datos && datos.mensaje) {
                    response.status(200).json(datos);
                }
                else {
                    response.status(500).json({"mensaje": "Hubo un error al editar el usuario"});
                }
            });
        }
        else {
            response.status(404).json({"Mensaje": "El usuario que quiere editar no existe"});
        }
    });
});

module.exports = router;