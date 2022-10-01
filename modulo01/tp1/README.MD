# CURSO PROGRAMACIÓN WEB FULL STACK
# NIVEL 2
## MÓDULO 1 - Nivelación y fundamentos de la Programación
### Ejercicio 1:
a) Abrir el editor HTML.

b) Archivo Nuevo.

c) Copiar el código que empieza por <!DOCTYPE html> siguiente.

d) Menú... Archivo... Guardar como: Ejercicio1.html

e) Abrir el archivo Ejercicio1.html en el navegador

f) Después del primer mensaje, se debe mostrar otro mensaje que diga "Soy el primer
script"

g) Agregar comentarios que expliquen el funcionamiento del código.
```<!DOCTYPE html>
<html>
<head>
<title>Ejercicio 1 </title>
</head>
<body>
<script>
document.writeln("Hola Mundo!");
</script>
</body>
</html>
```
### Ejercicio 2:
Copiar el siguiente código dentro de un archivo, luego guardarlo con el nombre:
“Ejercicio2.html”. Ejecuta el programa en el navegador.
````<!DOCTYPE html>
<html>
<body>
<script>
let A, B;
A = 9;
B = 7;
resultado = A + B;
alert (`La suma de A+B es: ${resultado} ` );
alert (`La diferencia de A-B es: ${A-B} ` );
alert (`La multiplicación de AxB es: ${A*B} ` );
alert (`La división de A/B es: ${resultado=A/B} ` );
</script>
</body>
</html>
````
### Ejercicio 3:
Copiar el siguiente código dentro de un archivo, luego guardarlo con el nombre:
“Ejercicio3.html”. Ejecuta el programa en el navegador.
````<!DOCTYPE html>
<html>
<body>
<script>
let num1=0;
let num2=0;
num1 = num1 + 3;
num2 = num2 + 7;
alert (`El primer numero ahora es ${num1} `);
alert (`El segundo numero ahora es ${num2} ` );
</script>
</body>
</html>
````
### Ejercicio 4:
Copiar el siguiente código dentro de un archivo, luego guardarlo con el nombre:
“Ejercicio4.html”. Ejecuta el programa en el navegador.
````<html>
<body>
<script type="text/javascript">
const A = "Hola";
let B = " mundo!";
document.write("Constante A contiene " + A );
document.write("</br>");
document.write("Variable B contiene " + B );
document.write("</br>");
document.write(A + B );
</script>
<p>El signo '+' sirve para concatenar cadenas de texto</p>
</body>
</html>
````
### Ejercicio 5:
Copiar el siguiente código dentro de un archivo, luego guardarlo con el nombre:
Ejercicio5.html’. Ejecuta el programa en el navegador.
Obs: El siguiente código tiene un error, para corregirlo se debe depurar el código en el
navegador.
Depurar con chrome: https://developer.chrome.com/docs/devtools/javascript/
````<!DOCTYPE html>
<html><body>
<script type="text/javascript">
let a, b;
a = 3; b = 7;
resultado = a * b;
document.write(`Variable a contiene ${a} <br> ` );
document.write(`Variable b contiene ${b} <br> ` );
document.write(`El producto de a por b es ${result} `);
</script>
<p>Los puntos de interrupción son fundamentales para programar</p>
</body>
</html>
````
### Ejercicio 6:
Crear un array llamado “dias” y que almacene el nombre de los siete días de la semana.
Mostrar por pantalla los siete nombres utilizando la función console.log().

### Ejercicio 7:
Ejecutar el programa en el navegador. Guardarlo con el nombre: Ejercicio7.html’ Pasar
valores por teclado. Anotar con comentarios que hace el programa.
````<!DOCTYPE html>
<html>
<body>
<script>
let dato, resultado;
val1 = window.prompt("Introduce tu nombre", "...");
val2 = window.prompt("Introduce tu apellido", "...");
resultado = `Concatenado tu nombre y apellido es: ${val1} ${val2} ` ;
document.write(resultado);
</script>
</body>
</html>
````
### Ejercicio 8:
Copiar el siguiente código dentro de un archivo, luego guardarlo con el nombre:
Ejercicio8.html’. Ejecuta el programa en el navegador.
````<!DOCTYPE html>
<html>
<head><meta charset="utf-8"></head>
<body>
<script>
let val1, val2, num1, num2;
val1 = window.prompt("Introduce primer número ?", "0");
num1 = parseInt(val1); // El método parseInt analiza un valor como una
cadena y devuelve el primer entero.
https://www.w3schools.com/jsref/jsref_parseint.asp
val2 = window.prompt("Introduce segundo número ?", "0");
num2 = parseInt(val2);
let resultado = num1 + num2;
document.write(`<br/> <br/> La suma es ${resultado} ` );
</script>
<p>Para sumar, las variables deben ser numéricas.</p>
</body>
</html>
````
### Ejercicio 9:
Crear un archivo: Ejercicio9.html’. Declarar un array llamado “vocales” con las 5 letras.
Luego se deben imprimir en el navegador uno debajo de otro.

### Ejercicio 10:
Crear un archivo: Ejercicio10.html’ Declarar un array llamado “meses” y que tenga
guardado los meses del año. Luego el usuario debe poder tipear en el navegador un
número de 1 al 12 y este le devolverá el nombre del mes. Por ejemplo escribe 5 debe
devolver el mes mayo.
