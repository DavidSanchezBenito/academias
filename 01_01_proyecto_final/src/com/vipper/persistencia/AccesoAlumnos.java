package com.vipper.persistencia;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.vipper.modelo.*;

public class AccesoAlumnos extends Conexion {

	//en esta clase creo los metodos de lo que quiero obtener.
	
public List <Alumno> ObtenerAlumnos() throws SQLException, ClassNotFoundException{
		
		String sql = "call cursos2.obtenerAlumnos();";  //llamo al PA creado
		Alumno a;
	    //utilizo el CallableStatement pues voy a ejecutar un proc almacenado
	    CallableStatement st;
	    ResultSet rs=null;   //es donde almacenamos los datos consultados, pero no se utiliza al tener param de salida
	    					 //el resultadoset 
	    List<Alumno> e1 = new ArrayList<>();
	    
	    abrirConexion();
	  //obtener el comando de conexion
	    st= miConexion.prepareCall(sql);  	
	 
    
	    //ejecutar el statement
	    rs=st.executeQuery();  
	    

	    //recorro el result set
	    while(rs.next()) {    //rs almacena los registros, y mientras haya registros hacemos esto:
	    	//instanciamos alumnos con el constructor de los datos a mostrar (estos 3)
	    	 a = new Alumno(rs.getInt("id_alumnos"),  //orden atributos segun constructor
	    			 rs.getString("nombre"),
	    			 rs.getString("apellidos"),
	    			 rs.getString("id_curso_estudiando"),
	    			 rs.getString("id_curso_estudiado"),
	    			 rs.getString("email"),
	    			 rs.getString("telefono"),
	    			 rs.getString("observaciones")
	    			 );
	    	
	    	e1.add(a);
	    
	    	//esto lo pongo para que lo saque por consola y verificar.
	    	System.out.println(rs.getInt("id_alumnos") + " " + rs.getString("nombre") +" " + rs.getString("apellidos")); ;
	    	}
	    cerrarConexion();  //cierro conexion
			return e1;
		
	}
	


public int altaAlumno (String pid_nombre,String pid_apellidos,String pid_curso_estudiando,
		String pid_curso_estudiado, String pid_email,
		String pid_telefono, String pid_observaciones) 
		 throws SQLException, ClassNotFoundException{


	
String sql = "call cursos2.insertarAlumnos(?, ?, ?, ?,?,?,?);";
int registros =0;
//utilizo el CallableStatement pues voy a ejecutar un proc almacenado
CallableStatement st;

abrirConexion();
//obtener el comando de conexion
st= miConexion.prepareCall(sql);  	
//parametro de entrada
st.setString(1, pid_nombre);
st.setString(2, pid_apellidos);
st.setString(3, pid_curso_estudiando);
st.setString(4, pid_curso_estudiado);
st.setString(5, pid_email);
st.setString(6, pid_telefono);
st.setString(7, pid_observaciones);

//ejecutar el statement
registros=st.executeUpdate();  //como es un alta, tiene q ser un executeUpdate 

cerrarConexion();
return registros;
}

public int bajaAlumno (String pid_alumno) 
		 throws SQLException, ClassNotFoundException{

String sql = "call cursos2.borrarAlumno(?);";
int registros =0;
//utilizo el CallableStatement pues voy a ejecutar un proc almacenado
CallableStatement st;

abrirConexion();
//obtener el comando de conexion
st= miConexion.prepareCall(sql);  	
//parametro de entrada
st.setString(1, pid_alumno);


//ejecutar el statement
registros=st.executeUpdate(); //como es un delete, tiene q ser un executeUpdate 

cerrarConexion();
System.out.println("borrar alumno contenido de registros: "+ registros);
return registros;  //si lo ejecuta bien, devolvera un 1
}


public int modificarAlumno (String pid_id, String pid_nombre,String pid_apellidos,
		String pid_curso_estudiando, String pid_curso_estudiado, String pid_email,
		String pid_telefono, String pid_observaciones
		)
		 throws SQLException, ClassNotFoundException{

String sql = "call cursos2.modificarAlumno(?, ?, ?,?,?,?,?,?);";
int registros =0;
//utilizo el CallableStatement pues voy a ejecutar un proc almacenado
CallableStatement st;

abrirConexion();
//obtener el comando de conexion
st= miConexion.prepareCall(sql);  	
//parametro de entrada

st.setString(1, pid_id);
st.setString(2, pid_nombre);
st.setString(3, pid_apellidos);
st.setString(4, pid_curso_estudiando);
st.setString(5, pid_curso_estudiado);
st.setString(6, pid_email);
st.setString(7, pid_telefono);
st.setString(8, pid_observaciones);


//ejecutar el statement
registros=st.executeUpdate();  //como es un alta, tiene q ser un executeUpdate 

cerrarConexion();
return registros;
}


}
