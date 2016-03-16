package checkAllowancePackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/CheckAllowanceServlet")
public class CheckAllowanceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	 protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
		{
		// TODO Auto-generated method stub
		
		
		System.out.println("MySQL Connect Example.");
		  Connection conn = null;
		  String url = "jdbc:mysql://localhost:3306/";
		  String dbName = "Payroll";
		  String driver = "com.mysql.jdbc.Driver";
		  String userName = "root"; 
		  String password = "123456";

		  
		  Statement st;
		  try {
		  Class.forName(driver).newInstance();
		  conn = DriverManager.getConnection(url+dbName,userName,password);
		  System.out.println("Connected to the database");
		  String  emp_ID  = request.getParameter("emp_ID");
		  String  source_url  = request.getParameter("source_url");
		  String  date_of_payment = request.getParameter("date_of_payment");
		

		  ArrayList al=null;
		  ArrayList payslip_list =new ArrayList();
		  String query = 
		  "select * from payslip where emp_ID ='"+emp_ID+"' AND date_of_payment ='"+date_of_payment+"'";
		  System.out.println("query " + query);
		  st = conn.createStatement();
		  ResultSet  rs = st.executeQuery(query);


		   
		  
		  while(rs.next()){
		  al  = new ArrayList();
		  
		  al.add(rs.getString(1));
		  al.add(rs.getString(2));
		  al.add(rs.getString(3));
		  al.add(rs.getString(4));
		  al.add(rs.getString(5));
		  al.add(rs.getString(6));
		  al.add(rs.getString(7));
		  PrintWriter out = response.getWriter();
			
		  if( rs.getString(3) == null){
			 out.println("<script>alert(1);</script>");
		 
		  
		  }else{
			  
			  out.println("<input type='text' id='gross_salary' name='gross_salary' value='"+rs.getString(7)+"' class='form-control' readonly required/>");
			  
		  }
		  
		  
		  System.out.println("al :: "+al);
		  payslip_list.add(al);
		  }
		  
 
			  
	 
	 
	
		 

		  request.setAttribute("payslipList",payslip_list);
		  
		 System.out.println("payslipList " + payslip_list);

		  // out.println("record_list " + record_list);
		 
		

		  String nextJSP = source_url;
		  RequestDispatcher dispatcher = 
		   getServletContext().getRequestDispatcher(nextJSP);
		  dispatcher.forward(request,response);
		  conn.close();
		  System.out.println("Disconnected from database");
		  } catch (Exception e) {
		  e.printStackTrace();
		  }
		  }
		}