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

        <script>
            function AbrirModalRegistro() {
                var modalRegistro = document.getElementById("modalRegistro");
                modalRegistro.style.display = "flex";
               /* modalRegistro.style.display = (modalRegistro.style.display === "none" || modalRegistro.style.display === "") ? "block" : "none";*/
            }
            
            function CerrarModalRegistro() {
                var modalRegistro = document.getElementById("modalRegistro");
                modalRegistro.style.display = "none";
               /* modalRegistro.style.display = (modalRegistro.style.display === "none" || modalRegistro.style.display === "") ? "block" : "none";*/
            }
        </script>

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
                        <button id="btnListaUsuarios" class="btnGeneral">Lista de Usuarios</button>
                    </div>
                </div>

            </div>
        </div>

        <!-- Modal para registrar Usuarios -->

        <div class="modalTransparencia" id="modalRegistro">
            <div class="modal">
                <div id='formRegUsuario'>
                    <select id='celuRegUsuario' class="inputModalRegUsuario">
                        <option value="opcionCeroEmpl" >Selecciona Empleado</option>
                        <option value="empleado1" >Juanito Perez</option>
                        <option value="empelado2" >Andrea Galeano</option>
                        <option value="empelado2" >Jeffry Epstein</option>
                    </select>
                    <select id='direccRegUsuario' class="inputModalRegUsuario">
                        <option value="opcionCeroTipoUsu" >Selecciona Tipo de Usuario</option>
                        <option value="tipoUsu1" >Administrador</option>
                        <option value="tipoUsu1" >Contador</option>
                        <option value="tipoUsu1" >Reparador</option>
                    </select>
                    <input id='correoRegUsuario' placeholder='Asignar Contraseña' class="inputModalRegUsuario">

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
    </body>
</html>
