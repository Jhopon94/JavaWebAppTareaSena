package tarea.DAO;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import tarea.clases.Usuario;

public class UsuarioDAO {

    private String url;
    private String user;
    private String password;

    String resultadoOperacion;
    String mensajeEliminacion;
    String mensajeEdicion;

    public UsuarioDAO() {
        try {
            Properties prop = new Properties();
            InputStream input = getClass().getClassLoader().getResourceAsStream("config.properties");
            prop.load(input);

            url = prop.getProperty("db.url");
            user = prop.getProperty("db.username");
            password = prop.getProperty("db.password");

            // Cargar el driver de MySQL
            Class.forName("com.mysql.jdbc.Driver");
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        mensajeEliminacion = "Eliminación Exitosa!";
        mensajeEdicion = "Actualización Exitosa!";
    }

    public void crearUsuario(Usuario usuario) {
        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            String query = "INSERT INTO usuarios (nombre, tipoUsuario, pass) VALUES (?, ?, ?)";
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setString(1, usuario.getNombre());
                pstmt.setString(2, usuario.getTipoUsuario());
                pstmt.setString(3, usuario.getPass());
                pstmt.executeUpdate();
                resultadoOperacion = "Usuario Registrado!";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            resultadoOperacion = "Registro Fallido!";
        }
    }

    public List<Usuario> obtenerUsuarios() {
        List<Usuario> usuarios = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            String query = "SELECT * FROM usuarios";
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                try (ResultSet rs = pstmt.executeQuery()) {
                    while (rs.next()) {
                        Usuario usuario = new Usuario();
                        usuario.setNombre(rs.getString("nombre"));
                        usuario.setTipoUsuario(rs.getString("tipoUsuario"));
                        usuario.setPass(rs.getString("pass"));
                        usuarios.add(usuario);
                    }
                    resultadoOperacion = "Búsqueda Exitosa!";
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            resultadoOperacion = "Búsqueda Fallido!";
        }
        return usuarios;
    }

    public void actualizarUsuario(Usuario usuario) {
        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            String query = "UPDATE usuarios SET tipoUsuario = ?, pass = ? WHERE nombre = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setString(1, usuario.getTipoUsuario());
                pstmt.setString(2, usuario.getPass());
                pstmt.setString(3, usuario.getNombre());
                pstmt.executeUpdate();
                resultadoOperacion = "Actualización Exitosa!";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            resultadoOperacion = "Actualización Fallida !";
        }
    }

    public void eliminarUsuario(String nombreUsuario) {
        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            String query = "DELETE FROM usuarios WHERE nombre = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setString(1, nombreUsuario);
                pstmt.executeUpdate();
                resultadoOperacion = "Usuario Eliminado!";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            resultadoOperacion = "Eliminación Fallida !";
        }
    }

    public String getResultadoOperacion() {
        return resultadoOperacion;
    }
    
    public String getMensajeEliminacion(){
        return mensajeEliminacion;
    }
    
    public String getMensajeEdicion(){
        return mensajeEdicion;

    }


}
