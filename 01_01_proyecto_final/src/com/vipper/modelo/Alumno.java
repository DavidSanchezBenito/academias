package com.vipper.modelo;

public class Alumno {

	//creo todas las columnas, los nombres pueden ser distintos (yo los dejo iguales)
	private int id_alumnos;
	private String nombre;
	private String apellidos;
	private String id_curso_estudiando;
	private String id_curso_estudiado;
	private String email;
	private String telefono;
	private String observaciones;
	
		

//constructor
	
	//para la baja
	
	public Alumno(int id_alumnos) {
	super();
	this.id_alumnos = id_alumnos;
}
	
	//para el alta

	public Alumno(String nombre, String apellidos, String id_curso_estudiando, String id_curso_estudiado, String email,
			String telefono, String observaciones) {
		super();
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.id_curso_estudiando = id_curso_estudiando;
		this.id_curso_estudiado = id_curso_estudiado;
		this.email = email;
		this.telefono = telefono;
		this.observaciones = observaciones;
	}
	


	public Alumno(int id_alumnos, String nombre, String apellidos, String email, String telefono, String observaciones) {
		super();
		this.id_alumnos = id_alumnos;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.email = email;
		this.telefono = telefono;
		this.observaciones = observaciones;
	}

	
	public Alumno(int id_alumnos, String nombre, String apellidos, String id_curso_estudiando, String id_curso_estudiado,
			String email, String telefono, String observaciones) {
		super();
		this.id_alumnos = id_alumnos;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.id_curso_estudiando = id_curso_estudiando;
		this.id_curso_estudiado = id_curso_estudiado;
		this.email = email;
		this.telefono = telefono;
		this.observaciones = observaciones;
	}
	

//Getter & setters

public int getId_alumnos() {
	return id_alumnos;
}

public void setId_alumnos(int id_alumnos) {
	this.id_alumnos = id_alumnos;
}

public String getNombre() {
	return nombre;
}

public void setNombre(String nombre) {
	this.nombre = nombre;
}

public String getApellidos() {
	return apellidos;
}

public void setApellidos(String apellidos) {
	this.apellidos = apellidos;
}

public String getId_curso_estudiando() {
	return id_curso_estudiando;
}

public void setId_curso_estudiando(String id_curso_estudiando) {
	this.id_curso_estudiando = id_curso_estudiando;
}

public String getId_curso_estudiado() {
	return id_curso_estudiado;
}

public void setId_curso_estudiado(String id_curso_estudiado) {
	this.id_curso_estudiado = id_curso_estudiado;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getTelefono() {
	return telefono;
}

public void setTelefono(String telefono) {
	this.telefono = telefono;
}

public String getObservaciones() {
	return observaciones;
}

public void setObservaciones(String observaciones) {
	this.observaciones = observaciones;
}

@Override
public String toString() {
	return "alumno [id_alumnos=" + id_alumnos + ", nombre=" + nombre + ", apellidos=" + apellidos
			+ ", id_curso_estudiando=" + id_curso_estudiando + ", id_curso_estudiado=" + id_curso_estudiado + ", email="
			+ email + ", telefono=" + telefono + ", observaciones=" + observaciones + "]";
}

//para q salga separado por lineas poner al final toString:  \n



}




