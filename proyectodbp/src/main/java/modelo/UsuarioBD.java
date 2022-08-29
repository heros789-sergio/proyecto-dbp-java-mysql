package modelo;

import java.sql.*;
// import java.sql.PreparedStatement;
// import java.sql.ResultSet;
// import java.sql.SQLException;

public class UsuarioBD {
    private BDConexion conn;
    
    public void setConexion(BDConexion conn){
        this.conn = conn;
    }
    public BDConexion getConexion() {
        return this.conn;
    }
    
    public boolean validarUsuario(String dni, String clave_web) {
        try{
            String sql = "SELECT * FROM clientes";
            PreparedStatement preparedStatement = conn.getConexion().prepareStatement(sql);
            ResultSet rs =  preparedStatement.executeQuery();
            while(rs.next()) {
                if(rs.getString("dni").equals(dni) && rs.getString("clave_web").equals(clave_web)) {
                    return true;
                }
            }
        } catch(SQLException e) {
            System.out.println("Error UsuarioDB.validarUsuario" + e.getMessage());
        }
        return false;
    }
    
    public void registrarUsuario(String dni, String nombres, String apellidos, String direccion, String email ,String clave_web){
        try{
            String n_cuenta = "";
            String sql1 = "SELECT * FROM clientes";
            PreparedStatement preparedStatement1 = conn.getConexion().prepareStatement(sql1);
            ResultSet rs = preparedStatement1.executeQuery();
            while(rs.next()) {
                n_cuenta = rs.getString("numero_cuenta");
            }
            long num_cuenta = Long.parseLong(n_cuenta);
            num_cuenta = num_cuenta + 1;
            n_cuenta= Long.toString(num_cuenta);

            String sql = "INSERT INTO clientes(dni,nombres,apellidos,direccion,email,numero_cuenta,clave_web) VALUES ("+dni+",'"+nombres+"','"+apellidos+"','"+direccion+"','"+email+"','"+n_cuenta+"','"+clave_web+"')";
            PreparedStatement preparedStatement = conn.getConexion().prepareStatement(sql);
            preparedStatement.executeQuery();
        } catch (SQLException e) {
            System.out.println("Error UsuarioBD.registrarUsuario"+e.getMessage());
        }
    }

    public void hacerTransferencia(String cuentaEmisora, String cuentaDestinatario, double monto){
        try{
            // Cuenta Emisora
            String sql1 = "SELECT monto_dinero FROM clientes WHERE numero_cuenta='"+cuentaEmisora+"'";
            PreparedStatement preparedStatement1 = conn.getConexion().prepareStatement(sql1);
            ResultSet rs = preparedStatement1.executeQuery();
            double dineroCuentaEmisora = 0;
            while(rs.next()) {
                dineroCuentaEmisora = rs.getDouble("monto_dinero");
            }
            dineroCuentaEmisora = dineroCuentaEmisora - monto;

            String sql2 = "UPDATE clientes SET monto_dinero = '"+dineroCuentaEmisora+"' WHERE clientes.numero_cuenta='"+cuentaEmisora+"'";
            PreparedStatement preparedStatement2 = conn.getConexion().prepareStatement(sql2);
            preparedStatement2.executeQuery();

            // Cuenta Receptora
            String sql3 = "SELECT monto_dinero FROM clientes WHERE numero_cuenta='"+cuentaDestinatario+"'";
            PreparedStatement preparedStatement3 = conn.getConexion().prepareStatement(sql3);
            ResultSet rs2 = preparedStatement3.executeQuery();
            double dineroCuentaDestinatario = 0;
            while(rs2.next()) {
                dineroCuentaDestinatario = rs2.getDouble("monto_dinero");
            }
            dineroCuentaDestinatario = dineroCuentaDestinatario + monto;

            String sql4 = "UPDATE clientes SET monto_dinero = '"+dineroCuentaDestinatario+"' WHERE clientes.numero_cuenta='"+cuentaDestinatario+"'";
            PreparedStatement preparedStatement4 = conn.getConexion().prepareStatement(sql4);
            preparedStatement4.executeQuery();

            //Agregar al historial de transacciones
            String sql5 = "INSERT INTO transacciones (cuenta_receptora,cuenta_emisora,monto,fecha,hora) VALUES ('"+cuentaDestinatario+"', '"+cuentaEmisora+"', '"+monto+"', CURDATE(), CURRENT_TIME())";
            PreparedStatement preparedStatement5 = conn.getConexion().prepareStatement(sql5);
            preparedStatement5.executeQuery();

        } catch (SQLException e) {
            System.out.println("Error UsuarioBD.hacerTransferencia"+e.getMessage());
        }
    }

    public String getNombreUsuario(String dni) {
        String nombresUsuario = "";
        try {
            String sql = "SELECT nombres FROM clientes WHERE dni='"+dni+"'";
            PreparedStatement preparedStatement1 = conn.getConexion().prepareStatement(sql);
            ResultSet rs = preparedStatement1.executeQuery();
            while(rs.next()) {
                nombresUsuario = rs.getString("nombres");
            }
        } catch (SQLException e) {
            System.out.println("Error UsuarioBD.getNombreUsuario"+e.getMessage());
        }
        return nombresUsuario;
    }

