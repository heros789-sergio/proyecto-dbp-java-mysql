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
    <link rel="icon" href="Css/titulo_pagina.png">
    <meta property="og:title" content="Banca por Internet - Interbank">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="Css/Mis_Productos.css?19754">
</head>
<body>
    <nav class="menu">
       <section class="menu__container">
           <a  href="#">
                <h1 class="menu__logo"><img src="Imagenes/logo_cab.png" width="200" height="40"></h1>
           </a>
           <ul class="menu__links">
               <li class="menu__item">
                   <a href="inicio.jsp" class="menu__link">Inicio</a>
               </li>
               <li class="menu__item">
                   <a href="Mis_Productos.jsp" class="menu__link">Mis productos</a>
               </li>
               <li class="menu__item">
                   <a href="Mis_Operaciones.jsp" class="menu__link">Mis operaciones</a>
               </li>
                <li class="menu__item">
                   <a href="Te_Ofrecemos.jsp" class="menu__link">Te ofrecemos</a>
               </li>
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
                           <a href="Clave.jsp" class="menu__link menu__link--inside">Clave y contrasenas</a>
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
                    <titulo3>Detalle de la cuenta:</titulo3>
                    <select name="" id="" class="cuentaSelect">
                        <option value="">Cuenta</option>
                        <option value="despues se llena">Cuenta Simple Soles 3003314747231</option>
                    </select>
            </header> 
        </div>
            <section id="datos_perfil">
                 <header>
                        <div>
                            <img src="Imagenes/Chanchito.png" align="left"><br><p5> Cuenta </p5>
                        </div>
                        <br><p1> </p1><br>
                        <a href="#" style="color: #2ECC71;"> Compartir: </a><br>
                        <p1>Saldo disponible</p1><br>
                        <p8>S/<%=session.getAttribute("montoUsuario")%></p8><br>
                        
                       <a href="#" class="boton_editar">Iniciar una operación</a>
                </header> 
            </section>
            <section id="datos_email">
                <header>
                        <div>
                            <h1 style="color: #2ECC71; font-weight: bold; text-align: right; font-size:20px;margin: 20px 50px;" >Mis movimientos</h1><hr>                     
                        </div> 
                        <div class="datos_mov">
                             <div>
                                <a id="compartir" href="#" style="color: #2980B9; text-align: center; font-size:15px;" >Compartir movimientos</a>
                                <a id="descargar" href="#" style="color: #2980B9; text-align: center; font-size:15px;" >Descargar movimientos</a>
                                <div class="containerTransferencias">
                                    <%
                                        int i=1;
                                        int j=1;
                                        String espacio = " ";
                                        Object dato1 = session.getAttribute("numeroPagos");
                                        Object dato2 = session.getAttribute("numeroIngresos");
                                        int max1 = (int) dato1;
                                        int max2 = (int) dato2;
                                    %>
                                    <table>
                                        <thead>
                                            <th class="cargoNroCuenta">Cargo realizado por</th>
                                            <th class="fechayhora">Fecha y Hora</th>
                                            <th class="monto">Monto</th>
                                        </thead>
                                        <tbody>
                                            <%while ( i <= max1 ){ %>
                                                <tr>
                                                    <td class="cargoNroCuenta"><%=session.getAttribute("receptoraTransferencia"+i)%></td>
                                                    <td class="fechayhora">
                                                        <%=session.getAttribute("fechaTransferencia"+i)%>
                                                        <%=espacio%>
                                                        <%=session.getAttribute("horaTransferencia"+i)%>
                                                    </td class="monto">
                                                    <td><%=session.getAttribute("montoTransferencia"+i)%></td>
                                                </tr>
                                            <% 
                                                i++;
                                                } 
                                            %>

                                            <%while ( j <= max2 ){ %>
                                                <tr>
                                                    <td class="cargoNroCuenta"><%=session.getAttribute("emisoraTransferencia"+i)%></td>
                                                    <td class="fechayhora">
                                                        <%=session.getAttribute("fechaTransferenciaReci"+i)%>
                                                        <%=espacio%>
                                                        <%=session.getAttribute("horaTransferenciaReci"+i)%>
                                                    </td class="monto">
                                                    <td><%=session.getAttribute("montoTransferenciaReci"+i)%></td>
                                                </tr>
                                            <% 
                                                j++;
                                                } 
                                            %>
                                        </tbody>
                                    </table>
                                </div>


                            </div>
                        </div>
                                       </header>
                <div class="datos_movimientos">
                </div>
           </section>
        </section>
    <script src="js/app.js"></script>
</body>
</html>