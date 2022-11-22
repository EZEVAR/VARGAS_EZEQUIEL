const fs = require('fs');
const rawdata = fs.readFileSync('./departamentos.json', 'utf8');
var departamento = JSON.parse(rawdata);
function getempleado(arreglo){
    for (var i=0;i<arreglo['Tecnologia'].length;i++){
            console.log(arreglo['Tecnologia'][i]['nombre'] + ' ' +  arreglo['Tecnologia'][i]['puesto'])
        }
    }
getempleado(departamento)