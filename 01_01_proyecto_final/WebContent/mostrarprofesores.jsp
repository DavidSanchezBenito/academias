<%@page import="java.util.List"%>
<%@page import="com.vipper.modelo.Profesores"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Resultado consulta</title>
<link  rel="stylesheet" type="text/css" href="css/estilos.css"> 


</head>
<body>
<h1>Los profesores actuales en sistema son:</h1>

<%
			List<Profesores> p = (List<Profesores>) request.getAttribute("list_profesores");

		%>
		<table>
			<tr>
				<th>Identificador profesor</th>
				<th>Nombre</th>
				<th>Apellidos</th>
				<th>Titulacion</th>
				<th>Email</th>
				<th>Telefono</th>
				<th>Diligencia</th>
				<th>Modificar</th>
				<th>Eliminar</th>
				
			</tr>
			<%
				for (Profesores c : p) {  /*me muestra los profesores  */
			%>
			<tr>
					<td><%=c.getId_profesor()%></td>
					<td><%=c.getNombre()%></td>
				 	<td><%=c.getApellidos()%></td>
				 	<td><%=c.getTitulacion()%></td>
				 	<td><%=c.getEmail()%></td>
				 	<td><%=c.getTelefono()%></td>
				 	<td><%=c.getDiligencia()%></td>
			 	<td><a href="modificacionprofesores.jsp?f_id_profesor=<%=c.getId_profesor()%>
				 	&f_nombre=<%=c.getNombre()%>
				 	&f_apellidos=<%=c.getApellidos()%>
				 	&f_titulacion=<%=c.getTitulacion()  %>
				 	&f_email=<%=c.getEmail()%>
				 	&f_telefono=<%=c.getTelefono()  %>
				 	&f_diligencia=<%=c.getDiligencia() %>				 	
				 	" >Modificar</a></td>
				 	
			<!-- la siguiente opcion, entran en el servlet por el doget -->
				 <td><a href="sservletprofes?option=2&f_id_profesor=<%=c.getId_profesor()%>" >Eliminar</a></td>
			</tr>
			<%
				
				}
			%>
		</table>
		
<br/>
<center>

<a href="index.html" class="button">Volver a Inicio</a>
</center>
</body>

</html>