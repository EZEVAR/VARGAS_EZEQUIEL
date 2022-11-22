'use strict';
const fs = require('fs');
fs.readFile('personas.json', (err, data) => {
if (err) throw err;
console.log(JSON.stringify(data));
console.log(data);
});
// ¿Qué sucede cuando utilizamos JSON.stringify?
// por consola muestra numeros {"type":"Buffer","data":[123,13,10,32....,93,13,10,125]}

// ¿Que sucede? Por que?
// sucede lo mismo ,transforma los datos a binario y agrega <Buffer 7b 0d 0a 20 20 22 70 65 72 73 6f 6e 61 73 22 3a 5b 0d 0a 20 20 20 20 20
// 7b 0d 0a 20 20 20 20 20 20 20 20 22 6e 6f 6d 62 72 65 22 3a 22 50 65 64 72 6f ... 805 more bytes>