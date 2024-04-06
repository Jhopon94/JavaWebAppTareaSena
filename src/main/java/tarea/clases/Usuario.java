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
    
    public Usuario(String nombre, String tipoUsuario, String pass){
    
        this.nombre = nombre;
        this.tipoUsuario = tipoUsuario;
        this.pass = pass;
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
    public void setNombre(){
    
    }
    public void setTipoUsuario(){
    
    }
    public void setPass(){
    
    }
}
