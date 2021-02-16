<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>alta alumno</title>
<link  rel="stylesheet" type="text/css" href="css/estilos.css"> 
</head>

<body style="background: azure; font-size: 20px; text-align:left">

<!-- <h1 style="text-align:center">Alta nuevo alumno</h1> -->


	<h2 style="text-align:center">Alta nuevo alumno: cumplimente los siguientes campos</h2>

<div>
<form action="SServletAlumnos?op=4" method="post">

			Nombre:
			<input type="text" name="fnombre" /> <br> 
			
			Apellidos:
			<input type="text" name="fapellidos" /> <br> 
			
			Id curso estudiando:
			<input type="text" name="fcursos_pres" /> <br> 
			
			Cursos estudiados:
			<input type="text" name="fcursos_pas" /> <br> 
			
			Telefono:
			<input type="text" name="ftelefono" /> <br> 
			
			Email:
			<input type="email" name="femail" /> <br>
			
			Observaciones:
			<input type="text" name="fobservaciones" /> <br> 

		
		<br><br> <input type="submit" value="Guardar datos"/>
		
	</form></div>
	<center>
<a href="menucursos.html" class="button">Atras</a>
<a href="index.html" class="button">Volver a Inicio</a>
</center>
</body>
</html>