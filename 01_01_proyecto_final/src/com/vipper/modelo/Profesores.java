package com.vipper.modelo;

public class Profesores {

	//creo todas las columnas, los nombres pueden ser distintos (yo los dejo iguales)
	private int id_profesor;
	private String nombre;
	private String apellidos;
	private String titulacion;
	private String email;
	private String telefono;
	private String diligencia;
	
	//constructor
	public Profesores() {
		// TODO Auto-generated constructor stub
	}
	

	
	public Profesores(String nombre, String apellidos, String titulacion, String email, String telefono,
			String diligencia) {
		super();
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.titulacion = titulacion;
		this.email = email;
		this.telefono = telefono;
		this.diligencia = diligencia;
	}


//constructor para el metodo mostrar
	public Profesores(int id_profesor, String nombre, String apellidos, String titulacion, String email,
			String telefono, String diligencia) {
		super();
		this.id_profesor = id_profesor;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.titulacion = titulacion;
		this.email = email;
		this.telefono = telefono;
		this.diligencia = diligencia;
	}



	//Getters & setters
	public int getId_profesor() {
		return id_profesor;
	}

	public void setId_profesor(int id_profesor) {
		this.id_profesor = id_profesor;
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

	public String getTitulacion() {
		return titulacion;
	}

	public void setTitulacion(String titulacion) {
		this.titulacion = titulacion;
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

	public String getDiligencia() {
		return diligencia;
	}

	public void setDiligencia(String diligencia) {
		this.diligencia = diligencia;
	}


//metodo ToString
	@Override
	public String toString() {
		return "profesores [id_profesor=" + id_profesor + ", nombre=" + nombre + ", apellidos=" + apellidos
				+ ", titulacion=" + titulacion + ", email=" + email + ", telefono=" + telefono + ", diligencia="
				+ diligencia + "]";
	}
	

	
	
}
