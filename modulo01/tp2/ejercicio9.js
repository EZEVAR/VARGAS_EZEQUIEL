var notas = [];
var i;
cantnotas = prompt("Ingrese el total de notas a cargar: ")
for (i = 0; i < cantnotas ; i++) {
    notas.push(Number(prompt("Ingresa tu nota:" + (i + 1))));
}
var suma = notas.reduce(function(total, cantidad) {
    return total + cantidad
});
var promedio = (suma / (notas.length)).toFixed(1);
var estado;
if (promedio >= 6.0 && promedio <= 8) {
    estado = ("Aprobado");
} else if (promedio >= 8.1 ) {
    estado = ("sobresaliente");}
     else { estado = ("desaprobado")}
alert(estado)
document.write("Tus notas son: " + notas + "<br>" + "Tu Promedio es: " + promedio + "<br>" + "Estado: " + estado + "<br>");
console.log("Tus notas son: " + notas + "     " + "Tu Promedio es: " + promedio + "     " + "Estado: " + estado + "     ");
