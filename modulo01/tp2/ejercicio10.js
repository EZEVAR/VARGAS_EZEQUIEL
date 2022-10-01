function mostrarMensaje1() {
    var mes;
    mes = prompt ("Por favor introduce el número del mes :");
    if (mes =="") { alert ("NO HAZ INTRODUCIDO EL MES"); }
    mes = Number(mes);
            switch (mes) {
                case 1: alert ("ENERO TIENE 31 DÍAS");
                break;
                case 2: alert ("FEBRERO TIENE 28 DÍAS");
                break;
                case 3: alert ("MARZO TIENE 31 DÍAS");
                break;
                case 4: alert ("ABRIL TIENE 30 DÍAS");
                break;
                case 5: alert ("MAYO TIENE 31 DÍAS");
                break;
                case 6: alert ("JUNIO TIENE 30 DÍAS");
                break;
                case 7: alert ("JULIO TIENE 31 DÍAS");
                break;
                case 8: alert ("AGOSTO TIENE 31 DÍAS");
                break;
                case 9: alert ("SEPTIEMBRE TIENE 30 DÍAS");
                break;
                case 10: alert ("OCTUBRE TIENE 31 DÍAS");
                break;
                case 11: alert ("NOVIEMBRE TIENE 30 DÍAS");
                break;
                case 12: alert ("DICIEMBRE TIENE 31 DÍAS");
                break;
                default: alert ("ES NÚMERO ES INCORRECTO"); break;
            }
    }
    console.log(mostrarMensaje1())
