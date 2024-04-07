/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tarea.clases;

/**
 *
 * @author Jhopon
 */
public class Usuario {
    
    private String nombre, tipoUsuario, pass;
    
    public Usuario(){
    
        this.nombre = "";
        this.tipoUsuario = "";
        this.pass = "";
    }
    
    public String getNombre(){
        return nombre;
    }
    public String getTipoUsuario(){
        return tipoUsuario;
    }
    public String getPass(){
        return pass;
    }
    public void setNombre(String nombre){
        this.nombre = nombre;
    }
    public void setTipoUsuario(String tipoUsuario){
        this.tipoUsuario = tipoUsuario;
    }
    public void setPass(String pass){
        this.pass = pass;
    }
}
