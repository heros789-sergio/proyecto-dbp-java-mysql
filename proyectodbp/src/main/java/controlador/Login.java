package controlador;

import javax.servlet.annotation.WebServlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.ResultSet;
import java.sql.SQLException;
import modelo.BDConexion;
import modelo.UsuarioBD;

@WebServlet(name="Login", urlPatterns={"/Login"})
public class Login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String dni = request.getParameter("dni");
        String clave_web = request.getParameter("clave_web");
        BDConexion conn = new BDConexion();
        UsuarioBD usuarioBD = new UsuarioBD();
        usuarioBD.setConexion(conn);

        boolean acceso = usuarioBD.validarUsuario(dni, clave_web);
        String nombreUsuario = usuarioBD.getNombreUsuario(dni);
        String apellidosUsuario = usuarioBD.getApellidoUsuario(dni);
        String direccionUsuario = usuarioBD.getDireccionUsuario(dni);
        String nroCuentaUsuario = usuarioBD.getNroCuentaUsuario(dni);
        float montoUsuario = usuarioBD.getMontoUsuario(dni);
        
        int numPagos = usuarioBD.getNumeroPagos(nroCuentaUsuario);
        int numIngresos = usuarioBD.getNumeroIngresos(nroCuentaUsuario);
        ResultSet todosLosPagosUsuario = usuarioBD.getAllPagos(nroCuentaUsuario);
        ResultSet todosLosIngresosUsuario = usuarioBD.getAllDepositosAmiCuenta(nroCuentaUsuario);

        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        if(acceso){
            session.setAttribute("dni", dni);
            session.setAttribute("clave_web", clave_web);
            session.setAttribute("nombreUsuario", nombreUsuario);
            session.setAttribute("apellidoUsuario", apellidosUsuario);
            session.setAttribute("direccionUsuario", direccionUsuario);
            session.setAttribute("nroCuentaUsuario", nroCuentaUsuario);
            session.setAttribute("numeroPagos", numPagos);
            session.setAttribute("numeroIngresos", numIngresos);
            session.setAttribute("montoUsuario", montoUsuario);
            out.println("OK");
        } else {
            session.invalidate();
            out.println("Usuario y/o clave incorrectos");
        }

        try{
            int i=1;
            while(todosLosPagosUsuario.next()) {
                session.setAttribute("receptoraTransferencia"+i+"", todosLosPagosUsuario.getString("cuenta_receptora"));
                session.setAttribute("fechaTransferencia"+i+"", todosLosPagosUsuario.getString("fecha"));
                session.setAttribute("horaTransferencia"+i+"", todosLosPagosUsuario.getString("hora"));
                session.setAttribute("montoTransferencia"+i+"", todosLosPagosUsuario.getFloat("monto"));
                i++;
            }
            
        }catch (SQLException e) {
            System.out.println("Error UsuarioBD.getMontoUsuario"+e.getMessage());
        }

        try{
            int i=1;
            while(todosLosIngresosUsuario.next()) {
                session.setAttribute("emisoraTransferencia"+i+"", todosLosIngresosUsuario.getString("cuenta_emisora"));
                session.setAttribute("fechaTransferenciaReci"+i+"", todosLosIngresosUsuario.getString("fecha"));
                session.setAttribute("horaTransferenciaReci"+i+"", todosLosIngresosUsuario.getString("hora"));
                session.setAttribute("montoTransferenciaReci"+i+"", todosLosIngresosUsuario.getFloat("monto"));
                i++;
            }
            
        }catch (SQLException e) {
            System.out.println("Error UsuarioBD.getMontoUsuario"+e.getMessage());
        }
    }
}