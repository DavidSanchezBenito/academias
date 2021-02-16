<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Alta profesor</title>
<link  rel="stylesheet" type="text/css" href="css/estilos.css"> 
</head>

<body style="background: azure; font-size: 20px; text-align:left">

<!-- <h1 style="text-align:center">Alta nuevo alumno</h1> -->


	<h2 style="text-align:center">Alta nuevo Profesor: cumplimente los siguientes campos</h2>

<div>
<form action="sservletprofes?op=2" method="post">

			Nombre:
			<input type="text" name="fnombre" /> <br> 
			
			Apellidos:
			<input type="text" name="fapellidos" /> <br> 
			
			Titulacion:
			<input type="text" name="ftitulacion" /> <br> 
			
			Email:
			<input type="email" name="femail" /> <br>
			
			Telefono:
			<input type="text" name="ftelefono" /> <br> 
			
			Diligencia:
			<input type="text" name="fdiligencia" /> <br> 


		
		<br><br> <input type="submit" value="Guardar datos"/>
		
	</form></div>
	<center>
<a href="menuprofesores.html" class="button">Atras</a>
<a href="index.html" class="button">Volver a Inicio</a>
</center>
</body>
</html>