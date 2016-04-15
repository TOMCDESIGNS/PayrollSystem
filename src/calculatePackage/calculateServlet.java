package calculatePackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.math.RoundingMode;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class calculateServlet. This class calculates allowance.
 * @author emmancipatemusemwa
 * @version 1.0
 */
@WebServlet("/calculateServlet")
public class calculateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	 protected void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
		{
	    	
	    		PrintWriter out = res.getWriter();
	    		
	    		
	    		
	    		Double gross_salary = Double.parseDouble(req.getParameter("gross_salary"));
	    		Double medical =  Double.parseDouble(req.getParameter("medical"));
	    	
	    		Double  overtime = Double.parseDouble(req.getParameter("overtime"));
	    		Double bonus = Double.parseDouble(req.getParameter("bonus"));
	    		Double lunch = Double.parseDouble(req.getParameter("lunch"));
	    		 
	    		
	    		
	    		Double allowance = (medical + overtime + bonus + lunch);
	    		
	    		Double net_salary = (gross_salary + allowance);
	    		
	    		BigDecimal al = new BigDecimal(allowance).setScale(2, RoundingMode.HALF_EVEN);
	    		
	    		BigDecimal ns = new BigDecimal(net_salary).setScale(2, RoundingMode.HALF_EVEN);
	    		allowance =  al.doubleValue();
	    		net_salary =  ns.doubleValue();
	    		
	    		
	    		out.println("<table class='table table-striped table-bordered'>");
	    		
	    		 out.println("<tr><td>Total Allowance</td><td><input type='text' name='allowances' id='allowances'  value='"+allowance+"' class='form-control' required/></td></tr>");
	    		 out.println("<tr><td>Net Salary</td><td><input type='text' name='net_salary' id='net_salary'  value='"+net_salary+"' class='form-control' required/></td></tr>");
	    		 
	    		 out.println("</table>");
	 
		
	 
	}

}
