<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Modificacion cursos</title>
<link  rel="stylesheet" type="text/css" href="css/estilos.css"> 
</head>

<body style="background: azure; font-size: 20px; text-align:left">

<!-- <h1 style="text-align:center">Alta nuevo alumno</h1> -->


	<h2 style="text-align:center">Modificacion cursos: cumplimente los siguientes campos</h2>

<div>
<form action="sservletcursos?op=3" method="post">

<%
			String pid_cursos =  request.getParameter("f_id_cursos");
			String pid_nombre =  request.getParameter("f_nombre");
			String pid_practicas =  request.getParameter("f_practicas");
			String pid_precio =  request.getParameter("f_precio");	
			String pid_duracion_horas =  request.getParameter("f_duracion_horas");
%>
 
			Id_curso: (curso actual)
			<input type="text" name="f_id_cursos" readonly="readonly" value=<%=pid_cursos%> /> <br> 
			
			modificacion id_curso: (curso correcto)

			<input type="text" name="f_id_cursos_n" value=<%=pid_cursos%> /> <br> 

			Nombre:
			<input type="text" name="f_nombre" value="<%=pid_nombre%>" />   <br> 
			
			Practicas:
			<input type="text" name="f_practicas" value="<%=pid_practicas%>"/> <br> 
			
			Precio:
			<input type="number" name="f_precio" value="<%=pid_precio%>"/> <br> <br>
			
			Horas:
			<input type="number" name="f_duracion_horas" value="<%=pid_duracion_horas%>"/> <br> 
			
		
		<br><br> <input type="submit" value="Actualizar datos"/>
		
	</form></div>
	<center>
<a href="mostrarcursos.jsp" class="button">Atras</a>
<a href="index.html" class="button">Volver a Inicio</a>
</center>
</body>
</html>