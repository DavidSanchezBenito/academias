package com.vipper.persistencia;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.vipper.modelo.*;

public class AccesoProfesores extends Conexion {

	//en esta clase creo los metodos de lo que quiero obtener para la tabla profesores.
	
public List <Profesores> ObtenerProfesores() throws SQLException, ClassNotFoundException{
		
		String sql = "call cursos2.obtenerProfesores();";  //llamo al PA creado
		Profesores a;
	    //utilizo el CallableStatement pues voy a ejecutar un proc almacenado
	    CallableStatement st;
	    ResultSet rs=null;   //es donde almacenamos los datos consultados, pero no se utiliza al tener param de salida
	    					 //el resultadoset 
	    List<Profesores> e1 = new ArrayList<>();
	    
	    abrirConexion();
	  //obtener el comando de conexion
	    st= miConexion.prepareCall(sql);  	
	 
    
	    //ejecutar el statement
	    rs=st.executeQuery();  
	    

	    //recorro el result set
	    while(rs.next()) {    //rs almacena los registros, y mientras haya registros hacemos esto:
	    	//instanciamos alumnos con el constructor de los datos a mostrar (estos 3)
	    	 a = new Profesores(rs.getInt("id_profesor"),  //orden atributos segun constructor
	    			 rs.getString("nombre"),
	    			 rs.getString("apellidos"),
	    			 rs.getString("titulacion"),
	    			 rs.getString("email"),
	    			 rs.getString("telefono"),
	    			 rs.getString("diligencia")
	    			 );
	    	
	    	e1.add(a);
	    
	    };
	    cerrarConexion();  //cierro conexion
			return e1;
		
	}
	
//
//
public int altaProfesor (String pid_nombre,String pid_apellidos,String pid_titulacion, String pid_email,
		String pid_telefono, String pid_diligencia) 
		 throws SQLException, ClassNotFoundException{

String sql = "call cursos2.insertar_profe(?, ?, ?,?,?,?);";
int registros =0;
//utilizo el CallableStatement pues voy a ejecutar un proc almacenado
CallableStatement st;

abrirConexion();
//obtener el comando de conexion
st= miConexion.prepareCall(sql);  	
//parametro de entrada
st.setString(1, pid_nombre);
st.setString(2, pid_apellidos);
st.setString(3, pid_titulacion);
st.setString(4, pid_email);
st.setString(5, pid_telefono);
st.setString(6, pid_diligencia);



//ejecutar el statement
registros=st.executeUpdate();  //como es un alta, tiene q ser un executeUpdate 

cerrarConexion();
return registros;
}

public int bajaProfesor (String pid_id_p) 
		 throws SQLException, ClassNotFoundException{

String sql = "call cursos2.borrar_profe(?);";
int registros =0;
//utilizo el CallableStatement pues voy a ejecutar un proc almacenado
CallableStatement st;

abrirConexion();
//obtener el comando de conexion
st= miConexion.prepareCall(sql);  	
//parametro de entrada
st.setString(1, pid_id_p);


//ejecutar el statement
registros=st.executeUpdate(); //como es un delete, tiene q ser un executeUpdate 

cerrarConexion();
System.out.println("PA borrar 1 profesor, contenido de registros: "+ registros);
return registros;  //si lo ejecuta bien, devolvera un 1
}


public int modificarProfesor (String pid_profesor, String pid_nombre,String pid_apellidos, 
		String pid_titulacion, String pid_email, String pid_telefono, String pid_diligencia)
		 throws SQLException, ClassNotFoundException{
	System.out.println("entra en el medoto modificar profesor");

String sql = "call cursos2.modificar_profe(?, ?, ?,?,?,?,?);";
int registros =0;
//utilizo el CallableStatement pues voy a ejecutar un proc almacenado
CallableStatement st;

abrirConexion();
//obtener el comando de conexion
st= miConexion.prepareCall(sql);  	
//parametro de entrada

st.setString(1, pid_profesor);
st.setString(2, pid_nombre);
st.setString(3, pid_apellidos);
st.setString(4, pid_titulacion);
st.setString(5, pid_email);
st.setString(6, pid_telefono);
st.setString(7, pid_diligencia);



//ejecutar el statement
registros=st.executeUpdate();  //como es un alta, tiene q ser un executeUpdate 
System.out.println("acceso  modificacion profe realizada");
cerrarConexion();
System.out.println("registros =" + registros);
return registros;

}


}