    public String getApellidoUsuario(String dni) {
        String apellidosUsuario = "";
        try {
            String sql = "SELECT apellidos FROM clientes WHERE dni='"+dni+"'";
            PreparedStatement preparedStatement1 = conn.getConexion().prepareStatement(sql);
            ResultSet rs = preparedStatement1.executeQuery();
            while(rs.next()) {
                apellidosUsuario = rs.getString("apellidos");
            }
        } catch (SQLException e) {
            System.out.println("Error UsuarioBD.getApellidoUsuario"+e.getMessage());
        }
        return apellidosUsuario;
    }

    public String getDireccionUsuario(String dni) {
        String direccionUsuario = "";
        try {
            String sql = "SELECT direccion FROM clientes WHERE dni='"+dni+"'";
            PreparedStatement preparedStatement1 = conn.getConexion().prepareStatement(sql);
            ResultSet rs = preparedStatement1.executeQuery();
            while(rs.next()) {
                direccionUsuario = rs.getString("direccion");
            }
        } catch (SQLException e) {
            System.out.println("Error UsuarioBD.getDireccionUsuario"+e.getMessage());
        }
        return direccionUsuario;
    }

    public String getNroCuentaUsuario(String dni) {
        String nroCuenta = "";
        try {
            String sql = "SELECT numero_cuenta FROM clientes WHERE dni='"+dni+"'";
            PreparedStatement preparedStatement1 = conn.getConexion().prepareStatement(sql);
            ResultSet rs = preparedStatement1.executeQuery();
            while(rs.next()) {
                nroCuenta = rs.getString("numero_cuenta");
            }
        } catch (SQLException e) {
            System.out.println("Error UsuarioBD.getNroCuentaUsuario"+e.getMessage());
        }
        return nroCuenta;
    }

    public String getDNIUsuario(String cuentaEmisora) {
        String dni = "";
        try {
            String sql = "SELECT dni FROM clientes WHERE numero_cuenta='"+cuentaEmisora+"'";
            PreparedStatement preparedStatement1 = conn.getConexion().prepareStatement(sql);
            ResultSet rs = preparedStatement1.executeQuery();
            while(rs.next()) {
                dni = rs.getString("dni");
            }
        } catch (SQLException e) {
            System.out.println("Error UsuarioBD.getNroCuentaUsuario"+e.getMessage());
        }
        return dni;
    }

    public float getMontoUsuario(String dni) {
        float montoUsuario = 0;
        try {
            String sql = "SELECT monto_dinero FROM clientes WHERE dni='"+dni+"'";
            PreparedStatement preparedStatement1 = conn.getConexion().prepareStatement(sql);
            ResultSet rs = preparedStatement1.executeQuery();
            while(rs.next()) {
                montoUsuario = rs.getFloat("monto_dinero");
            }
        } catch (SQLException e) {
            System.out.println("Error UsuarioBD.getMontoUsuario"+e.getMessage());
        }
        return montoUsuario;
    }

    public int getNumeroPagos(String nroCuenta){
        int numPagos = 0;
        try {
            String sql = "SELECT COUNT('cuenta_emisora') FROM `transacciones` WHERE cuenta_emisora='"+nroCuenta+"'";
            PreparedStatement preparedStatement1 = conn.getConexion().prepareStatement(sql);
            ResultSet rs = preparedStatement1.executeQuery();
            while(rs.next()) {
                numPagos = rs.getInt("COUNT('cuenta_emisora')");
            }
        } catch (SQLException e) {
            System.out.println("Error UsuarioBD.getMontoUsuario"+e.getMessage());
        }
        return numPagos;
    }

    public int getNumeroIngresos(String nroCuenta){
        int numPagos = 0;
        try {
            String sql = "SELECT COUNT('cuenta_receptora') FROM `transacciones` WHERE cuenta_receptora='"+nroCuenta+"'";
            PreparedStatement preparedStatement1 = conn.getConexion().prepareStatement(sql);
            ResultSet rs = preparedStatement1.executeQuery();
            while(rs.next()) {
                numPagos = rs.getInt("COUNT('cuenta_emisora')");
            }
        } catch (SQLException e) {
            System.out.println("Error UsuarioBD.getMontoUsuario"+e.getMessage());
        }
        return numPagos;
    }

    public ResultSet getAllPagos(String nroCuenta){
        ResultSet res;
        try {
            String sql = "SELECT * FROM transacciones WHERE cuenta_emisora='"+nroCuenta+"'";
            PreparedStatement preparedStatement1 = conn.getConexion().prepareStatement(sql);
            res = preparedStatement1.executeQuery();
            return res;
        } catch (SQLException e) {
            System.out.println("Error UsuarioBD.getMontoUsuario"+e.getMessage());
        }
        return null;
    }

    public ResultSet getAllDepositosAmiCuenta(String nroCuenta) {
        ResultSet res;
        try {
            String sql = "SELECT * FROM transacciones WHERE cuenta_receptora='"+nroCuenta+"'";
            PreparedStatement preparedStatement1 = conn.getConexion().prepareStatement(sql);
            res = preparedStatement1.executeQuery();
            return res;
        } catch (SQLException e) {
            System.out.println("Error UsuarioBD.getMontoUsuario"+e.getMessage());
        }
        return null;
    }
}
