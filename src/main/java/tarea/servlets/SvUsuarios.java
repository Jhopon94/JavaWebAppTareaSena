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
import tarea.clases.Usuario;

/**
 *
 * @author Jhopon
 */
@WebServlet(name = "SvUsuarios", urlPatterns = {"/Usuarios"})
public class SvUsuarios extends HttpServlet {
    
    //////////// Array de Usuarios /////////////////////////////////
    private ArrayList<Usuario> listaUsuarios = new ArrayList<>();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
    }

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("listaUsuarios", listaUsuarios);
        miSesion.setAttribute("activarModalLista", true);
        
        response.sendRedirect("index.jsp");
       // processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            String nombre = request.getParameter("nombre");
            String tipoUsuario = request.getParameter("tipoUsuario");
            String pass = request.getParameter("pass");
            
            listaUsuarios.add(new Usuario(nombre, tipoUsuario, pass));
            System.out.println("Agregado: " + nombre);
            
            HttpSession miSesion = request.getSession();
            miSesion.setAttribute("activarModalRegistro", true);
            miSesion.setAttribute("nombre", nombre);
        
            response.sendRedirect("index.jsp");
        //processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        
        
        return "Short description";
    }// </editor-fold>

}
