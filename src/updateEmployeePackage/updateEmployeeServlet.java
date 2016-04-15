package updateEmployeePackage;

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
 * Servlet implementation class updateEmployeeServlet. This class updates employee Data in the database
 * @author emmancipatemusemwa
 * @version 1.0
 */
@WebServlet("/updateEmployeeServlet")
public class updateEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// gets values of text fields
    
		String emp_ID = request.getParameter("emp_ID");
		String first_name = request.getParameter("first_name");
        String last_name= request.getParameter("last_name");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String phone_number = request.getParameter("phone_number");
        String address = request.getParameter("address");
        String desig = request.getParameter("desig");
        String depart = request.getParameter("depart");
        String salary = request.getParameter("salary");
        String date_joined = request.getParameter("date_joined");
	
	
	
	Connection conn = null;
	
	
	 String message = null; // message will be sent back to client
            
           try {
           	// 1. Get a connection to database
           	DriverManager.registerDriver(new com.mysql.jdbc.Driver());
   			conn = DriverManager.getConnection(
   					"jdbc:mysql://localhost:3306/Payroll", "root", "123456");
   		    
    
               // constructs SQL statement
   			
               String sql = "UPDATE  employees_tb SET  first_name = ?, last_name = ?, gender = ?, dob = ?, email = ?, phone_number =?, address = ?, desig = ?, depart = ?, salary = ?, date_joined = ? WHERE emp_ID = ?";
               PreparedStatement statement = conn.prepareStatement(sql);
              
               statement.setString(1, first_name);
               statement.setString(2, last_name);
               statement.setString(3, gender);
               statement.setString(4, dob);
               statement.setString(5, email);
               statement.setString(6, phone_number);
               statement.setString(7, address);
               statement.setString(8, desig);
               statement.setString(9, depart);
               statement.setString(10, salary);
               statement.setString(11, date_joined);
               statement.setString(12, emp_ID);
             
             
   			// sends the statement to the database server
               int row = statement.executeUpdate();
               if (row > 0) {
                   message = "Employee Data Updated";
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