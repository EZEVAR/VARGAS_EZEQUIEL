var num = [];
var cantidadNumeros = 100;
var hasta = 101;

function llenarAleatorios(a){
    var b = Math.floor(Math.random() * hasta);
    if(!a.some(function(c){return c == b})){
        a.push(b);
    }
}
while(num.length < cantidadNumeros && cantidadNumeros < hasta){
    llenarAleatorios(num);
}
console.log(num+"")
