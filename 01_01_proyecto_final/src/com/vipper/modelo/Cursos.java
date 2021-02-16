package com.vipper.modelo;



public class Cursos {

	
	//creo todas las columnas, los nombres pueden ser distintos (yo los dejo iguales)
 private String id_cursos;
 private String id_cursos_nuevo;
 private String nombre;
 private String practicas;
 private double precio;
 private int duracion_horas;
 
 //constructor para el metodo mostrar cursos
 
 public Cursos(String id_cursos, String nombre, String practicas, double precio, int duracion_horas) {
		super();
		this.id_cursos = id_cursos;
		this.nombre = nombre;
		this.practicas = practicas;
		this.precio = precio;
		this.duracion_horas = duracion_horas;
	}
 
 

//constructor completo para el metodo modificar cursos
 public Cursos(String id_cursos, String id_cursos_nuevo, String nombre, String practicas, double precio,
			int duracion_horas) {
		super();
		this.id_cursos = id_cursos;
		this.id_cursos_nuevo = id_cursos_nuevo;
		this.nombre = nombre;
		this.practicas = practicas;
		this.precio = precio;
		this.duracion_horas = duracion_horas;
	}
 

//getter & setters


public String getId_cursos() {
	return id_cursos;
}

public void setId_cursos(String id_cursos) {
	this.id_cursos = id_cursos;
}

public String getId_cursos_nuevo() {
	return id_cursos_nuevo;
}

public void setId_cursos_nuevo(String id_cursos_nuevo) {
	this.id_cursos_nuevo = id_cursos_nuevo;
}

public String getNombre() {
	return nombre;
}




public void setNombre(String nombre) {
	this.nombre = nombre;
}




public String getPracticas() {
	return practicas;
}




public void setPracticas(String practicas) {
	this.practicas = practicas;
}




public double getPrecio() {
	return precio;
}




public void setPrecio(double precio) {
	this.precio = precio;
}




public int getDuracion_horas() {
	return duracion_horas;
}




public void setDuracion_horas(int duracion_horas) {
	this.duracion_horas = duracion_horas;
}


//metodo Tostring

@Override
public String toString() {
	return "Cursos [id_cursos=" + id_cursos + ", nombre=" + nombre + ", practicas=" + practicas + ", precio=" + precio
			+ ", duracion_horas=" + duracion_horas + "]";
}


 
}
