const mysql = require('mysql');
const config = require("../config/config.json");

//conectarnos a nuestra DB
var connection = mysql.createConnection(config.database);

connection.connect((err) => {
    if (err) {
        console.log(err);
    } else {
        console.log("DB materias Conectada correctamente");
    }
});
//fin de conexion db

var materiasDb = {};


materiasDb.getAll = function (funCallback) {
    connection.query("SELECT * FROM materias where estado >=1", function (err, result, fields) {
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

materiasDb.getByidmateria = function (idmateria,funCallback) {
    connection.query("SELECT * FROM materias WHERE idmateria=?",idmateria, function (err, result, fields) {
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
                    message: "No se encontro la materia "
                });
            }
            
        }
    });
}

materiasDb.create = function (materias, funCallback) {
    var query = 'INSERT INTO materias (nombre,objetivo,plan_estudio) VALUES (?,?,?)'
    var dbParams = [ materias.nombre, materias.objetivo, materias.plan_estudio];
    connection.query(query, dbParams, function (err, result, fields) {
        if (err) {
            if(err.code == 'ER_DUP_ENTRY'){
                funCallback({
                    message: `Ya existe la materia con el id ${materias.id}`,
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
                message: `Se creo la materia ${materias.nombre} ${materias.idmateria}`,
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
materiasDb.update = function (idmateria, materias, funCallback) {
    var query = 'UPDATE materias SET idmateria = ? , nombre = ?, objetivo = ?, plan_estudio = ? WHERE idmateria = ?'
    var dbParams = [materias.idmateria, materias.nombre, materias.objetivo, materias.plan_estudio, idmateria];
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
                    message: `No se encontro la materia ${idmateria}`,
                    detail: result
                });
            } else {
                funCallback({
                    code:1,
                    message: `Se modifico la materia ${materias.idmateria}+" " + ${materias.nombre}`,
                    detail: result
                });
            }
        }
    });

}


materiasDb.delete = function(idmateria,funCallback){
    var query = 'DELETE FROM materias WHERE idmateria = ?'
    connection.query(query, idmateria, function (err, result, fields) {
        if (err) {
            funCallback({
                message: "Surgio un problema, contactese con un administrador. Gracias",
                detail: err
            });
            console.error(err);
        } else {
            if (result.affectedRows == 0) {
                funCallback(undefined,{
                    message: `No se encontro la materia ${idmateria}`,
                    detail: result
                });
            } else {
                funCallback(undefined,{
                    message: `Se elimino la materia ${idmateria}`,
                    detail: result
                });
            }
        }
    });
}

/**
 *  
 * @param {*} idmateria 
 * @param {*} funCallback
 *         retorna:
 *              code = 1 (EXITO)
 *              code = 2 (NOT FOUND) (NO encontro elemento)
 *              code = 3 (ERROR)
 * 
 */
materiasDb.logdelete = function (idmateria, funCallback) {
    connection.query("UPDATE materias SET estado = 0 WHERE idmateria = ?",idmateria, function (err, result, fields) {
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
                    message: `No se encontro el id  ${idmateria} de la materia`,
                    detail: result
                }); 
            } else {
         //       console.error(err);
                    funCallback({
                    code:1,
                    message: `Se modifico la materia con el id ${idmateria}`,
                    detail: result
                }); 
            }
        }
    });
}

module.exports = materiasDb;