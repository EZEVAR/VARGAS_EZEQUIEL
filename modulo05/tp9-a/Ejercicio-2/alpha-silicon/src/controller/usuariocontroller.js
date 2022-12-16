require("rootpath")();
const express = require('express');
const app = express();

const usuarioDb = require("../datasource/usuariosDB.js");


app.get('/', getAll);

app.get('/:idusuario', getByidusuario);

app.post('/', create);

app.put('/:idusuario', update);

app.delete('/del/:idusuario', eliminar);

app.delete('/:idusuario', eliminacionlogica);

// Metododo para listar todas las usuarios 
function getAll(req, res) {
    usuarioDb.getAll(function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para buscar usuarios por su idusuario
function getByidusuario(req, res) {
    usuarioDb.getByidusuario(req.params.idusuario,function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para agregar usuarios
function create(req, res) {
    usuarioDb.create(req.body, function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para modificar usuarios
function update(req, res) {
    usuarioDb.update(req.params.idusuario, req.body, function (result) {
        if (result.code == 3) {
            res.status(500).send(err);
        } else if (result.code == 2) {
            res.status(404).json(result);
        } else {
            res.json(result);
        }
    });
}
// Metodo par eliminar fisicamente usuarios de la base de datos
function eliminar(req, res) {
    usuarioDb.delete(req.params.idusuario,  function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            if (result.detail.affectedRows == 0) {
                res.status(404).json(result);
            } else {
                res.json(result);
            }
        }
    });
}
// Metodo par eliminar usuarios cambiando el estado a 0
function eliminacionlogica(req, res) {
    usuarioDb.logdelete(req.params.idusuario, function (result) {
        if (result.code == 3) {
            res.status(500).send(err);
        } else if (result.code == 2) {
                res.status(404).json(result);  
        } else if (result.code == 1) {      
            res.json(result);
        }
    });
}

module.exports = app;