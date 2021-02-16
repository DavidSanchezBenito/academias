<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modificacion profesores</title>
<link  rel="stylesheet" type="text/css" href="css/estilos.css"> 
</head>

<body style="background: azure; font-size: 20px; text-align:left">

<!-- <h1 style="text-align:center">Alta nuevo alumno</h1> -->


	<h2 style="text-align:center">Modificacion profesor: cumplimente los siguientes campos</h2>

<div>
<form action="sservletprofes?op=3" method="post">

<%
			String pid_profesor =  request.getParameter("f_id_profesor");
			String pid_nombre =  request.getParameter("f_nombre");
			String pid_apellidos =  request.getParameter("f_apellidos");
			String pid_titulacion =  request.getParameter("f_titulacion");	
			String pid_email =  request.getParameter("f_email");
			String pid_telefono =  request.getParameter("f_telefono");
			String pid_diligencia =  request.getParameter("f_diligencia");		
%>
 
			Id:
			<input type="text" name="f_id_profesor" readonly="readonly" value=<%=pid_profesor%> /> <br> 

			Nombre:
			<input type="text" name="f_nombre" value="<%=pid_nombre%>" />   <br> 
			
			Apellidos:
			<input type="text" name="f_apellidos" value="<%=pid_apellidos%>"/> <br> 
			
			Titulacion:
			<input type="text" name="f_titulacion" value="<%=pid_titulacion%>"/> <br> 
			
			Email:
			<input type="email" name="f_email" value="<%=pid_email%>"/> <br> <br>
			
			Telefono:
			<input type="text" name="f_telefono" value="<%=pid_telefono%>"/> <br> 
			
			Diligencia:
			<input type="text" name="f_diligencia" value="<%=pid_diligencia%>"/> <br> 
		

		
		<br><br> <input type="submit" value="Actualizar datos"/>
		
	</form></div>
	<center>

<a href="index.html" class="button">Volver a Inicio</a>
</center>
</body>
</html>