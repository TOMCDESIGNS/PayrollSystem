package calculateDeductionPackage;

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
 * Servlet implementation class calculateServlet
 */
@WebServlet("/CalculateDeductionServlet")
public class CalculateDeductionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	 protected void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
		{
	    	
	    		PrintWriter out = res.getWriter();
	    		
	    		 
	    		
	    		Double advance_pay = Double.parseDouble(req.getParameter("advance_pay"));
	    		Double leaves =  Double.parseDouble(req.getParameter("leaves"));
	    	
	    		Double  gst = Double.parseDouble(req.getParameter("gst"));
	    		Double other_tax = Double.parseDouble(req.getParameter("other_tax"));
	    		Double gross_salary = Double.parseDouble(req.getParameter("gross_salary"));
	    		 
	    		
	    		Double gvt = (gross_salary * gst);
	    		
	    		Double otherT = (gross_salary * other_tax);
	    		
	    		Double deduction = (advance_pay + leaves + otherT + gvt);
	    		
	    		Double net_salary = (gross_salary - deduction);
	    		
	    		BigDecimal dd = new BigDecimal(deduction).setScale(2, RoundingMode.HALF_EVEN);
	    		
	    		BigDecimal ns = new BigDecimal(net_salary).setScale(2, RoundingMode.HALF_EVEN);
	    		deduction =  dd.doubleValue();
	    		net_salary =  ns.doubleValue();
	    		
	    		
	    		out.println("<table class='table table-striped table-bordered'>");
	    		
	    		 out.println("<tr><td>Total Deductions </td><td><input type='text' name='deductions' id='deductions'  value='"+deduction+"' class='form-control' required/></td></tr>");
	    		 out.println("<tr><td>Net Salary</td><td><input type='text' name='net_salary' id='net_salary'  value='"+net_salary+"' class='form-control' required/></td></tr>");
	    		 
	    		 out.println("</table>");
	 
		
	 
	}

}
