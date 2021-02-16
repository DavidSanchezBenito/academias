<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modificacion alumno</title>
<link  rel="stylesheet" type="text/css" href="css/estilos.css"> 
</head>

<body style="background: azure; font-size: 20px; text-align:left">

<!-- <h1 style="text-align:center">Alta nuevo alumno</h1> -->


	<h2 style="text-align:center">Modificacion alumno: cumplimente los siguientes campos</h2>

<div>
<form action="SServletAlumnos?op=6" method="post">

<%
			String pid_alumno =  request.getParameter("f_id_alumno");
			String pid_nombre =  request.getParameter("f_nombre");
			String pid_apellidos =  request.getParameter("f_apellidos");
			String pid_curso_pres =  request.getParameter("f_curso_pres");
			String pid_curso_pas =  request.getParameter("f_curso_pas");
			String pid_email =  request.getParameter("f_email");
			String pid_telefono =  request.getParameter("f_telefono");
			String pid_observaciones =  request.getParameter("f_observaciones");		
		%>
 
			Id:
			<input type="text" name="f_id_alumno" readonly="readonly" value=<%=pid_alumno%> /> <br> 

			Nombre:
			<input type="text" name="fnombre" value="<%=pid_nombre%>" />   <br> 
			
			Apellidos:
			<input type="text" name="fapellidos" value="<%=pid_apellidos%>"/> <br> 
			
			Curso estudiando:
			<input type="text" name="fcurso_pres" value="<%=pid_curso_pres%>"/> <br> 
			
			Cursos estudiados:
			<input type="text" name="fcurso_pas" value="<%=pid_curso_pas%>"/> <br> 
			
			Email:
			<input type="email" name="femail" value="<%=pid_email%>" /> <br> 
			
			Telefono:
			<input type="text" name="ftelefono" value="<%=pid_telefono%>" /> <br> 
			
			Observaciones:
			<input type="text" name="fobservaciones" value="<%=pid_observaciones%>" /> <br> 
		

		
		<br><br> <input type="submit" value="Actualizar datos"/>
		
	</form></div>
	<center>
<a href="menucursos.html" class="button">Atras</a>
<a href="index.html" class="button">Volver a Inicio</a>
</center>
</body>
</html>