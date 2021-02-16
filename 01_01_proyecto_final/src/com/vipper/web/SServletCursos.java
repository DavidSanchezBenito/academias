package com.vipper.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vipper.modelo.*;
import com.vipper.persistencia.AccesoCursos;



/**
 * Servlet implementation class SServlet
 */
@WebServlet("/sservletcursos")
public class SServletCursos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SServletCursos() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		/**
		 como viene de un enlace, cogemos los datos por el doGet, no el DoPost
		 Primero hago el borrado.
		 */
		
		System.out.println("entra en el servlet por el DoGet para dar de baja un curso");
		RequestDispatcher rd = null;  //inicializo. Lo necesito para enviar info a otra pagina
		AccesoCursos ac = new AccesoCursos();


		//traigo el ID del alumno que se ha elegido en mostraralumnos
  
		int option = Integer.parseInt (request.getParameter("option"));
			

			switch (option) {
			
//			case 1:   //lo dejo por si metro más adelante otra opcion.
//					  //envio el id a la pagina de modificacion del alumno
//			
//				
//				String pid_alumno1 =  request.getParameter("f_id_alumno");
//
//			
//				request.setAttribute("id_a_modificar", pid_alumno1);
//				rd = request.getRequestDispatcher  //redireccionamos a una pagina jsp los resultados
//			                ("/modificaralumno.jsp");
//				 //en realidad no se va la info hasta que utilicemos el método forward (recoge el 
//					//ambito request y pasa el control)
//				
//				
//			     rd.forward(request, response);    //envio el request
//
//			break;
			
			case 2:   //baja curso
				
	
				String pid_curso =  request.getParameter("f_id_cursos");

			
				int registros2=0; 
					
		    // 1. Llamar a la capa persistencia
		    
		    try {
				registros2 = ac.bajaCurso(pid_curso);  
				 //enviamos la info con los mismos nombres que ya tienen para los List
			
				if (registros2 >0)
				{
					System.out.println("Grabado la baja del curso correctamente");
					
					response.sendRedirect("registrado.html");
					
				}else {
					response.sendRedirect("mostrarerror.jsp");
				}

			
					} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
				response.sendRedirect("mostrarerror.jsp");
					}
			
			break;				

			
			default:
				System.out.println("revisar index para ver la opcion elegida" + ac);
				break;
				
			}	
		}
		 
        
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//recogemos la opcion 1, 2 y 3; op 
	int jopcion = Integer.parseInt(request.getParameter("op"));
		
	System.out.println("entra en el servlet profesores");
	RequestDispatcher rd = null;  //inicializo. Lo necesito para enviar info a otra pagina
	AccesoCursos ac = new AccesoCursos();
	
switch (jopcion) {
//		vengo de index de cursos y habrá dos opciones: 1 y 2
		
		case 1:  //listado cursos
		List<Cursos> listado=null;  //para recoger los datos del resultado
		
		

        // 1. Llamar a la capa persistencia
        
 
        try {
			listado= ac.ObtenerCursos();  
			 //enviamos la info con los mismos nombres que ya tienen para los List
		
			System.out.println("listado de cursos:" + ac);
			request.setAttribute("list_cursos", listado);
			rd = request.getRequestDispatcher  //redireccionamos a una pagina jsp los resultados
		                ("/mostrarcursos.jsp");
			 //en realidad no se va la info hasta que utilicemos el método forward (recoge el 
				//ambito request y pasa el control)
		     rd.forward(request, response);    //envio el request
			
				} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			//response.sendRedirect("mostrarerror.jsp");
				}
		
		break;

	case 2:   //alta curso
		String pid_id =  request.getParameter("fid");
		String pid_nombre =  request.getParameter("fnombre");
		String pid_practicas = request.getParameter("fpracticas");
		double pid_precio = Double.parseDouble (request.getParameter("fprecio"));
		int pid_duracion = Integer.parseInt (request.getParameter("fduracion"));				
		
		Cursos c = new Cursos (pid_id, pid_nombre,pid_practicas, pid_precio, pid_duracion);
		int registros=0; 
			
    // 1. Llamar a la capa persistencia
    
    try {
		registros = ac.insertarCurso (pid_id, pid_nombre,pid_practicas, pid_precio, pid_duracion);  
		 //enviamos la info con los mismos nombres que ya tienen para los List
	
		if (registros >0)
		{
			System.out.println("curso Grabado correctamente");
			System.out.println("datos: " + c);
			response.sendRedirect("registrado.html");
			
		}

			} catch (ClassNotFoundException | SQLException e) {
		e.printStackTrace();
		response.sendRedirect("mostrarerror.jsp");
			}
	
	break;
	
case 3:   //modificacion cursos
		
		System.out.println("opcion marcada case 3: " + jopcion);
		//traigo los datos de la jsp introducidos 
		String pid_id_cursos3 =  request.getParameter("f_id_cursos");
		String pid_id_cursos_n =  request.getParameter("f_id_cursos_n");
		String pid_nombre3 =  request.getParameter("f_nombre");
		String pid_practicas3 =  request.getParameter("f_practicas");
		Double pid_precio3 =  Double.parseDouble(request.getParameter("f_precio"));
		int pid_duracion_horas3 = Integer.parseInt(request.getParameter("f_duracion_horas"));	
		
	System.out.println("datos capturados de la modificacion");
	System.out.println(pid_id_cursos3 + pid_nombre3 + pid_practicas3 + pid_precio3 
	+ pid_duracion_horas3);
		
		int registros3=0; 
			
    // 1. Llamar a la capa persistencia
    
    try {
    	System.out.println("antes de ejecutar el metodo modifc cursos");
		registros3 = ac.modificarCursos(pid_id_cursos3,pid_id_cursos_n, pid_nombre3, pid_practicas3,
				pid_precio3, pid_duracion_horas3
				);  
		
		 //enviamos la info con los mismos nombres que ya tienen para los List
	
		if (registros3 >0)
		{
			System.out.println("Modificacion curso realizada correctamente");
			
			response.sendRedirect("registrado.html");
			
		}else {
			response.sendRedirect("mostrarerror.jsp");
		}
	
			} catch (ClassNotFoundException | SQLException e) {
		e.printStackTrace();
		response.sendRedirect("mostrarerror.jsp");
			}
	
	break;
	
	default:
		System.out.println("revisar index para ver la opcion elegida" + ac);
		break;
	
	
}
	}
}

