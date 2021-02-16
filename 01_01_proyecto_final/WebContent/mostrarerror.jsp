<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pagina de error</title>
<link  rel="stylesheet" type="text/css" href="css/estilos.css"> 

<style>

p {
font-size:20px;
}
#padre {
  background-color: #fafafa;
  margin: 5rem;
  padding: 1rem;
  border: 4px solid #ccc;
  /* IMPORTANTE */
  text-align: center;
}


</style>

</head>
<body>
<div id="padre">
<h1>Error al procesar su solicitud</h1>
Se ha producido un error al intentar consultar los datos.<br>
Consulte con el administrador informándole de la acción realizada.
<form action="index.html">
        <input type="submit" value="Ir a Inicio" />
</form>

</div>
</body>


</html>