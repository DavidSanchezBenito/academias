<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Alta curso</title>
<link  rel="stylesheet" type="text/css" href="css/estilos.css"> 
</head>

<body style="background: azure; font-size: 20px; text-align:left">

<!-- <h1 style="text-align:center">Alta nuevo alumno</h1> -->


	<h2 style="text-align:center">Alta nuevo curso: cumplimente los siguientes campos</h2>

<div>
<form action="sservletcursos?op=2" method="post">

			Id:
			<input type="text" name="fid" /> <br> 

			Nombre:
			<input type="text" name="fnombre" /> <br> 
			
			Practicas:
			<input type="text" name="fpracticas" /> <br> 
			
			Precio:
			<input type="number" name="fprecio" /> <br> 
			
			Duracion (horas):
			<input type="text" name="fduracion" /> 
			
		
		<br><br> <input type="submit" value="Guardar datos"/>
		
	</form></div>
	<center>
<a href="menucursos.html" class="button">Atras</a>
<a href="index.html" class="button">Volver a Inicio</a>
</center>
</body>
</html>