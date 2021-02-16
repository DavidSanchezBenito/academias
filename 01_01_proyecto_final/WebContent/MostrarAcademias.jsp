<%@page import="java.util.List"%>
<%@page import="com.vipper.modelo.Academias"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Detalle</title>
<link  rel="stylesheet" type="text/css" href="css/estilos.css"> 
</head>
<body>
<h1>El detalle del curso elegido es:</h1>

<%
	List<Academias> p = (List<Academias>) request.getAttribute("resultados");
%>
		<table>
			<tr>
				<th>Id Academia</th>
				<th>Nombre</th>
				<th>pagina_web</th>
				<th>precio Euros</th>
			</tr>
			
			<tr>
			
			
			<%
										for (Academias a : p) {  /*me muestra los Cursos  */
									%>
				<td><%=a.getId_academias()%></td>
				<td><%=a.getNombre()%></td>
			 	<td><%=a.getPagina_web()%></td>
			 	<td><%=a.getPrecio()%></td>
			</tr>
		<%
				
				}
			%>
		
		</table>
		
<br/>
<center>
<a href="javascript: history.go(-1)" class="button small blue">Volver al listado de cursos</a>
<a href="index.jsp" class="button">Volver a Inicio</a>
</center>
</body>






</html>