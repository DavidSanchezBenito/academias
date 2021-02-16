<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Baja alumno</title>
<link  rel="stylesheet" type="text/css" href="css/estilos.css"> 
</head>

<body style="background: azure; font-size: 20px; text-align:left">


	<h2 style="text-align:center">Baja  alumno: cumplimente los siguientes campos</h2>

<div>
<form action="sservlet?op=5" method="post">

			Id_alumno: (nº identificador del alumno)
			<input type="number" name="f_id_alumno" />  
			
		
		
		<br><br> <input type="submit" value="Dar de baja"/> <br><br><br>
		
	</form>
	<center><a href="index.html" class="button">Volver a Inicio</a></center>
	</div>

</body>
</html>