<%@page import="java.util.List"%>
<%@page import="com.vipper.modelo.Cursos"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Resultado consulta profesores</title>
<link  rel="stylesheet" type="text/css" href="css/estilos.css"> 


</head>
<body>
<h1>Los cursos actuales en sistema son:</h1>

<%
			List<Cursos> p = (List<Cursos>) request.getAttribute("list_cursos");

		%>
		<table>
			<tr>
				<th>Identificador curso</th>
				<th>Nombre del curso</th>
				<th>Practicas</th>
				<th>Precio(euros)</th>
				<th>Duracion(horas)</th>
				<th>Modificar</th>
				<th>Eliminar</th>

			</tr>
			<%
				for (Cursos c : p) {  /*me muestra los Cursos  */
			%>
			<tr>
					<td><%=c.getId_cursos()%></td>
					<td><%=c.getNombre()%></td>
				 	<td><%=c.getPracticas()%></td>
				 	<td><%=c.getPrecio()%></td>
				 	<td><%=c.getDuracion_horas()%></td>
					<td><a href="modificacioncursos.jsp?f_id_cursos=<%=c.getId_cursos()%>
				 	&f_nombre=<%=c.getNombre()%>
				 	&f_practicas=<%=c.getPracticas()%>
				 	&f_precio=<%=c.getPrecio()  %>
				 	&f_duracion_horas=<%=c.getDuracion_horas()%>			 	
				 	" >Modificar</a></td>
				
					<!-- la siguiente opcion, entran en el servlet por el doget -->
				 <td><a href="sservletcursos?option=2&f_id_cursos=<%=c.getId_cursos()%>" >Eliminar</a></td>
			</tr>
		 				 
			</tr>
			<%
				
				}
			%>
		</table>
		
<br/>
<center>
<a href="menucursos.html" class="button">Atras</a>
<a href="index.html" class="button">Volver a Inicio</a>
</center>
</body>

</html>