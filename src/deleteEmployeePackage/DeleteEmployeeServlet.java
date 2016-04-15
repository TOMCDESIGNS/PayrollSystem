package deleteEmployeePackage;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteEmployeeServlet. This class deletes an Employee by id.
 * @author emmancipatemusemwa
 * @version 1.0
 */
@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// gets values of text fields
    
		String emp_ID = request.getParameter("emp_ID");
		
	
	
	
	Connection conn = null;
	
	
	 String message = null; // message will be sent back to client
            
           try {
           	// 1. Get a connection to database
           	DriverManager.registerDriver(new com.mysql.jdbc.Driver());
   			conn = DriverManager.getConnection(
   					"jdbc:mysql://localhost:3306/Payroll", "root", "123456");
   		    
    
               // constructs SQL statement
   			
               String sql = "DELETE FROM  employees_tb WHERE emp_ID = ?";
               PreparedStatement statement = conn.prepareStatement(sql);
              
              
               statement.setString(1, emp_ID);
             
             
   			// sends the statement to the database server
               int row = statement.executeUpdate();
               if (row > 0) {
                   message = "Employee Data Deleted";
               }
           } catch (SQLException ex) {
               message = "ERROR: " + ex.getMessage();
               ex.printStackTrace();
           } finally {
               if (conn != null) {
                   // closes the database connection
                   try {
                       conn.close();
                   } catch (SQLException ex) {
                       ex.printStackTrace();
                   }
               }
               // sets the message in request scope
               request.setAttribute("Message", message);
                
               // forwards to the message page
               getServletContext().getRequestDispatcher("/Message.jsp").forward(request, response);
           }
       }
   }