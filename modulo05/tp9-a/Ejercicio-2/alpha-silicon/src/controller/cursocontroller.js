require("rootpath")();
const express = require('express');
const app = express();
const cursoDb = require("../datasource/cursosDB.js");

app.get('/', getAll);

app.get('/:idcurso', getByidcurso);

app.post('/', create);

app.put('/:idcurso', update);

app.delete('/del/:idcurso', eliminar);

app.delete('/:idcurso', eliminacionlogica);

// Metododo para listar todos los cursos 
function getAll(req, res) {
    cursoDb.getAll(function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para buscar cursos por su id
function getByidcurso(req, res) {
    cursosDb.getByidcurso(req.params.idcurso,function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para agregar cursos.
function create(req, res) {
    cursoDb.create(req.body, function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para modificar cursos
function update(req, res) {
    cursoDb.update(req.params.idcurso, req.body, function (result) {
        if (result.code == 3) {
            res.status(500).send(err);
        } else if (result.code == 2) {
            res.status(404).json(result);
        } else {
            res.json(result);
        }
    });
}
// Metodo par eliminar fisicmente cursos de la base de datos
function eliminar(req, res) {
    cursoDb.delete(req.params.idcurso,  function (err, result) {
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
// Metodo par eliminar cursos cambiando el estado a 0
function eliminacionlogica(req, res) {
    cursoDb.logdelete(req.params.idcurso, function (result) {
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