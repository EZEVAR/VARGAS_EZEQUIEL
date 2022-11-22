const fs = require('fs');
let rawdata = fs.readFileSync('./personas.json');
console.log(JSON.stringify(rawdata));
// ¿Qué sucede cuando utilizamos JSON.stringify? Por que?
// por consola muestra una serie de numeros.
// JSON.stringify toma un objeto de JavaScript y lo transforma en una cadena JSON.

// ¿Qué sucede cuando utilizamos JSON.parse? Por que?
// por consola muestra un archivo en formato JSON.
// toma una cadena JSON y la transforma en un objeto de JavaScript.