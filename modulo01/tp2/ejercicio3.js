op= prompt("Introduce número a calcular el factorial: ");
const dato = op;
let r = 1;
for(let i = dato; i>0; i--){
    r *= i;
}
console.log("el factorial es : ",r);
