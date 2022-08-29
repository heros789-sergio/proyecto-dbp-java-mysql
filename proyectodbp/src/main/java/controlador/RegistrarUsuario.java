package controlador;

// import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
// import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.BDConexion;
import modelo.UsuarioBD;
//import org.apache.commons.fileupload.FileItem;
//import org.apache.commons.fileupload.disk.DiskFileItemFactory;
//import org.apache.commons.fileupload.servlet.ServletFileUpload;


@WebServlet(name="RegistrarUsuario", urlPatterns={"/RegistrarUsuario"})
public class RegistrarUsuario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try{
        
        String dni = request.getParameter("num_dni");
        
        //String dni = "12345678";
        String nombres = (String)request.getParameter("nombres");
        String apellidos = (String)request.getParameter("apellidos");
        String direccion = (String)request.getParameter("direccion");
        String email = (String)request.getParameter("email");
        String clave_web = (String)request.getParameter("clave_web");
        
        out.println("<script type=\"text/javascript\">");
        // out.println("alert('"+dni+"');");
        // out.println("alert('"+clave_web+"');");
        out.println("location = 'index.html';");
        out.println("</script>");

        BDConexion conn = new BDConexion();
        UsuarioBD usuarioBD = new UsuarioBD();
        usuarioBD.setConexion(conn);
        usuarioBD.registrarUsuario(dni,nombres,apellidos,direccion,email,clave_web);
        conn.desconectar();
        
        out.println("<script type=\"text/javascript\">");
        out.println("alert('USUARIO REGISTRADO CON EXITO');");
        out.println("location = 'index.html';");
        out.println("</script>");
        }
        catch(Exception ex){
            System.out.println("Excepcion: "+ex.toString());
            out.println("<script type=\"text/javascript\">");
            out.println("alert('ERROR AL REGISTRAR USUARIO');");
            out.println("location = 'abre_tu_cuenta.html';");
            out.println("</script>");
        }
    }
}
