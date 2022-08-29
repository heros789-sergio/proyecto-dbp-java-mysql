<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%
    if(session.getAttribute("dni") == null){
        session.invalidate();
        response.sendRedirect("banca_por_internet.html");
        return;
    }
%>


<!DOCTYPE html>
<html lang="es">
<head>
    <title>Banca por Internet - Interbank</title>
    <link rel="icon" href="Imagenes/titulo_pagina.png">
    <meta property="og:title" content="Banca por Internet - Interbank">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="Css/inicio.css?163215">
    <link rel="stylesheet" href="Css/estilos.css?15678">
    <script src="Js/transferencia.js"></script>
</head>

<body>
    <nav class="menu">
        <section class="menu__container">
            <a  href="INICIO.html">
                 <h1 class="menu__logo"><img src="Imagenes/logo_cab.png" width="200" height="40"></h1>
            </a>
            <ul class="menu__links">
                <li class="menu__item">
                    <a href="inicio.jsp" class="menu__link">Inicio</a>
                </li>
                <li class="menu__item">
                    <a href="Mis_Productos.jsp" class="menu__link">Mis productos</a>
                </li><!-- comment -->
 
                <li class="menu__item">
                    <a href="Mis_Operaciones.jsp" class="menu__link">Mis operaciones</a>
                </li><!-- comment -->
                <li class="menu__item">
                  <a href="Te_Ofrecemos.jsp" class="menu__link">Te ofrecemos</a>
              </li><!-- comment -->
                <li class="menu__item">
                    <a href="#" class="menu__link">Ayuda</a>
                </li>
 
                <li class="menu__item menu__item--show">
 
                <button id="usuario" class="menu__link">
                  <%=session.getAttribute("nombreUsuario")%> <img src="Imagenes/arrow.svg" class="menu__arrow">
                </button>
                    <ul class="menu__nesting">
                        <li class="menu__inside">
                            <a href="Perfil.jsp" class="menu__link menu__link--inside">Mi perfil</a>
                        </li>
                        <li class="menu__inside">
                            <a href="Configuraciones.jsp" class="menu__link menu__link--inside">Configuraciones</a>
                        </li>
                        <li class="menu__inside">
                            <a href="Claves.jsp" class="menu__link menu__link--inside">Clave y contraseñas</a>
                        </li>
                        <li class="menu__inside">
                            <a href="CerrarSesion" class="menu__link menu__link--inside">Cerrar Sesion</a>
                        </li>
                    </ul>
 
                </li>
            </ul>
        </section>  
    </nav>
    
    <div class="all">
        <div class="container-inicio">
          <div class="cards container_dinero" >
            <img class="subtitles" src="Imagenes/consultaimg.png">
            <div id="dinero" class="muestraCuenta">
              <img src="Imagenes/logocuentaahorros.png">
              <div id="textcuenta">Cuenta</div>
              <div id="textsimbolo">S/</div>
              <div id="textdinero"><%=session.getAttribute("montoUsuario")%></div>
              <div id="textito">Saldo disponible</div>
            </div>
            <img id="benefit" src="Imagenes/benefitimg.png">
          </div>
          <div class="cards">
            <img class="subtitles" src="Imagenes/transfiereimg.png">
            <div class="container-form">
              <img src="Imagenes/resource1.png">
              <form class="transferencia-form">
                <label for="tipo_de_cuenta">Transferir a</label> <br>
                <div class="custom-select">
                  <select name="tipo_de_cuenta" class="select-transferencia" id="tipo_de_cuenta">
                    <option value="cuenta_corriente">A cuenta propia</option>
                    <option value="">A otra cuenta Interbank</option>
                    <option value="">A otro banco</option>
                    <option value="">Al exterior</option>
                  </select>
                </div>
                <div class="custom-select">
                  <select class="select-transferencia" id="cuentaEmisora" name="cuentaEmisora">
                    <option value='<%=session.getAttribute("nroCuentaUsuario")%>'>Cuenta Simple Soles <%=session.getAttribute("nroCuentaUsuario")%></option>
                  </select>
                </div>
                <div class="custom-select">
                  <select class="select-transferencia" id="">
                    <option value="cuenta_corriente">Cuenta Ahorro Soles</option>
                    <option value="cuenta_corriente">Cuenta Ahorro Dolares</option>
                    <option value="cuenta_corriente">Cuenta Simple Soles</option>
                    <option value="cuenta_corriente">Cuenta Simple Dolares </option>
                  </select>
                </div>
                <div class="custom-select">
                  <label for="nro_cuenta_destinatario">Numero de cuenta destino</label>
                  <input type="text" id="nroCuentaDestinatario" name="nroCuentaDestinatario" class="nroCuenta">
                </div>
                <div class="mini-select">
                  <select class="select-transferencia" id="moneda" name="moneda">
                    <option value="cuenta_corriente">Soles</option>
                    <option value="cuenta_corriente">Dolares</option>
                  </select>
                </div>
                <div id="monto_a_trans" class="mini-select">
                  <input type="text" placeholder="Monto" id="monto" name="monto">
                </div>
                <p class="message_error" name="mensaje" id="mensaje"></p>
                <button class="btn" id="btnTransferir" type="button">Transferir</button>
              </form>
            </div>
            <!-- <div class="minititle">Transfiere</div> -->
          </div>
          <div class="cards" id="container3">
            <img id="tercero" class="subtitles" src="Imagenes/pagaorecargaimg.png">
            <img src="Imagenes/resource2.png"><br>
            <span class="subtitle1">Iniciar Pago o Recarga</span><br>
            <span class="subtitle2" >Selecciona la operacion que deseas realizar</span>
            <div class="container_servicios">
              <div>
                <input type="radio" name="radio_servicio" id=""> Pago de servicios <br>
              </div>
              <div>
                <input type="radio" name="radio_servicio" id=""> Pago de institucion o empresas
              </div>
              <div>
                <input type="radio" name="radio_servicio" id=""> Pago de tarjetas de credito
              </div>
              <div>
                <input type="radio" name="radio_servicio" id=""> Pago de cuenta de Prestamos
              </div>
              <div>
                <input type="radio" name="radio_servicio" id=""> Pago SUNAT NPS
              </div>
              <div>
                <input type="radio" name="radio_servicio" id=""> Recarga de celular
              </div>
              <div>
                <input type="radio" name="radio_servicio" id=""> Recarga de billetera movil
              </div>
              <div>
                <input type="radio" name="radio_servicio" id=""> Donacion
              </div>
            </div>
          </div>
        </div>
      </div>


    <script src="Js/app.js"></script>
</body>

</html>