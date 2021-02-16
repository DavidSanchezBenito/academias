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
import com.vipper.persistencia.AccesoProfesores;



/**
 * Servlet implementation class SServlet
 */
@WebServlet("/sservletprofes")
public class SServletProfes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SServletProfes() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		/**
		 como viene de un enlace, cogemos los datos por el doGet, no el DoPost
		 Primero hago el borrado.
		 */
		
		System.out.println("entra en el servlet por el DoGet");
		RequestDispatcher rd = null;  //inicializo. Lo necesito para enviar info a otra pagina
		AccesoProfesores ac = new AccesoProfesores();


		//traigo el ID del alumno que se ha elegido en mostraralumnos
  
		int option = Integer.parseInt (request.getParameter("option"));
			

			switch (option) {
//			
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
//			
			case 2:   //baja profesor
				
	
				String pid_profesor =  request.getParameter("f_id_profesor");

				// Profesores p2 = new Profesores (pid_profesor);
				int registros2=0; 
					
		    // 1. Llamar a la capa persistencia
		    
		    try {
				registros2 = ac.bajaProfesor(pid_profesor);  
				 //enviamos la info con los mismos nombres que ya tienen para los List
			
				if (registros2 >0)
				{
					System.out.println("Grabado la baja profe correctamente");
					
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
	//recogemos la opcion 1 y 2; op 
	int jopcion = Integer.parseInt(request.getParameter("op"));
		
	System.out.println("entra en el servlet profesores");
	RequestDispatcher rd = null;  //inicializo. Lo necesito para enviar info a otra pagina
	AccesoProfesores ac = new AccesoProfesores();
	
switch (jopcion) {
//		vengo de index de profesores y habrá dos opciones: 1 y 2
		
		case 1:  //listado profesores
		List<Profesores> listado=null;  //para recoger los datos del resultado
		
		

        // 1. Llamar a la capa persistencia
        
 
        try {
			listado= ac.ObtenerProfesores();  
			 //enviamos la info con los mismos nombres que ya tienen para los List
		
			System.out.println("listado de profesores:" + ac);
			request.setAttribute("list_profesores", listado);
			rd = request.getRequestDispatcher  //redireccionamos a una pagina jsp los resultados
		                ("/mostrarprofesores.jsp");
			 //en realidad no se va la info hasta que utilicemos el método forward (recoge el 
				//ambito request y pasa el control)
		     rd.forward(request, response);    //envio el request
			
				} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			//response.sendRedirect("mostrarerror.jsp");
				}
		
		break;

	case 2:   //alta profesor
	
		String pid_nombre =  request.getParameter("fnombre");
		String pid_apellidos = request.getParameter("fapellidos");
		String pid_titulacion = request.getParameter("ftitulacion");
		String pid_email = request.getParameter("femail");
		String pid_telefono = request.getParameter("ftelefono");
		String pid_diligencia = request.getParameter("fdiligencia");

				
		
		Profesores p1 = new Profesores (pid_nombre, pid_apellidos,pid_titulacion, pid_email, pid_telefono, pid_diligencia);
		int registros=0; 
			
    // 1. Llamar a la capa persistencia
    
    try {
		registros = ac.altaProfesor(pid_nombre, pid_apellidos,pid_titulacion, pid_email, pid_telefono, pid_diligencia);  
		 //enviamos la info con los mismos nombres que ya tienen para los List
	
		if (registros >0)
		{
			System.out.println("Profesor Grabado correctamente");
			System.out.println("datos: " + p1);
			response.sendRedirect("registrado.html");
			
		}

			} catch (ClassNotFoundException | SQLException e) {
		e.printStackTrace();
		response.sendRedirect("mostrarerror.jsp");
			}
	
	break;
	
case 3:   //modificacion profesor
		
//		System.out.println("opcion marcada " + jopcion);
		//traigo los datos de la jsp introducidos 
		String pid_profesor3 =  request.getParameter("f_id_profesor");
		String pid_nombre3 =  request.getParameter("f_nombre");
		String pid_apellidos3 =  request.getParameter("f_apellidos");
		String pid_titulacion3 =  request.getParameter("f_titulacion");	
		String pid_email3 =  request.getParameter("f_email");
		String pid_telefono3 =  request.getParameter("f_telefono");
		String pid_diligencia3 =  request.getParameter("f_diligencia");	

		System.out.println("datos capturados de la modificacion");
	System.out.println(pid_profesor3 + pid_nombre3 + pid_apellidos3 + pid_titulacion3 + pid_email3 
			+ pid_telefono3 + pid_diligencia3 );
		int registros3=0; 
			
    // 1. Llamar a la capa persistencia
    
    try {
    	System.out.println("antes de ejecutar el metodo");
		registros3 = ac.modificarProfesor(pid_profesor3, pid_nombre3, pid_apellidos3,
				pid_titulacion3, pid_email3, pid_telefono3,	pid_diligencia3
				);  
		
		 //enviamos la info con los mismos nombres que ya tienen para los List
	
		if (registros3 >0)
		{
			System.out.println("Modificacion profesor Grabada correctamente");
			
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

