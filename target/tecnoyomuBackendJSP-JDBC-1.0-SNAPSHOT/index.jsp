<%-- 
    Document   : index
    Created on : 5/04/2024, 7:45:24 p. m.
    Author     : Jhopon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/global.css">
        <link rel="stylesheet" type="text/css" href="css/cabezal.css">

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
                    <div>
                        <button id="btnListaUsuarios" class="btnGeneral" onclick="AbrirModalLista()">Lista de Usuarios</button>
                    </div>
                </div>

            </div>
        </div>

        <!-- Modal para registrar Usuarios -->

        <div class="modalTransparencia" id="modalRegistro">
            <div class="modal">
                <div id='formRegUsuario'>
                    <input class="inputModalRegUsuario"  placeholder="Nombre de Usuario"/>
                    <select class="inputModalRegUsuario">
                        <option value="opcionCeroTipoUsu" >Selecciona Tipo de Usuario</option>
                        <option value="tipoUsu1" >Administrador</option>
                        <option value="tipoUsu1" >Contador</option>
                        <option value="tipoUsu1" >Reparador</option>
                    </select>
                    <input  placeholder='Asignar Contraseña' class="inputModalRegUsuario">

                    </input>
                    <div id='contBotonesRegUsuario'>
                        <div id="btnRegistrarUsuDiv">
                            <div>
                                <button id="btnRegistrar" class="btnRegistrar">Registrar</button>
                            </div>
                        </div>
                        <div id="btnCancelUsuDiv">
                            <div>
                                <button id="btnRegistrar" class="btnCancelar" onclick="CerrarModalRegistro()">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal para Listar Usuarios -->

        <div class="modalTransparencia" id="modalLista">
            <div class="modal">
                <div id='formListaUsuarios'>
                    <input class='formListaUsuChilds' id='inputFiltroUsu' />
                    <table class='formListaUsuChilds' id="tablaListaUsu" onclick="AbrirModalEdicion()" >
                        <tr class='editUsuFilaTabla'>
                            <td >Nombre de Usuario (Empleado)</td>
                        </tr>
                        <tr class='editUsuFilaTabla' >
                            <td >Nombre de Usuario (Empleado)</td>
                        </tr>
                        <tr class='editUsuFilaTabla' >
                            <td >Nombre de Usuario (Empleado)</td>
                        </tr>
                        <tr class='editUsuFilaTabla' >
                            <td >Nombre de Usuario (Empleado)</td>
                        </tr>
                        <tr class='editUsuFilaTabla' >
                            <td >Nombre de Usuario (Empleado)</td>
                        </tr>
                        <tr class='editUsuFilaTabla' >
                            <td >Nombre de Usuario (Empleado)</td>
                        </tr>
                    </table>
                    <div id='contBotonesRegUsuario'>
                        <div id="btnCancelUsuDiv">
                            <div>
                                <button id="btnRegistrar" class="btnCancelar" onclick="CerrarModalLista()">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>
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
</html>
