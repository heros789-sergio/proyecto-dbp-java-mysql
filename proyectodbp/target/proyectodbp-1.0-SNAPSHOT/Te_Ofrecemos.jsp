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
    <link rel="stylesheet" href="Css/Te_Ofrecemos.css?1564156">
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
    <div class="container">
        <div class="contenedor">
            <div class="cuadro_titulo">
                <titulo>Productos pensados para ti</titulo>
                <hr>
            </div>
                <button onclick="location.href='#'" type="button" id="boton1"></button>
                <button onclick="location.href='#'" type="button" id="boton2"></button>
                <button onclick="location.href='#'" type="button" id="boton3"></button>
                <button onclick="location.href='#'" type="button" id="boton4"></button>  
            </div>
    </div>
</body>
</html>