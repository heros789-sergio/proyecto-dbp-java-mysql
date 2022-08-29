const isEmpty = (str) => str.trim() === '';

function transferir(){
    var cuentaEmisora = document.getElementById('cuentaEmisora');
    var cuentaDestinatario = document.getElementById('nroCuentaDestinatario');
    var monto = document.getElementById('monto');
    cuentaEmisoraVal = cuentaEmisora.value;
    cuentaDestinatarioVal = cuentaDestinatario.value;
    montoVal = monto.value;
    
    if(isEmpty(cuentaEmisoraVal) || isEmpty(cuentaDestinatarioVal) || isEmpty(montoVal)){
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
    ajax.open("POST","Transferencia");
    ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    ajax.send("cuentaEmisora="+cuentaEmisoraVal+"&cuentaDestinatario="+cuentaDestinatarioVal+"&monto="+montoVal);
}

function asignar() {
    let btnTransferir = document.getElementById("btnTransferir");
    btnTransferir.addEventListener("click",transferir);
    

}
window.addEventListener("load",asignar);
