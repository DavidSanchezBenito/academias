<%@page import="java.util.List"%>
<%@page import="com.vipper.modelo.Alumno"%>
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
<h1>Los alumnos actuales en sistema son:</h1>

<%
			List<Alumno> p = (List<Alumno>) request.getAttribute("list_alumnos");

		%>
		<table>
			<tr>
				<th>Identificador alumno</th>
				<th>Nombre del alumno</th>
				<th>Apellidos</th>
				<th>Curso estudiando</th>
				<th>Cursos estudiados</th>
				<th>Email</th>
				<th>Telefono</th>
				<th>Observaciones</th>
				<th>Modificar</th>
				<th>Eliminar</th>
				
				
			</tr>
			<%
				for (Alumno c : p) {  /*me muestra los Cursos  */
			%>
			<tr>
					<td><%=c.getId_alumnos()%></td>
					<td><%=c.getNombre()%></td>
				 	<td><%=c.getApellidos()%></td>
				 	<td><%=c.getId_curso_estudiando()%></td>
				 	<td><%=c.getId_curso_estudiado()%></td>
				 	<td><%=c.getEmail()%></td>
				 	<td><%=c.getTelefono()%></td>
				 	<td><%=c.getObservaciones()%></td>
<%-- 				 	<td><a href="sservlet?option=1&id_alumno=<%=c.getId_alumnos()%>" >Modificar</a></td> --%>
				 	<td><a href="modificacionalumno.jsp?f_id_alumno=<%=c.getId_alumnos()%>
				 	&f_nombre=<%=c.getNombre()%> 	
				 	&f_apellidos=<%=c.getApellidos()%>
				 	&f_curso_pres=<%=c.getId_curso_estudiando()%>
				 	&f_curso_pas=<%=c.getId_curso_estudiado()%>
				 	&f_email=<%=c.getEmail()%>
				 	&f_telefono=<%=c.getTelefono()%>
				 	&f_observaciones=<%=c.getObservaciones()%>
				 
				 	
				 	" >Modificar</a></td>
			
				 	<td><a href="SServletAlumnos?option=2&id_alumno=<%=c.getId_alumnos()%>" >Eliminar</a></td>
			</tr>
			<%
				
				}
			%>
		</table>
		
<br/>
<center>
<a href="menualumnos.html" class="button">Atras</a>
<a href="index.html" class="button">Volver a Inicio</a>
</center>
</body>

</html>