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
    <link rel="stylesheet" href="Css/Perfil.css">
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
                   <a href="#" class="menu__link">Mis operaciones</a>
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
                           <a href="Claves.html" class="menu__link menu__link--inside">Clave y contrasenas</a>
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
                    <titulo>Mi Perfil</titulo>
                    <p>Podrás verificar tu información,celular,dirección y email afiliado</p>
            </header> 
        </div>
            <section id="datos_perfil">
                 <header>
                        <div style="background: url(CSS/icon-profile.svg);">
                           <img src="Imagenes/icon-profile.af4f4979.svg" align="left"><titulo>Mis Datos</titulo>
                        </div>
                        <br><p1>Nombres: <%=session.getAttribute("nombreUsuario")%></p1><br>
                        <p1>Apellidos: <%=session.getAttribute("apellidoUsuario")%> </p1><br>
                        <p1>DNI: <%=session.getAttribute("dni")%></p1><br>
                        <p1>Celular: 987654123</p1><br>
                        <p1>Celular afiliado a Clave SMS: 124578</p1><br>
                        <a href="#">Cambio de operador</a><br>
                        <p1>Direccion principal:</p1><br>
                        <p>Si deseas actualizar tus datos en MiPerfil , comunicatecon nuestra Banca telefonica al 311-9000 si estas en Lima y 
                               0801-00802 si estas en Provincias</p><br>

                      <a class="boton_ultimo">Último ingreso:</a>
                </header> 
            </section>
            <section id="datos_email">
                <header>
                       <div style="background: url(CSS/icon-profile.svg);">
                          <img src="Imagenes/icon-email.6a6aa76a.svg" align="left"><titulo>E-mail</titulo>                      
                       </div>
                    <br>
                       <p>Tus constancias se enviarán automáticamente a los e-mails que registres aquí:</p>
                       <p1>Personal</p1>
                       <br>
                       <p1>Laboral</p1>
                       <p>No registrado</p>
                       <a href="#" class="boton_editar">Editar e-mail</a>
               </header> 
           </section>
    
    <script src="Js/app.js"></script>
</body>
</html>