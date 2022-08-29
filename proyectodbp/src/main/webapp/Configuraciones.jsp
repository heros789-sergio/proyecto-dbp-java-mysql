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
    <link rel="icon" href="css/titulo_pagina.png">
    <meta property="og:title" content="Banca por Internet - Interbank">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="Css/Configuraciones.css">
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
                   <a href="#" class="menu__link">Ayuda</a>
               </li>

               <li class="menu__item menu__item--show">

               <button id="usuario" class="menu__link">
                       Luciana Julissa  <img src="Imagenes/arrow.svg" class="menu__arrow">
               </button>
                   <ul class="menu__nesting">
                       <li class="menu__inside">
                           <a href="Perfil.jsp" class="menu__link menu__link--inside">Mi perfil</a>
                       </li>
                       <li class="menu__inside">
                           <a href="Configuraciones.jsp" class="menu__link menu__link--inside">Configuraciones</a>
                       </li>
                       <li class="menu__inside">
                           <a href="Claves.jsp" class="menu__link menu__link--inside">Clave y contrasenas</a>
                       </li>
                       <li class="menu__inside">
                           <a href="CerrarSesion" class="menu__link menu__link--inside">Cerrar Sesion</a>
                       </li>
                   </ul>

               </li>
           </ul>
       </section>  
   </nav>
 
    <section id="main-content">
            <div id="main-content-header">
                <header>
                        <titulo>Configuraciones</titulo>
                        <p style="font-size: 15px">Podrás verificar tus datos , definir tu límite transaccional,realizar solicitudes o afiliaciones y bloquear tu tarjeta por pérdida o robo</p>

                </header> 
            </div>
            <section id="datos_perfil">
                 <header>
                        <div >
                          <p2>Mi información</p2>
                          <br><a id="subti" href="#">Límites transaccionales</a><br>
                        </div>
                        <div >
                          <p2>Solicitudes</p2>
                          <br><a id="subti" href="#">Avísanos si sales de viaje</a><br>
                        </div>
                        <div>
                          <p2>Afiliaciones</p2>
                          <br><a id="subti" href="#">Operaciones frecuentes</a>
                          <br><a id="subti" href="#">Pago automático</a>
                          <br><a id="subti" href="#">Configuración de tarjeta</a>
                          <br><a id="subti" href="#">Desafiliar clave SMS</a>
                        </div>
                        <div>
                            <p2>Notificaciones</p2><br>
                            <p2>Bloqueo de tarjeta</p2>
                        </div>
                </header> 
            </section>
            <section id="datos_email">
                <header>
                    <div id="titulo2" >
                         <titulo>Límite de transacciones</titulo>                      
                    </div>
                    <br>
                       <p>Incrementa o disminuye el límite diario para las transaccciones que hagas desde tu Banca por Internet e Interbank App.</p>
                    <div id="titulo2" >
                        <img src="Imagenes/Configuracion.png" id="imagen_limite" width="500" height="300">
                    </div>
                    <a href="#" class="boton_editar">Cambiar límites</a>
                </header> 
           </section>
    
    <script src="Js/app.js"></script>
</body>
</html>