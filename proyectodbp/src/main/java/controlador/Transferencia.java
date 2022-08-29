package controlador;

// import javax.servlet.annotation.WebServlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.BDConexion;
import modelo.UsuarioBD;
import java.sql.ResultSet;
import java.sql.SQLException;

// @WebServlet(name="Transferencia", urlPatterns={"/Transferencia"})
public class Transferencia extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cuentaEmisora = request.getParameter("cuentaEmisora");
        String cuentaDestinatario = request.getParameter("cuentaDestinatario");
        double montoTransf =  Double.parseDouble(request.getParameter("monto"));
        BDConexion conn = new BDConexion();
        UsuarioBD usuarioBD = new UsuarioBD();
        usuarioBD.setConexion(conn);
        usuarioBD.hacerTransferencia(cuentaEmisora, cuentaDestinatario, montoTransf);
        HttpSession session = request.getSession();
        String dniUsuario = usuarioBD.getDNIUsuario(cuentaEmisora);
        float montoUsuario = usuarioBD.getMontoUsuario(dniUsuario);
        session.setAttribute("montoUsuario", montoUsuario);
        PrintWriter out = response.getWriter();

        String nroCuentaUsuario = usuarioBD.getNroCuentaUsuario(dniUsuario);
        int numPagos = usuarioBD.getNumeroPagos(nroCuentaUsuario);
        int numIngresos = usuarioBD.getNumeroIngresos(nroCuentaUsuario);
        ResultSet todosLosPagosUsuario = usuarioBD.getAllPagos(nroCuentaUsuario);
        ResultSet todosLosIngresosUsuario = usuarioBD.getAllDepositosAmiCuenta(nroCuentaUsuario);

        session.setAttribute("numeroPagos", numPagos);
        session.setAttribute("numeroIngresos", numIngresos);
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



        // out.println("OK");
        out.println("<script type=\"text/javascript\">");
        out.println("alert('TRANSFERENCIA REALIZADA CON EXITO');");
        out.println("</script>");
    }
}
