package com.vipper.persistencia;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.vipper.modelo.*;

public class AccesoCursos extends Conexion {

	//en esta clase creo los metodos de lo que quiero obtener para la tabla profesores.
	
public List <Cursos> ObtenerCursos() throws SQLException, ClassNotFoundException{
		
		String sql = "call cursos2.obtenercursos();";  //llamo al PA creado
		Cursos c;
	    //utilizo el CallableStatement pues voy a ejecutar un proc almacenado
	    CallableStatement st;
	    ResultSet rs=null;   //es donde almacenamos los datos consultados, pero no se utiliza al tener param de salida
	    					 //el resultadoset 
	    List<Cursos> cl = new ArrayList<>();
	    
	    abrirConexion();
	  //obtener el comando de conexion
	    st= miConexion.prepareCall(sql);  	
	 
    
	    //ejecutar el statement
	    rs=st.executeQuery();  
	    

	    //recorro el result set
	    while(rs.next()) {    //rs almacena los registros, y mientras haya registros hacemos esto:
	    	//instanciamos alumnos con el constructor de los datos a mostrar (estos 3)
	    	 c = new Cursos(rs.getString("id_cursos"),  //orden atributos segun constructor
	    			 rs.getString("nombre"),
	    			 rs.getString("practicas"),
	    			 rs.getDouble("precio"),
	    			 rs.getInt("duracion_horas")
	    			 );
	    	
	    	cl.add(c);
	    
	    };
	    cerrarConexion();  //cierro conexion
			return cl;
		
	}
public int insertarCurso (String pid_id_curso,String pid_nombre,String pid_practicas, double pid_precio,
		int pid_duracion_horas) 
		 throws SQLException, ClassNotFoundException{

String sql = "call cursos2.insertarCurso(?,?,?,?,?);";
int registros =0;
//utilizo el CallableStatement pues voy a ejecutar un proc almacenado
CallableStatement st;

abrirConexion();
//obtener el comando de conexion
st= miConexion.prepareCall(sql);  	
//parametro de entrada
st.setString(1, pid_id_curso);
st.setString(2, pid_nombre);
st.setString(3, pid_practicas);
st.setDouble(4, pid_precio);
st.setInt(5, pid_duracion_horas);

//ejecutar el statement
registros=st.executeUpdate();  //como es un alta, tiene q ser un executeUpdate 

cerrarConexion();
return registros;
}

public int bajaCurso (String pid_id_curso) 
		 throws SQLException, ClassNotFoundException{

String sql = "call cursos2.borrarcurso(?);";
int registros =0;
//utilizo el CallableStatement pues voy a ejecutar un proc almacenado
CallableStatement st;

abrirConexion();
//obtener el comando de conexion
st= miConexion.prepareCall(sql);  	
//parametro de entrada
st.setString(1, pid_id_curso);


//ejecutar el statement
registros=st.executeUpdate(); //como es un delete, tiene q ser un executeUpdate 

cerrarConexion();
System.out.println("PA borrar 1 curso, contenido de registros: "+ registros);
return registros;  //si lo ejecuta bien, devolvera un 1
}


public int modificarCursos (String pid_id_cursos_actual,String pid_id_cursos_nuevo, String pid_nombre,String pid_practicas, 
		double pid_precio, int pid_duracion)
		 throws SQLException, ClassNotFoundException{
	System.out.println("entra en el metodo modificar cursos");

String sql = "call cursos2.modificarCurso(?,? ,?, ?,?,?);";
int registros =0;
//utilizo el CallableStatement pues voy a ejecutar un proc almacenado
CallableStatement st;

abrirConexion();
//obtener el comando de conexion
st= miConexion.prepareCall(sql);  	
//parametro de entrada

st.setString(1, pid_id_cursos_actual);
st.setString(2, pid_id_cursos_nuevo);
st.setString(3, pid_nombre);
st.setString(4, pid_practicas);
st.setDouble(5, pid_precio);
st.setInt(6, pid_duracion);


//ejecutar el statement
registros=st.executeUpdate();  //como es un alta, tiene q ser un executeUpdate 
System.out.println("acceso  modificacion profe realizada");
cerrarConexion();
System.out.println("registros =" + registros);
return registros;

}
}
