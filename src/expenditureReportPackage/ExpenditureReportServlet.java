package expenditureReportPackage;

import java.io.IOException;
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

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/ExpenditureReportServlet")
public class ExpenditureReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		  String  payment_for = request.getParameter("payment_for");
		  String  all = request.getParameter("all");
		
          
		  ArrayList al=null;
		  ArrayList record_list =new ArrayList();
		  if(payment_for != null){
		  String query = 
		  "select * from payments where payment_for ='"+payment_for+"'";
		  
         
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
		  al.add(rs.getString(8));
		 

		  System.out.println("al :: "+al);
		  record_list.add(al);
		  }
          
		  request.setAttribute("recordList",record_list);
		  
		 System.out.println("recordList " + record_list);
		  }
		  
		  
		  if(all != null){
			  
			  String query = 
					  "select * from payments ";
					  
			         
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
					  al.add(rs.getString(8));
					 

					  System.out.println("al :: "+al);
					  record_list.add(al);
					  }
			          
					  request.setAttribute("recordList",record_list);
					  
					 System.out.println("recordList " + record_list);
					  }
		 
		  

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