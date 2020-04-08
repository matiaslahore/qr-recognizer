var conn = require('./connection');
var mysql = require('mysql'),
    connection = mysql.createConnection(conn);

var device = {};

device.getPackages = function (callback) {
    if (connection) {
        connection.query('SELECT * FROM packages', function (error, rows) {
            if (error) {
                throw error;
            } else {
                callback(null, rows);
            }
        });
    }
}

device.getPackageByCode = function (code, callback) {
    if (connection) {
        var sql = 'SELECT * FROM packages WHERE code = ' + connection.escape(code);
        console.log(sql);
        connection.query(sql, function (error, row) {
            if (error) {
                throw error;
            } else {
                callback(null, row);
            }
        });
    }
}
device.updatePackage = function (packageData, callback) {
    if (connection) {
        var sql = 'UPDATE packages SET';
        sql += ' WHERE code = ' + packageData.code;
        connection.query(sql, function (error, result) {
            if (error) {
                throw error;
            } else {
                callback(null, {"mensaje": "Actualizado"});
            }
        });
    }
}


module.exports = device;