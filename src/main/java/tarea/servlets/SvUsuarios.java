/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package tarea.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import tarea.DAO.UsuarioDAO;
import tarea.clases.Usuario;

/**
 *
 * @author Jhopon
 */
@WebServlet(name = "SvUsuarios", urlPatterns = {"/Usuarios"})
public class SvUsuarios extends HttpServlet {

    //////////// Array de Usuarios /////////////////////////////////
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UsuarioDAO usuarioDAO = new UsuarioDAO();

        List<Usuario> listaUsuarios = usuarioDAO.obtenerUsuarios();

        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("listaUsuarios", listaUsuarios);
        miSesion.setAttribute("activarModalLista", true);

        response.sendRedirect("index.jsp");
        // processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //////// Eliminación//////////////////////////////
        
        String eliminar = request.getParameter("eliminar");
        if (eliminar != null) {
            doDelete(request, response);
        }

        ///////////////////////////////////////////////////
        
        else{
        
        String nombre = request.getParameter("nombre");
        String tipoUsuario = request.getParameter("tipoUsuario");
        String pass = request.getParameter("pass");

        Usuario usuario = new Usuario();
        usuario.setNombre(nombre);
        usuario.setTipoUsuario(tipoUsuario);
        usuario.setPass(pass);

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        usuarioDAO.crearUsuario(usuario);

        System.out.println(usuarioDAO.getResultadoOperacion());

        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("activarModalRegistro", true);
        miSesion.setAttribute("nombre", usuarioDAO.getResultadoOperacion());

        response.sendRedirect("index.jsp");
        }
        
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombre = request.getParameter("eliminar");
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        usuarioDAO.eliminarUsuario(nombre);
        System.out.println("Eliminado USaurio " + nombre);
        
        List<Usuario> listaUsuarios = usuarioDAO.obtenerUsuarios();
        
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("activarModalLista", true);
        miSesion.setAttribute("eliminacion", true);
        miSesion.setAttribute("listaUsuarios", listaUsuarios);
        miSesion.setAttribute("nombre", usuarioDAO.getMensajeEliminacion());

        response.sendRedirect("index.jsp");
    }

    @Override
    public String getServletInfo() {

        return "Short description";
    }// </editor-fold>

}
