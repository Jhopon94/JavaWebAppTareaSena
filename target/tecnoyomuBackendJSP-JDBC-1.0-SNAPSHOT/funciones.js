let modoEdicion = false;
let textoBtn = 'Editar';

function ManejarClicLista(nombre, tipoUsuario, pass){
    

    let inputNombre = document.getElementById('inputNombreEdicion');
    let selecTipo = document.getElementById('listaTipo');
    let inputPass = document.getElementById('inputPass');
    
    inputNombre.value = nombre;
    console.log(tipoUsuario);
    selecTipo.querySelector('option[value="' + tipoUsuario + '"]').selected = true;
    inputPass.value= pass;
    AbrirModalEdicion(nombre);
}

function ActivarEdicion() {

    let listaTipo = document.getElementById("listaTipo");
    let inputPass = document.getElementById("inputPass");
    let btnEliminar = document.getElementById("btnEliminar");
    let btnEditar = document.getElementById("btnEditar");
    let btnGuardar = document.getElementById("btnGuardar");


    modoEdicion = true;

    listaTipo.disabled = false;
    inputPass.disabled = false;
    btnEliminar.disabled = false;
    btnEliminar.classList.remove("clicOff");
    btnEditar.disabled = true;
    btnEditar.classList.add("clicOff");
    btnGuardar.disabled = false;
    btnGuardar.classList.remove("clicOff");
}

function ManejarCancelar() {

    let inputNombre = document.getElementById("inputNombreEdicion");
    let listaTipo = document.getElementById("listaTipo");
    let inputPass = document.getElementById("inputPass");
    let btnEliminar = document.getElementById("btnEliminar");
    let btnEditar = document.getElementById("btnEditar");
    let btnGuardar = document.getElementById("btnGuardar");


    modoEdicion = false;

    inputNombre.disabled = true;
    listaTipo.disabled = true;
    inputPass.disabled = true;
    btnEliminar.disabled = true;
    btnEliminar.classList.add("clicOff");
    btnEditar.disabled = false;
    btnEditar.classList.remove("clicOff");
    btnGuardar.disabled = true;
    btnGuardar.classList.add("clicOff");

    CerrarModalEdicion();
}

function ManejarEliminar(){
    
    var inputNombreEdicion = document.getElementById("inputNombreEdicion");
    var contenido = inputNombreEdicion.value;
    var form = document.getElementById('formEditUsuario');
    var input = document.createElement('input');
    
    input.type = 'hidden';
    input.name = 'eliminar';
    input.value = contenido;
    form.appendChild(input);
    form.submit();
}

function AbrirModalRegistro() {
    var modalRegistro = document.getElementById("modalRegistro");
    modalRegistro.style.display = "flex";
}

function CerrarModalRegistro() {
    var modalRegistro = document.getElementById("modalRegistro");
    modalRegistro.style.display = "none";
}

function AbrirModalLista() {
    var modalRegistro = document.getElementById("modalLista");
    modalRegistro.style.display = "flex";
}

function CerrarModalLista() {
    var modalRegistro = document.getElementById("modalLista");
    modalRegistro.style.display = "none";
}

function AbrirModalEdicion(nombre) {
    var modalRegistro = document.getElementById("modalEdicion");
    var inputNombreEdicion = document.getElementById("inputNombreEdicion");
    inputNombreEdicion.setAttribute("name", nombre);
    modalRegistro.style.display = "flex";
}

function CerrarModalEdicion() {
    var modalRegistro = document.getElementById("modalEdicion");
    modalRegistro.style.display = "none";
}