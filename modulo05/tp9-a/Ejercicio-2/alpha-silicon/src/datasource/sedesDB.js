const mysql = require('mysql');
const config = require("../config/config.json");

//conectarnos a nuestra DB
var connection = mysql.createConnection(config.database);

connection.connect((err) => {
    if (err) {
        console.log(err);
    } else {
        console.log("DB sedes Conectada correctamente");
    }
});
//fin de conexion db

var sedesDb = {};


sedesDb.getAll = function (funCallback) {
    connection.query("SELECT * FROM sedes where estado >=1", function (err, result, fields) {
        if (err) {
            funCallback({
                message: "Surgio un problema, contactese con un administrador. Gracias",
                detail: err
            });
            console.error(err);
        } else {
            funCallback(undefined, result);
        }
    });
}

sedesDb.getByidsede = function (idsede,funCallback) {
    connection.query("SELECT * FROM sedes WHERE idsede=?",idsede, function (err, result, fields) {
        if (err) {
            funCallback({
                message: "Surgio un problema, contactese con un administrador. Gracias",
                detail: err
            });
            console.error(err);
        } else {
            if(result.length>0){
                funCallback(undefined, result[0]);
            }else{
                funCallback({
                    message: "No se encontro la sede "
                });
            }
            
        }
    });
}

sedesDb.create = function (sedes, funCallback) {
    var query = 'INSERT INTO sedes (nombre,direccion,localidad,cod_postal,telcontacto1,elcontacto2) VALUES (?,?,?,?,?,?)'
    var dbParams = [ sedes.nombre, sedes.direccion,sedes.localidad,sedes.cod_postal,sedes.telcontacto1,sedes.telcontacto2];
    connection.query(query, dbParams, function (err, result, fields) {
        if (err) {
            if(err.code == 'ER_DUP_ENTRY'){
                funCallback({
                    message: `Ya existe la sede con el id ${sedes.id}`,
                    detail: err
                });
            }else{
                funCallback({
                    message: "Surgio un problema, contactese con un administrador. Gracias",
                    detail: err
                });
            }
            
            console.error(err);
        } else {
            funCallback(undefined, {
                message: `Se creo la sede ${sedes.nombre} ${sedes.descripcion}`,
                detail: result
            });
        }
    });
}

/**
 * 
 * @param {*} dni 
 * @param {*} persona 
 * @param {*} funCallback 
 *         retorna:
 *              code = 1 (EXITO)
 *              code = 2 (NOT FOUND) (NO encontro elemento)
 *              code = 3 (ERROR)
 * 
 */
sedesDb.update = function (idsede, sedes, funCallback) {
    var query = 'UPDATE sedes SET idsede = ? , nombre = ?, direccion = ?,localidad = ?,cod_postal = ?,telcontacto1 = ?,elcontacto2 = ? WHERE idsede = ?'
    var dbParams = [sedes.nombre, sedes.direccion,sedes.localidad,sedes.cod_postal,sedes.telcontacto1,sedes.telcontacto2, idsede];
    connection.query(query, dbParams, function (err, result, fields) {
        if (err) {
            funCallback({
                code:3,
                message: "Surgio un problema, contactese con un administrador. Gracias",
                detail: err
            });
            console.error(err);
        } else {
            if (result.affectedRows == 0) {
                funCallback({
                    code:2,
                    message: `No se encontro la sede ${idsede}`,
                    detail: result
                });
            } else {
                funCallback({
                    code:1,
                    message: `Se modifico la sede ${sedes.nombre}+" " + ${sedes.descripcion}`,
                    detail: result
                });
            }
        }
    });

}


sedesDb.delete = function(idsede,funCallback){
    var query = 'DELETE FROM sedes WHERE idsede = ?'
    connection.query(query, idsede, function (err, result, fields) {
        if (err) {
            funCallback({
                message: "Surgio un problema, contactese con un administrador. Gracias",
                detail: err
            });
            console.error(err);
        } else {
            if (result.affectedRows == 0) {
                funCallback(undefined,{
                    message: `No se encontro la sede ${idsede}`,
                    detail: result
                });
            } else {
                funCallback(undefined,{
                    message: `Se elimino la sede ${idsede}`,
                    detail: result
                });
            }
        }
    });
}

/**
 *  
 * @param {*} idsede 
 * @param {*} funCallback
 *         retorna:
 *              code = 1 (EXITO)
 *              code = 2 (NOT FOUND) (NO encontro elemento)
 *              code = 3 (ERROR)
 * 
 */
sedesDb.logdelete = function (idsede, funCallback) {
    connection.query("UPDATE sedes SET estado = 0 WHERE idsede = ?",idsede, function (err, result, fields) {
        if (err) {
            funCallback({
                code:3,
                message: "Surgio un problema, contactese con un administrador. Gracias",
                detail: err
            }); 
            console.error(err);
        } else {
            if (result.affectedRows == 0) {
                funCallback({
                    code:2,
                    message: `No se encontro el id  ${idsede} de la sede`,
                    detail: result
                }); 
            } else {
         //       console.error(err);
                    funCallback({
                    code:1,
                    message: `Se modifico la sede con el id ${idsede}`,
                    detail: result
                }); 
            }
        }
    });
}

module.exports = sedesDb;