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
import com.vipper.persistencia.AccesoAlumnos;



/**
 * Servlet implementation class SServlet
 */
@WebServlet("/SServletAlumnos")
public class SServletAlumnos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SServletAlumnos() {
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
		AccesoAlumnos ac = new AccesoAlumnos();


		//traigo el ID del alumno que se ha elegido en mostraralumnos
  
		int option = Integer.parseInt (request.getParameter("option"));
			

			switch (option) {
			
			case 1:   //modificacion alumno
					  //envio el id a la pagina de modificacion del alumno
			
				
				String pid_alumno1 =  request.getParameter("f_id_alumno");

			
				request.setAttribute("id_a_modificar", pid_alumno1);
				rd = request.getRequestDispatcher  //redireccionamos a una pagina jsp los resultados
			                ("/modificaralumno.jsp");
				 //en realidad no se va la info hasta que utilicemos el método forward (recoge el 
					//ambito request y pasa el control)
				
				
			     rd.forward(request, response);    //envio el request

			break;
			
			case 2:   //baja alumno
				
				String pid_alumno =  request.getParameter("id_alumno");

				
				
				//Alumno a2 = new Alumno (pid_alumnos);
				int registros2=0; 
					
		    // 1. Llamar a la capa persistencia
		    
		    try {
				registros2 = ac.bajaAlumno(pid_alumno);  
				 //enviamos la info con los mismos nombres que ya tienen para los List
			
				if (registros2 >0)
				{
					System.out.println("Grabado correctamente");
					
					response.sendRedirect("registrado.html");
					
				}else {
					response.sendRedirect("mostrarerror.jsp");
				}
			
//				request.setAttribute("alumno_grabado", a1);
//				rd = request.getRequestDispatcher  //redireccionamos a una pagina jsp los resultados
//			                ("/mostrarresultado.jsp");
//				 //en realidad no se va la info hasta que utilicemos el método forward (recoge el 
//					//ambito request y pasa el control)
//				
//				
//			     rd.forward(request, response);    //envio el request
//				
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
		
	System.out.println("entra en el servlet 0");
	RequestDispatcher rd = null;  //inicializo. Lo necesito para enviar info a otra pagina
	AccesoAlumnos ac = new AccesoAlumnos();
switch (jopcion) {
//		vengo de index para la opcion 1:
		
		case 1:  //listado alumnos
		List<Alumno> listado=null;  //para recoger los datos del resultado
		
		

        // 1. Llamar a la capa persistencia
        
 
        try {
			listado= ac.ObtenerAlumnos();  
			 //enviamos la info con los mismos nombres que ya tienen para los List
		
			
			request.setAttribute("list_alumnos", listado);
			rd = request.getRequestDispatcher  //redireccionamos a una pagina jsp los resultados
		                ("/mostraralumnos.jsp");
			 //en realidad no se va la info hasta que utilicemos el método forward (recoge el 
				//ambito request y pasa el control)
		     rd.forward(request, response);    //envio el request
			
				} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			//response.sendRedirect("mostrarerror.jsp");
				}
		
		break;

	
	case 4:   //alta alumno
	
		String pid_nombre =  request.getParameter("fnombre");
		String pid_apellidos = request.getParameter("fapellidos");
		String pid_curso_pre = request.getParameter("fcursos_pres");
		String pid_curso_pas = request.getParameter("fcursos_pas");
		String pid_email = request.getParameter("femail");
		String pid_telefono = request.getParameter("ftelefono");
		String pid_observaciones = request.getParameter("fobservaciones");
		
		//esto es para un control de grabacion interno
		Alumno a1 = new Alumno (pid_nombre, pid_apellidos, pid_curso_pre, 
				pid_curso_pas,pid_email, pid_telefono,pid_observaciones);
		int registros=0; 
			
    // 1. Llamar a la capa persistencia
    
    try {
		registros = ac.altaAlumno(pid_nombre, pid_apellidos, pid_curso_pre, 
				pid_curso_pas,pid_email, pid_telefono,pid_observaciones);  
		 //enviamos la info con los mismos nombres que ya tienen para los List
	
		if (registros >0)
		{
			System.out.println("alumno Grabado correctamente");
			System.out.println("datos: " + a1);
			response.sendRedirect("registrado.html");
			
		}
	
//		request.setAttribute("alumno_grabado", a1);
//		rd = request.getRequestDispatcher  //redireccionamos a una pagina jsp los resultados
//	                ("/mostrarresultado.jsp");
//		 //en realidad no se va la info hasta que utilicemos el método forward (recoge el 
//			//ambito request y pasa el control)
//		
//		
//	     rd.forward(request, response);    //envio el request
//		
			} catch (ClassNotFoundException | SQLException e) {
		e.printStackTrace();
		response.sendRedirect("mostrarerror.jsp");
			}
	
	break;
	
	case 5:   //baja alumno
		
		String pid_alumno =  request.getParameter("f_id_alumno");

		
		
		//Alumno a2 = new Alumno (pid_alumnos);
		int registros2=0; 
			
    // 1. Llamar a la capa persistencia
    
    try {
		registros2 = ac.bajaAlumno(pid_alumno);  
		 //enviamos la info con los mismos nombres que ya tienen para los List
	
		if (registros2 >0)
		{
			System.out.println("Grabado correctamente");
			
			response.sendRedirect("registrado.html");
			
		}else {
			response.sendRedirect("mostrarerror.jsp");
		}
	
//		request.setAttribute("alumno_grabado", a1);
//		rd = request.getRequestDispatcher  //redireccionamos a una pagina jsp los resultados
//	                ("/mostrarresultado.jsp");
//		 //en realidad no se va la info hasta que utilicemos el método forward (recoge el 
//			//ambito request y pasa el control)
//		
//		
//	     rd.forward(request, response);    //envio el request
//		
			} catch (ClassNotFoundException | SQLException e) {
		e.printStackTrace();
		response.sendRedirect("mostrarerror.jsp");
			}
	
	break;
	
case 6:   //modificacion alumno
		
		String pid_alumno1 =  request.getParameter("f_id_alumno");
		String pid_nombre1 =  request.getParameter("fnombre");
		String pid_apellidos1 =  request.getParameter("fapellidos");
		String pid_curso_pre1 =  request.getParameter("fcurso_pres");
		String pid_curso_pas1 =  request.getParameter("fcurso_pas");
		String pid_email1 =  request.getParameter("femail");
		String pid_telefono1 =  request.getParameter("ftelefono");
		String pid_observaciones1 =  request.getParameter("fobservaciones");
		
		System.out.println("datos q trae:" + pid_alumno1 + pid_nombre1 + pid_apellidos1 );
		
		//Alumno a2 = new Alumno (pid_alumnos);
		int registros3=0; 
			
    // 1. Llamar a la capa persistencia
    
    try {
		registros3 = ac.modificarAlumno(pid_alumno1, pid_nombre1, pid_apellidos1,
				pid_curso_pre1,pid_curso_pas1,pid_email1,pid_telefono1,pid_observaciones1);  
		 //enviamos la info con los mismos nombres que ya tienen para los List
	
		if (registros3 >0)
		{
			System.out.println("Grabado correctamente");
			
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

