op = window.prompt("Introduce el texto a invertir: ")
var op= reverse(op);
function reverse(op){
  return op.split("").reverse().join("");
}
console.log("la palabra invertida es: ",op);
