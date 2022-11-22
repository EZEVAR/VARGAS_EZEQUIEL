const fs = require('fs');
const rawdata = fs.readFileSync('./personas.json', 'utf8');
var persona = JSON.parse(rawdata);
function getnombre(arreglo){
    for (var i=0;i<arreglo['personas'].length;i++){
        let arreglos = arreglo['personas'][i]['localidad'];
        if (arreglo['personas'][i]['localidad'] === 'Posadas'){
            console.log(arreglo['personas'][i]['nombre'] + ' ' +  arreglo['personas'][i]['apellido'])
        }
    }
}
getnombre(persona)