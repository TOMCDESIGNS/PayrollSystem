package addEmployeePackage;

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
 * Servlet implementation class addEmployeeServlet
 */
@WebServlet("/addEmployeeServlet")
public class addEmployeeServlet extends HttpServlet {
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
   			
               String sql = "INSERT INTO employees_tb (emp_ID, first_name, last_name, gender, dob, email, phone_number, address, desig, depart, salary, date_joined) "
               		+ "values (? ,? , ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
               PreparedStatement statement = conn.prepareStatement(sql);
               statement.setString(1, emp_ID);
               statement.setString(2, first_name);
               statement.setString(3, last_name);
               statement.setString(4, gender);
               statement.setString(5, dob);
               statement.setString(6, email);
               statement.setString(7, phone_number);
               statement.setString(8, address);
               statement.setString(9, desig);
               statement.setString(10, depart);
               statement.setString(11, salary);
               statement.setString(12, date_joined);
             
             
   			// sends the statement to the database server
               int row = statement.executeUpdate();
               if (row > 0) {
                   message = "Employee Data Saved in the Database";
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