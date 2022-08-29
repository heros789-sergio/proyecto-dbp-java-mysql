const isEmpty = (str) => str.trim() === '';

function acceder(){
    var usua = document.getElementById('dni');
    var clav = document.getElementById('clave_web');
    var tarjeta = document.getElementById("num_tarjeta");
    tarjetaVal = tarjeta.value;
    usuaVal = usua.value;
    clavVal = clav.value;
    clavVal = clavVal.toLowerCase();
    
    if(isEmpty(usuaVal) || isEmpty(clavVal) || isEmpty(tarjetaVal)){
        alert("Todos los campos son obligatorios!!!");
        return;
    }
    
    var contenido = document.getElementById("mensaje");
    
    if(window.XMLHttpRequest) {
        ajax = new XMLHttpRequest();
    } else {
        ajax = new ActiveXObject("Microsoft.XMLHTTP");
    }
    ajax.onreadystatechange = function () {
        if((ajax.readyState === 4) && (ajax.status === 200)) {
            if(ajax.responseText.trim() === 'OK'){
                window.location.href = "inicio.jsp";
            }
        } else {
            contenido.innerHTML = ajax.responseText;
        }
    };
    ajax.open("POST","Login");
    ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    ajax.send("dni="+usuaVal+"&clave_web="+clavVal);
}
function asignar() {
    let btnAcceder = document.getElementById("btnAgregar");
    btnAcceder.addEventListener("click",acceder);
}
window.addEventListener("load",asignar);
