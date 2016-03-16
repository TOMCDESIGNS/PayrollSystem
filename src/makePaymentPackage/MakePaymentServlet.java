package makePaymentPackage;


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
@WebServlet("/MakePaymentServlet")
public class MakePaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// gets values of text fields
		
		String payslip_id = request.getParameter("payslip_id");
		String emp_ID = request.getParameter("emp_ID");
		String payment_for = request.getParameter("payment_for");
   
        String gross_salary = request.getParameter("gross_salary");
        String allowances = request.getParameter("allowances");
        String deductions = request.getParameter("deductions");
        String net_salary = request.getParameter("net_salary");
    
	
	
	
	Connection conn = null;
	
	
	 String message = null; // message will be sent back to client
            
           try {
           	// 1. Get a connection to database
           	DriverManager.registerDriver(new com.mysql.jdbc.Driver());
   			conn = DriverManager.getConnection(
   					"jdbc:mysql://localhost:3306/Payroll", "root", "123456");
   		    
    
               // constructs SQL statement
   			
               String sql = "INSERT INTO payments (payslip_id, emp_ID, payment_for, gross_salary, allowances, deductions, net_salary) "
               		+ "values (? ,? , ?, ?, ?, ?, ?)";
               PreparedStatement statement = conn.prepareStatement(sql);
               statement.setString(1, payslip_id);
               statement.setString(2, emp_ID);
               statement.setString(3, payment_for );
             
               statement.setString(4, gross_salary);
               statement.setString(5, allowances);
               statement.setString(6, deductions);
               statement.setString(7, net_salary);
              
             
             
   			// sends the statement to the database server
               int row = statement.executeUpdate();
               if (row > 0) {
                   message = "Payment Made to the Employee";
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