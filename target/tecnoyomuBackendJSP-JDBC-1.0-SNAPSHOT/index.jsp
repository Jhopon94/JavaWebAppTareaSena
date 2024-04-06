<%-- 
    Document   : index
    Created on : 5/04/2024, 7:45:24 p. m.
    Author     : Jhopon
--%>
<%@page import="java.util.ArrayList" %>
<%@page import="tarea.clases.Usuario" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/global.css">
        <link rel="stylesheet" type="text/css" href="css/cabezal.css">

        <% boolean activarModalRegistro = false; %>
        <% boolean activarModalLista = false;%>
        <% String nombreUsuario = ""; %>
        <% ArrayList<Usuario> listaUsuarios = new ArrayList<>(); %>
        <% if(request.getSession().getAttribute("activarModalRegistro") != null){
                boolean aux = (boolean)request.getSession().getAttribute("activarModalRegistro");
                if(aux){
                activarModalRegistro = true;
                nombreUsuario = (String) request.getSession().getAttribute("nombre");
                //Ahora reseteamos los atributos de la sesión
                request.getSession().invalidate();
            }
            } %>
        <% if(request.getSession().getAttribute("activarModalLista") != null){
                
                boolean aux = (boolean)request.getSession().getAttribute("activarModalLista");
                if(aux){
                activarModalLista = true;
                listaUsuarios = (ArrayList) request.getSession().getAttribute("listaUsuarios");
                
                request.getSession().invalidate();
                }
            }; %>

    </head>
    <body>
        <div id="contenedorPrincipalUsuarios">
            <div id="ContenedorPrincipalCabezal">
                <div></div>
                <div id="fondoCabezal">
                    <img alt='' id="logoCabezal" src="./img/logoLogin.png" />
                    <label id="tituloCabezal" >Usuarios</label>
                </div>
                <div id="contCerrarSesion">
                </div>
            </div>
            <div id="contenedorBotonesUsuarios">
                <div id="contBtnRegisUsuarios">
                    <div>
                        <button id="btnRegisUsuarios" class="btnGeneral" onclick="AbrirModalRegistro()">Registrar Usuario</button>
                    </div>
                </div>
                <div id="contBtnListaUsuarios">
                    <form action="Usuarios" method="GET">
                        <button id="btnListaUsuarios" class="btnGeneral" type="submit">Lista de Usuarios</button>
                    </form>
                </div>

            </div>
        </div>

        <!-- Modal para registrar Usuarios -->

        <div class="modalTransparencia" id="modalRegistro">
            <div class="modal">
                <form id='formRegUsuario' action="Usuarios" method="POST">
                    <input class="inputModalRegUsuario"  placeholder="Nombre de Usuario" name="nombre" required/>
                    <select class="inputModalRegUsuario" name="tipoUsuario" required>
                        <option value="" >Selecciona Tipo de Usuario</option>
                        <option value="administrador" >Administrador</option>
                        <option value="contador" >Contador</option>
                        <option value="reparador" >Reparador</option>
                    </select>
                    <input  placeholder='Asignar Contraseña' class="inputModalRegUsuario" name="pass" required>

                    </input>
                    <div id='contBotonesRegUsuario'>
                        <div id="btnRegistrarUsuDiv">
                            <div>
                                <button id="btnRegistrar" class="btnRegistrar" type="submit">Registrar</button>
                            </div>
                        </div>
                        <div id="btnCancelUsuDiv">
                            <div>
                                <button id="btnCancelar" class="btnCancelar" onclick="CerrarModalRegistro()" type="reset">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <!-- Modal para Listar Usuarios -->

        <div class="modalTransparencia" id="modalLista">
            <div class="modal">
                <form id='formListaUsuarios'>
                    <input class='formListaUsuChilds' id='inputFiltroUsu' />
                    <table class='formListaUsuChilds' id="tablaListaUsu" >
                        
                        <%
                        int contador = 1;
                        for(Usuario usu : listaUsuarios){
                        %>
                        <tr id="<%= contador %>" onclick="ManejarClicLista('<%=usu.getNombre()%>', '<%=usu.getTipoUsuario()%>', '<%=usu.getPass()%>')">
                            <td class="filasTabla"><%= usu.getNombre() %></td>
                            <% contador++; %>
                        </tr>
                        <%};%>
                    </table>
                    <div id='contBotonesRegUsuario'>
                        <div id="btnCancelUsuDiv">
                            <div>
                                <button id="btnRegistrar" class="btnCancelar" onclick="CerrarModalLista()">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <!-- Modal para editar Usuarios -->

        <div class="modalTransparencia" id="modalEdicion">
            <div class="modal">
                <div id='formRegUsuario' class="auxFormaEdit">
                    <input id="inputNombre" class="inputModalRegUsuario"  placeholder="Nombre de Usuario" disabled/>
                    <select id="listaTipo" class="inputModalRegUsuario" disabled>
                        <option value="opcionCeroTipoUsu" >Selecciona Tipo de Usuario</option>
                        <option value="tipoUsu1" >Administrador</option>
                        <option value="tipoUsu1" >Contador</option>
                        <option value="tipoUsu1" >Reparador</option>
                    </select>
                    <input id="inputPass" placeholder='Asignar Contraseña' class="inputModalRegUsuario" disabled >
                    <div id='contBotonesRegUsuario'>
                        <div id="btnRegistrarUsuDiv">
                            <div>
                                <button id="btnEditar" class="btnRegistrar" onclick="ActivarEdicion()">Editar</button>
                            </div>
                        </div>
                        <div id="btnGuardarUsuDiv">
                            <div>
                                <button id="btnGuardar" class="btnRegistrar clicOff" onclick="ActivarEdicion()" disabled>Guardar</button>
                            </div>
                            <div>
                                <button id="btnEliminar" class="btnCancelar clicOff" disabled>Eliminar</button>
                            </div>
                            <div>
                                <button id="btnCancelar" class="btnCancelar" onclick="ManejarCancelar()">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>

    <script src="./funciones.js"></script>  
    <script>
                                    window.onload = function () {
                                      
                                        let activarModalDesdeRegistro = '<%= activarModalRegistro %>'; 
                                        let nombreUsuario = '<%= nombreUsuario %>';
                                        if(activarModalDesdeRegistro === "true"){
                                            console.log("abriendo modal");
                                            alert("Usuario " + nombreUsuario + " agregado correctamente!");
                                        }
                                        
                                        let activarModalDesdeLista = '<%= activarModalLista %>'; 
                                        if(activarModalDesdeLista === "true"){
                                            console.log("abriendo modal lista Usuarios");
                                            AbrirModalLista();
                                        }
                                        
                                        
                                    };
    </script>
</html>
