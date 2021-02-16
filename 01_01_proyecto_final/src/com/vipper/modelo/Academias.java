package com.vipper.modelo;

public class Academias {

	private int id_academias;
	private String nombre;
	private String pagina_web;
	private int precio;
	
	
	
	
	public Academias(int id_academias, String nombre, String pagina_web, int precio) {
		super();
		this.id_academias = id_academias;
		this.nombre = nombre;
		this.pagina_web = pagina_web;
		this.precio = precio;
	}
	public int getId_academias() {
		return id_academias;
	}
	public void setId_academias(int id_academias) {
		this.id_academias = id_academias;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getPagina_web() {
		return pagina_web;
	}
	public void setPagina_web(String pagina_web) {
		this.pagina_web = pagina_web;
	}
	public int getPrecio() {
		return precio;
	}
	public void setPrecio(int precio) {
		this.precio = precio;
	}
	
	
	
}
