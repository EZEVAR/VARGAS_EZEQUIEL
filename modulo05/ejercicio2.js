'use strict';
let jsonData = require('./personas.json');
console.log(JSON.stringify(jsonData));
console.log(JSON.parse(jsonData));

// ¿Qué sucede cuando utilizamos JSON.stringify? Por que?
//por consola muestra un json string.
//JSON.stringify toma un objeto de JavaScript y lo transforma en una cadena JSON.

//¿Qué sucede cuando utilizamos JSON.parse? Por que?
// muetra un error de sintaxix.
// Las comas al final no son válidas en JSON, por lo que JSON.parse() genera un error si la cadena que se pasa a ella tiene comas al final.
